/*
	Author: Mallen

	Description:
		Runs watch scripts on all objectives

	Parameter(s):
		None

	Returns:
		None
*/

{
	_x params ["_objState", "_module", "_task", "_alliedTask", "_codeOnCompletion", "_params"];

	if (_objState isNotEqualTo 3) then {continue;};

	_objType = typeOf _module;
	switch (_objType) do {
		case "fnf_module_destroyObj":
		{
			[_forEachIndex] call FNF_ClientSide_fnc_watchSpectatorDestroy;
		};
		case "fnf_module_sectorCaptureObj":
		{
			[_forEachIndex] call FNF_ClientSide_fnc_watchSpectatorCaptureSector;
		};
		case "fnf_module_terminalObj":
		{
			[_forEachIndex] call FNF_ClientSide_fnc_watchSpectatorTerminal;
		};
		case "fnf_module_assassinObj":
		{
			[_forEachIndex] call FNF_ClientSide_fnc_watchSpectatorAssassin;
		};
		default
		{
			if (fnf_debug) then
			{
				systemChat "DANGER: Objective has no valid type code, contact FNF staff";
			};
		};
	};
} forEach fnf_objectives;
