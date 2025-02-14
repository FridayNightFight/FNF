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
			[_forEachIndex] call FNF_ClientSide_fnc_watchDestroy;
		};
		case "fnf_module_sectorCaptureObj":
		{
			[_forEachIndex] call FNF_ClientSide_fnc_watchCaptureSector;
		};
		case "fnf_module_sectorHoldObj":
		{
			[_forEachIndex] call FNF_ClientSide_fnc_watchHoldSector;
		};
		case "fnf_module_terminalObj":
		{
			[_forEachIndex] call FNF_ClientSide_fnc_watchTerminal;
		};
		case "fnf_module_assassinObj":
		{
			[_forEachIndex] call FNF_ClientSide_fnc_watchAssassin;
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
