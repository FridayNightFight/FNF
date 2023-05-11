/*
	Author: Mallen

	Description:
		Starts counting down until safezone can be removed

	Parameter(s):
		0: STRING -  The zone prefix used by the zone
    1: INTEGER -  The amount of minutes from mission sart until the safe zone is removed

	Returns:
		None
*/

params["_zonePrefix", "_timeZoneIsDeleted"];

[{
  params["_zonePrefix", "_timeZoneIsDeleted"];
  _timeServerStarted = missionNamespace getVariable ["fnf_startTime", 0];
  _result = objNull;
  if (isServer and hasInterface) then
  {
    _result = time > (_timeZoneIsDeleted * 60);
  } else {
    _result = (serverTime - _timeServerStarted) > (_timeZoneIsDeleted * 60);
  };
  _result;
},{
  params["_zonePrefix", "_timeZoneIsDeleted"];
  ["safeZoneGroup", _zonePrefix] call FNF_ClientSide_fnc_removeZoneFromRestrictionGroup;
  if (not (["safeZoneGroup"] call FNF_ClientSide_fnc_areAnyZonesInRestrictionGroup)) then
  {
    ["<t size='1.5' align='center'>Safe Zones Dropped</t><br/><br/><t align='center'>The safe zones have been dropped and the mission is now starting</t><br/>", "teal"] call FNF_ClientSide_fnc_notificationSystem;
    ["safeZoneGroup"] call FNF_ClientSide_fnc_removeRestrictionGroup;
  };
  [_zonePrefix] call FNF_ClientSide_fnc_removeZone;
}, [_zonePrefix, _timeZoneIsDeleted]] call CBA_fnc_waitUntilAndExecute;
