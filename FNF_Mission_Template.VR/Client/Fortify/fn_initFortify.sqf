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

_allServerFortifyObjects = missionNamespace getVariable ["fnf_globalFortifyObjectsList", []];

{
	[_x] call FNF_ClientSide_fnc_addDestructionEH;
} forEach _allServerFortifyObjects;

//Allow fortify placed objects to be destroyed by demo blocks and satchels
["acex_fortify_objectPlaced", {
	params ["_player", "_side", "_objectPlaced"];

	if (_player isEqualTo player) then
	{
		_allServerFortifyObjects = missionNamespace getVariable ["fnf_globalFortifyObjectsList", []];
		_allServerFortifyObjects pushBackUnique _objectPlaced;
		missionNamespace setVariable ["fnf_globalFortifyObjectsList", _allServerFortifyObjects, true];
		//send to server list of fortify objects
	};

	[_objectPlaced] call FNF_ClientSide_fnc_addDestructionEH;

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
