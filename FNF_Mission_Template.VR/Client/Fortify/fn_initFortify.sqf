/*
	Author: Mallen

	Description:
		Sets up the Fortify system and ensures players with no fortify tool at start do not have the ability to fortify

	Parameter(s):
		0: MODULE -	The FNF init module

	Returns:
		None
*/

params["_module"];

_fortifyEnabled = true;

fnf_fortifyPoints = _module getVariable ["fnf_fortifyPoints", 0];

//Allow fortify placed objects to be destroyed by demo blocks and satchels
["acex_fortify_objectPlaced", {
	params ["_player", "_side", "_objectPlaced"];

	_objectPlaced addEventHandler ["Explosion", {
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

		[{
			_objToDestroy = _this select 0;
			_pos = getPosASL _objToDestroy;
			_pos set [2, ((_pos select 2) - 0.25)];
			_objToDestroy setPosASL _pos;

			if ((_pos select 2) < -10) then
			{
				[_objToDestroy, true] remoteExec ["hideObjectGlobal", 2];
				[_this select 1] call CBA_fnc_removePerFrameHandler;
			};
		}, 0.15, _vehicle] call CBA_fnc_addPerFrameHandler;
	}];

}] call CBA_fnc_addEventHandler;

//if player does not spawn with a fortify tool, they cannot fortify, and therefor should have it disabled
if !([player, "ACE_Fortify"] call BIS_fnc_hasItem) exitWith
{
	call FNF_ClientSide_fnc_disableFortify;
};

//Function made by Killzone_Kid. From A3 Wiki.
//TODO: make this local, reduce global space objects
KK_fnc_inHouse = {
	lineIntersectsSurfaces [
		getPosWorld _this,
		getPosWorld _this vectorAdd [0, 0, 50],
		_this, objNull, true, 1, "GEOM", "NONE"
	] select 0 params ["","","","_house"];

	if (_house isKindOf "House") exitWith { true };

	false
};

[{
		params ["_unit", "_object", "_cost"];
		_canPlace = true;
		_errorStr = "";

		//if player is in a house, do not let them place
		if (_object call KK_fnc_inHouse) then {
			_canPlace = false;
			_errorStr = "<t align='center'>Cannot place objects within buildings</t>"
		};

		//when would this even be triggered?
		if (_cost > fnf_fortifyPoints) then {
			_canPlace = false;
			_errorStr = "<t align='center'>Cannot place object, not enough funds</t>";
		};

		//if can place, update the fortify points and allow, other wise error out and deny
		if (_canPlace) then {

			missionNamespace setVariable ["ace_fortify_budget_west", -1, false];
			missionNamespace setVariable ["ace_fortify_budget_east", -1, false];
			missionNamespace setVariable ["ace_fortify_budget_guer", -1, false];

			fnf_fortifyPoints = fnf_fortifyPoints - _cost;

			["<t align='center'>Fortify Budget: " + str(fnf_fortifyPoints) + "</t>", "info"] call FNF_ClientSide_fnc_notificationSystem;
		} else {
			[_errorStr, "error"] call FNF_ClientSide_fnc_notificationSystem;
		};

		_canPlace
}] call acex_fortify_fnc_addDeployHandler;

//when fortify object is deleted update custom fortify points
["acex_fortify_objectDeleted", {
	if !((_this select 0) isEqualTo player) exitWith {};
	_type = typeOf (_this select 2);
	_fortifyObjsArr = [];
	_fortifyVarStr = "";
	_cost = 0;

	missionNamespace setVariable ["ace_fortify_budget_west", -1, false];
	missionNamespace setVariable ["ace_fortify_budget_east", -1, false];
	missionNamespace setVariable ["ace_fortify_budget_guer", -1, false];

	switch (playerSide) do {
		case east: {
			_fortifyVarStr = "ace_fortify_objects_east";
		};
		case west: {
			_fortifyVarStr = "ace_fortify_objects_west";
		};
		case independent: {
			_fortifyVarStr = "ace_fortify_objects_guer";
		};
	};

	_fortifyObjsArr = missionNamespace getVariable _fortifyVarStr;

	{
		if ((_x select 0) isEqualTo _type) then {
			_cost = (_x select 1);
		};
	} forEach _fortifyObjsArr;

	fnf_fortifyPoints = fnf_fortifyPoints + _cost;

	["<t align='center'>Fortify Budget: " + str(fnf_fortifyPoints) + "</t>", "info"] call FNF_ClientSide_fnc_notificationSystem;
}] call CBA_fnc_addEventHandler;

//when player starts fortify tool add the points they should have so its all accurate in native UI
["ace_interactMenuOpened", {
	if ((_this select 0) isEqualTo 0) exitWith {};

	missionNamespace setVariable ["ace_fortify_budget_west", fnf_fortifyPoints, false];
	missionNamespace setVariable ["ace_fortify_budget_east", fnf_fortifyPoints, false];
	missionNamespace setVariable ["ace_fortify_budget_guer", fnf_fortifyPoints, false];

}] call CBA_fnc_addEventHandler;


if (_module getVariable ["fnf_disableFortifyBlufor", false] and playerSide isEqualTo blufor) then
{
	call FNF_ClientSide_fnc_disableFortify;
};
if (_module getVariable ["fnf_disableFortifyOpfor", false] and playerSide isEqualTo opfor) then
{
	call FNF_ClientSide_fnc_disableFortify;
};
if (_module getVariable ["fnf_disableFortifyIndfor", false] and playerSide isEqualTo independent) then
{
	call FNF_ClientSide_fnc_disableFortify;
};
