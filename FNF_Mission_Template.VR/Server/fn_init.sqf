if (!isServer) exitWith {};

_modules = call FNF_ClientSide_fnc_findFNFModules;

//check if init module is found
_initModule = [_modules, "init"] call FNF_ClientSide_fnc_findSpecificModules;
if (count _initModule isEqualTo 0) exitWith {};
if (count _initModule > 1) exitWith {};

//start syncing timer for all players, important this is set up ASAP
[_initModule select 0] call FNF_ServerSide_fnc_syncTimer;

//setup fortify structures
[_initModule select 0] call FNF_ServerSide_fnc_initFortify;

//start admin channel
call FNF_ServerSide_fnc_initAdmin;

//start handeleing disconnects
[_modules] call FNF_ServerSide_fnc_handleDisconnect;

_breifingModules = [_modules, "breifingAssets"] call FNF_ClientSide_fnc_findSpecificModules;
[_breifingModules] call FNF_ServerSide_fnc_handleVicInvincibility;

[_breifingModules] call FNF_ServerSide_fnc_handleVicRadios;

//check there are objectives
_objModules = [_modules, "Obj"] call FNF_ClientSide_fnc_findSpecificModules;
if (count _objModules isNotEqualTo 0) then
{
	[_objModules] call FNF_ServerSide_fnc_initObjs;
};

//if there are objectives start watching them
if (not isNil "fnf_serverObjectives") then
{
	[{call FNF_ServerSide_fnc_watchObjs;}, 1] call CBA_fnc_addPerFrameHandler;
};

[{
	time > 0.1;
}, {
	{
		deleteVehicle _x;
	} forEach allDeadMen;
}] call CBA_fnc_waitUntilAndExecute;
