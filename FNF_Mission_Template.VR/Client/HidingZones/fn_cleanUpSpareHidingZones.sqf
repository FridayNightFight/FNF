/*
	Author: Mallen

	Description:
		removes the markers of all hiding zones not needed

	Parameter(s):
		0: ARRAY -  An array of all hiding zone modules

	Returns:
		None
*/

params["_modules"];

{
  _prefix = _x getVariable "fnf_prefix";
  _result = [_prefix] call FNF_ClientSide_fnc_verifyZone;
  if (not _result) then
  {
    [_prefix, false, false] call FNF_ClientSide_fnc_addZone;
    [_prefix, false, false] call FNF_ClientSide_fnc_removeZone;
  };
} forEach _modules;
