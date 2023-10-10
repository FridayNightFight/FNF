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

//check if zone has been created, if it hasnt remove all the markers that would make up other zones
{
  _prefix = _x getVariable ["fnf_prefix", "FAILED"];

  if (_prefix == "FAILED") then
  {
    if (fnf_debug) then
    {
      systemChat "WARNING: Hiding zone does not have a valid zone prefix and will not function";
    };
    continue;
  };
  _result = [_prefix] call FNF_ClientSide_fnc_verifyZone;
  if (not _result) then
  {
    [_prefix, "", false, false] call FNF_ClientSide_fnc_addZone;
    [_prefix] call FNF_ClientSide_fnc_removeZone;
  };
} forEach _modules;
