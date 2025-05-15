/*
	Author: Mallen

	Description:
		add the event handler to an object to destroy it if it is hit by an explosion

	Parameter(s):
		0: OBJECT - Object that should be destroyed by an explosion

	Returns:
		boolean
*/

params["_object"];

_object removeAllEventHandlers "Explosion";

if (isNil "fnf_fortifyDestructionObjectHolder") then
{
	fnf_fortifyDestructionObjectHolder = createHashMap;
};

_object addEventHandler ["Explosion", {
	params ["_vehicle", "_damage", "_explosionSource"];

	_damageValueFromSourceMap = createHashMapFromArray [
		["ACE_DemoCharge_Remote_Ammo_Thrown", 1],
		["DemoCharge_Remote_Ammo", 1],
		["ACE_SatchelCharge_Remote_Ammo_Thrown", 2],
		["SatchelCharge_Remote_Ammo", 2]
	];

	_fortificationSturdinessValueMap = createHashMapFromArray [
		["Land_BagFence_01_short_green_F", 1],
		["Land_BagFence_Short_F", 1],
		["Land_BagFence_01_long_green_F", 1],
		["Land_BagFence_Long_F", 1],
		["Land_BagFence_01_round_green_F", 1],
		["Land_BagFence_Round_F", 1],
		["Land_Plank_01_4m_F", 1],
		["Land_Plank_01_8m_F", 1],
		["Land_Razorwire_F", 1],
		["Hedgehog", 1],
		["Land_BagBunker_01_small_green_F", 1],
		["Land_BagBunker_Small_F", 1],
		["Land_HBarrier_01_wall_4_green_F", 2],
		["Land_HBarrierWall4_F", 2],
		["Land_HBarrier_01_wall_corner_green_F", 2],
		["Land_HBarrierWall_corner_F", 2],
		["Land_HBarrier_01_wall_6_green_F", 2],
		["Land_HBarrierWall6_F", 2],
		["Land_HBarrier_01_tower_green_F", 2],
		["Land_BagBunker_Tower_F", 2],
		["Land_BagBunker_01_large_green_F", 2],
		["Land_BagBunker_Large_F", 2],
		["Land_Bunker_01_small_F", 3],
		["Land_Bunker_01_big_F", 3],
		["Land_Bunker_01_HQ_F", 3],
		["Land_Bunker_01_tall_F", 3]
	];

	_sourceType = typeOf _explosionSource;
	_damageValue = _damageValueFromSourceMap getOrDefault [_sourceType, 0];

	if (_damageValue isEqualTo 0) exitWith {};

	_fortificationType = typeOf _vehicle;
	_sturdinessValue = _fortificationSturdinessValueMap getOrDefault [_fortificationType, 3];

	if (_sturdinessValue > _damageValue) exitWith {};

	_explosionDistance = _vehicle distance _explosionSource;

	if (_explosionDistance > 8) exitWith {};

	_result = _vehicle getVariable ["fnf_handlingFortificationDestruction", false];

	if (_result) exitWith {};

	_vehicle setVariable ["fnf_handlingFortificationDestruction", true, true];

	_idOfDestruction = count fnf_fortifyDestructionObjectHolder;
	fnf_fortifyDestructionObjectHolder set [_idOfDestruction, _vehicle];

	[{
		_idOfDestruction = _this select 0;
		_object = fnf_fortifyDestructionObjectHolder get _idOfDestruction;

		_type = typeOf _object;

		_objectPosition = _object getVariable ["fnf_truePosition", []];

		if (_objectPosition isEqualTo []) then
		{
			_objectPosition = getPosATL _object;
		};

		_objectVectorUp = vectorUp _object;
		_objectVectorDir = vectorDir _object;

		deleteVehicle _object;

		_objectPosition set [2, ((_objectPosition select 2) - 0.25)];

		_newObject = createVehicle [_type, _objectPosition, [], 0, "CAN_COLLIDE"];

		_newObject setVariable ["fnf_truePosition", _objectPosition];

		_newObject setVectorDirAndUp [_objectVectorDir, _objectVectorUp];

		fnf_fortifyDestructionObjectHolder set [_idOfDestruction, _newObject];

		if ((_objectPosition select 2) < -10) then
		{
			deleteVehicle _newObject;
			[_this select 1] call CBA_fnc_removePerFrameHandler;
		};
	}, 0.15, _idOfDestruction] call CBA_fnc_addPerFrameHandler;
}];
