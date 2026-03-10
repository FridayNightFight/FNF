/*
	Author: Mallen

	Description:
		add the event handler to an object to destroy it if it is hit by an explosion or large caliber round

	Parameter(s):
		0: OBJECT - Object that should be destroyed by an explosion or large caliber round

	Returns:
		boolean
*/

params["_object"];

//Remove any existing event handelers on the object
_object removeAllEventHandlers "Explosion";
_object removeAllEventHandlers "HitPart";

//setup destruction global variable
if (isNil "fnf_fortifyDestructionObjectHolder") then
{
	fnf_fortifyDestructionObjectHolder = createHashMap;
};

//AT: Hit values
//M136 HEAT: 290
//M136 HEDP: 235
//M136 HP: 290
//M3 MAAWS HEAT: 290
//M3 MAAWS HEDP: 290
//M3 MAAWS HE: 75
//M72A7: 235
//MAAWS Mk4 HEAT 75: 495
//MAAWS Mk4 HEAT 55: 450
//MAAWS Mk4 HE: 200
//SMAW HEAA: 290
//SMAW HEDP: 235
//M80: 290
//RPG-18: 290
//RPG-26: 290
//RPG-32 HEAT: 480
//RPG-32 HE: 200
//RPG-75: 290
//RSHG2: 80
//RPG-7 OG-7V: 75
//RPG-7 PG-7V: 290
//RPG-7 PG-7VL: 290
//RPG-7 PG-7VM: 290
//RPG-7 PG-7VR: 290
//RPG-7 PG-TBG7V: 120

//AutoCannon: hit value
//BTR-80A AP: 95
//BTR-80A HE: 50
//BMP-2 AP: 90
//BMP-2 HE: 50
//M2A2 AP: 90
//M2A2 HE: 30
//LAV-25 AP: 90
//LAV-25 HE: 30
//Warrior AP: 120
//Warrior HE: 90
//BTR-90 AP: 60
//BTR-90 HE: 50

//Master list of hitpoints and sturdiness
_fortificationHitPointMap = createHashMapFromArray [
	["Land_BagFence_01_short_green_F", [30, 1]],
	["Land_BagFence_Short_F", [30, 1]],
	["Land_BagFence_01_long_green_F", [30, 1]],
	["Land_BagFence_Long_F", [30, 1]],
	["Land_BagFence_01_round_green_F", [30, 1]],
	["Land_BagFence_Round_F", [30, 1]],
	["Land_Plank_01_4m_F", [10, 1]],
	["Land_Plank_01_8m_F", [10, 1]],
	["Land_Razorwire_F", [-1, 1]],
	["Hedgehog", [40, 1]],
	["Land_BagBunker_01_small_green_F", [100, 1]],
	["Land_BagBunker_Small_F", [100, 1]],
	["Land_HBarrier_01_wall_4_green_F", [200, 2]],
	["Land_HBarrierWall4_F", [200, 2]],
	["Land_HBarrier_01_wall_corner_green_F", [200, 2]],
	["Land_HBarrierWall_corner_F", [200, 2]],
	["Land_HBarrier_01_wall_6_green_F", [200, 2]],
	["Land_HBarrierWall6_F", [200, 2]],
	["Land_HBarrier_01_tower_green_F", [250, 2]],
	["Land_BagBunker_Tower_F", [250, 2]],
	["Land_BagBunker_01_large_green_F", [300, 2]],
	["Land_BagBunker_Large_F", [300, 2]],
	["Land_Bunker_01_small_F", [-1, 3]],
	["Land_Bunker_01_big_F", [-1, 3]],
	["Land_Bunker_01_HQ_F", [-1, 3]],
	["Land_Bunker_01_tall_F", [-1, 3]]
];

//check if object has Hitpoint map set, if not set it
_result = _object getVariable ["fnf_fortifyDestructionHitpoints", []];
if (_result isEqualTo []) then
{
	_fortificationType = typeOf _object;
	_HitPointValue = _fortificationHitPointMap getOrDefault [_fortificationType, [-1, 3]];
	_object setVariable ["fnf_fortifyDestructionHitpoints", _HitPointValue, true];
};

//For hitpoint related destruction (AT or Autocannon)
_object addEventHandler ["HitPart", {
	_object = (_this select 0 select 0);

	//Get current hitpoints
	_HitPointValue = _object getVariable ["fnf_fortifyDestructionHitpoints", [-1, 3]];
	_HitPoints = _HitPointValue select 0;

	//if less than zero it does not have hitpoints and can be ignored
	if (_HitPoints < 0) exitWith {};

	_highestDamage = 0;

	{
		_x params [
			"_target", "_shooter", "_projectile", "_position", "_velocity",
			"_selection", "_ammo", "_vector", "_radius", "_surfaceType",
			"_isDirect", "_instigator"
		];

		_damage = (_ammo select 0);

		//if ammo is not powerful do not count the hit
		if (_damage <= 30) then
		{
			continue;
		};

		_objectsHit = _projectile getVariable ["fnf_fortifyDestructionObjectsHit", []];

		//Check if this projectile has hit the object before, if it has it cannot apply more damage
		if (_target in _objectsHit) then
		{
			continue;
		} else {
			_objectsHit pushBack _target;
			_projectile setVariable ["fnf_fortifyDestructionObjectsHit", _objectsHit, false];
		};

		//Standardise Autocannon and AT damage values
		if (_damage <= 120) then
		{
			_damage = 10;
		} else {
			_damage = 150;
		};

		//see if damage is more than already highest damage
		if (_damage > _highestDamage) then
		{
			_highestDamage = _damage;
		}
	} forEach _this;

	//resolve damage calculation
	_HitPoints = _HitPoints - _highestDamage;

	//update hitpoints for other shooters
	_HitPointValue set [0, _HitPoints];
	_object setVariable ["fnf_fortifyDestructionHitpoints", _HitPointValue, true];

	//if object still alive stop
	if (_HitPoints > 0) exitWith {};

	//check if object is already being destroyed, if yes, stop
	_result = _object getVariable ["fnf_handlingFortificationDestruction", false];

	if (_result) exitWith {};

	//tell other EHs that destruction is handeled
	_object setVariable ["fnf_handlingFortificationDestruction", true, true];

	//put the object being destroyed in global Var for tracking as new objs are created for destruction effects and so object will change
	_idOfDestruction = count fnf_fortifyDestructionObjectHolder;
	fnf_fortifyDestructionObjectHolder set [_idOfDestruction, _object];

	[{
		//get object being destroyed
		_idOfDestruction = _this select 0;
		_object = fnf_fortifyDestructionObjectHolder get _idOfDestruction;

		_type = typeOf _object;

		//try and find its true position as getPosATL is finicky so position must be tracked seperatly
		_objectPosition = _object getVariable ["fnf_truePosition", []];

		//if no pos found use this to start with
		if (_objectPosition isEqualTo []) then
		{
			_objectPosition = getPosATL _object;
		};

		_objectVectorUp = vectorUp _object;
		_objectVectorDir = vectorDir _object;

		deleteVehicle _object;

		//move object down slightly
		_objectPosition set [2, ((_objectPosition select 2) - 0.25)];

		//create new object in same instant to show a sinking effect
		_newObject = createVehicle [_type, _objectPosition, [], 0, "CAN_COLLIDE"];

		_newObject setVariable ["fnf_truePosition", _objectPosition];

		_newObject setVectorDirAndUp [_objectVectorDir, _objectVectorUp];

		//track new object for further effects
		fnf_fortifyDestructionObjectHolder set [_idOfDestruction, _newObject];

		//if object is sufficiently in the ground we can stop sending it down and delete it for good
		if ((_objectPosition select 2) < -10) then
		{
			deleteVehicle _newObject;
			[_this select 1] call CBA_fnc_removePerFrameHandler;
		};
	}, 0.15, _idOfDestruction] call CBA_fnc_addPerFrameHandler;
}];

//For sturdiness related destruction (Demo blocks or Satchels)
_object addEventHandler ["Explosion", {
	params ["_vehicle", "_damage", "_explosionSource"];

	_damageValueFromSourceMap = createHashMapFromArray [
		["ACE_DemoCharge_Remote_Ammo_Thrown", 1],
		["DemoCharge_Remote_Ammo", 1],
		["ACE_SatchelCharge_Remote_Ammo_Thrown", 2],
		["SatchelCharge_Remote_Ammo", 2]
	];

	//get the explosion power of source
	_sourceType = typeOf _explosionSource;
	_damageValue = _damageValueFromSourceMap getOrDefault [_sourceType, 0];

	if (_damageValue isEqualTo 0) exitWith {};

	//get how sturdy the object is
	_HitPointValue = _vehicle getVariable ["fnf_fortifyDestructionHitpoints", [-1, 3]];
	_sturdinessValue = _HitPointValue select 1;

	//if damage cannot match sturdy, stop
	if (_sturdinessValue > _damageValue) exitWith {};

	_explosionDistance = _vehicle distance _explosionSource;

	//if explosion too far away, stop
	if (_explosionDistance > 8) exitWith {};

	//check if object is already being destroyed, if yes, stop
	_result = _vehicle getVariable ["fnf_handlingFortificationDestruction", false];

	if (_result) exitWith {};

	//tell other EHs that destruction is handeled
	_vehicle setVariable ["fnf_handlingFortificationDestruction", true, true];

	//put the object being destroyed in global Var for tracking as new objs are created for destruction effects and so object will change
	_idOfDestruction = count fnf_fortifyDestructionObjectHolder;
	fnf_fortifyDestructionObjectHolder set [_idOfDestruction, _vehicle];

	[{
		//get object being destroyed
		_idOfDestruction = _this select 0;
		_object = fnf_fortifyDestructionObjectHolder get _idOfDestruction;

		_type = typeOf _object;

		//try and find its true position as getPosATL is finicky so position must be tracked seperatly
		_objectPosition = _object getVariable ["fnf_truePosition", []];

		//if no pos found use this to start with
		if (_objectPosition isEqualTo []) then
		{
			_objectPosition = getPosATL _object;
		};

		_objectVectorUp = vectorUp _object;
		_objectVectorDir = vectorDir _object;

		deleteVehicle _object;

		//move object down slightly
		_objectPosition set [2, ((_objectPosition select 2) - 0.25)];

		//create new object in same instant to show a sinking effect
		_newObject = createVehicle [_type, _objectPosition, [], 0, "CAN_COLLIDE"];

		_newObject setVariable ["fnf_truePosition", _objectPosition];

		_newObject setVectorDirAndUp [_objectVectorDir, _objectVectorUp];

		//track new object for further effects
		fnf_fortifyDestructionObjectHolder set [_idOfDestruction, _newObject];

		//if object is sufficiently in the ground we can stop sending it down and delete it for good
		if ((_objectPosition select 2) < -10) then
		{
			deleteVehicle _newObject;
			[_this select 1] call CBA_fnc_removePerFrameHandler;
		};
	}, 0.15, _idOfDestruction] call CBA_fnc_addPerFrameHandler;
}];
