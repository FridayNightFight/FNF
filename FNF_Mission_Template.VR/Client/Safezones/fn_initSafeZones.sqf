/*
	Author: Mallen

	Description:
		Sets up the required safe zones specified by modules

	Parameter(s):
		0: ARRAY -  An array of all safezone modules

	Returns:
		None
*/

params ["_modules"];

//safe zones require weapon disabling
call FNF_ClientSide_fnc_initWeaponDisable;

_safeZoneRestrictionGroupSet = false;
_spareSafeZones = [];
_maxTimeZoneIsDeleted = 0;

{
  _syncedObjects = synchronizedObjects _x;
  _visibleToAllies = _x getVariable "fnf_visibleToAllies";
  _visibleToEnemies = _x getVariable "fnf_visibleToEnemies";
  _zonePrefix = _x getVariable ["fnf_prefix", "FAILED"];
  _timeZoneIsDeleted = _x getVariable "fnf_timeZoneIsDeleted";

  if (_zonePrefix == "FAILED") then
  {
    if (fnf_debug) then
    {
      systemChat "DANGER: Safe zone does not have marker prefix set, safe zone will NOT function"
    };
    continue;
  };

  _showZone = false;
  _forPlayer = false;
  {
    //check if safezone is for player
    if (_x == player) then
    {
      _forPlayer = true;
      break;
    };
    //check if player should see safezone for other reasons
    if (isPlayer _x and not _showZone) then
    {
      _zoneSide = side _x;
      if ([playerSide, _zoneSide] call BIS_fnc_sideIsFriendly) then
      {
        if (_visibleToAllies) then
        {
          _showZone = true;
        };
      } else {
        if (_visibleToEnemies) then
        {
          _showZone = true;
        };
      };
    };
  } forEach _syncedObjects;

  //if for the player setup the safe zone
  if (_forPlayer) then
  {
    if (_timeZoneIsDeleted > _maxTimeZoneIsDeleted) then
    {
      _maxTimeZoneIsDeleted = _timeZoneIsDeleted;
    };

    //check if the safezone group has been created, if not create it
    if (not _safeZoneRestrictionGroupSet) then
    {
      ["safeZoneGroup", true, true] call FNF_ClientSide_fnc_addRestrictionGroup;
      _safeZoneRestrictionGroupSet = true;
    };
    _result = [_zonePrefix, "", true, false] call FNF_ClientSide_fnc_addZone;
    if (_result) then
    {
      ["safeZoneGroup", _zonePrefix] call FNF_ClientSide_fnc_addZoneToRestrictionGroup;
      [_zonePrefix, _timeZoneIsDeleted] call FNF_ClientSide_fnc_startSafeZoneTimer;
    };
    continue;
  };

  if (_showZone) then
  {
    _result = [_zonePrefix, "", true, false] call FNF_ClientSide_fnc_addZone;
    if (_result) then
    {
      [_zonePrefix, _timeZoneIsDeleted] call FNF_ClientSide_fnc_startSafeZoneTimer;
    } else {
      if (fnf_debug) then
      {
        systemChat "DANGER: Safe zone failed to be initialised, safe zone will NOT function"
      };
    };
    continue;
  };

  //add zone to remove spare markers if zone is not for player
  _spareSafeZones pushBack _zonePrefix;

} forEach _modules;

//remove all spare safe zones
{
  _zonePrefix = _x;
  _result = [_zonePrefix] call FNF_ClientSide_fnc_verifyZone;
  if (not _result) then
  {
    [_zonePrefix, "", false, false] call FNF_ClientSide_fnc_addZone;
    [_zonePrefix] call FNF_ClientSide_fnc_removeZone;
  };
} forEach _spareSafeZones;

//if safe zones have a time limit to them
if (_maxTimeZoneIsDeleted != 0) then
{
  fnf_timerMessage = "Safe Start Remaining: %1";
  fnf_timerEndTime = _maxTimeZoneIsDeleted * 60;

  _timeToNotify = (_maxTimeZoneIsDeleted * 60) - 300;

  //if time to notify player of 5 minutes remaining has yet to come
  if (_timeToNotify > 0) then
  {
    //set timer to notify when time is reached
    [{
      params["_timeToNotify"];
      _timeServerStarted = missionNamespace getVariable ["fnf_startTime", 0];
      _result = objNull;
      if (isServer and hasInterface) then
      {
        _result = time > _timeToNotify;
      } else {
        _result = (serverTime - _timeServerStarted) > _timeToNotify;
      };
      if (time < 1) then
      {
        _result = false;
      };
      _result;
    },{
      true call FNF_ClientSide_fnc_showTimerInHUD;
      ["<t size='1.5' align='center'>Safe Zones Drop in 5 Minutes</t>", "info"] call FNF_ClientSide_fnc_notificationSystem;
    }, _timeToNotify] call CBA_fnc_waitUntilAndExecute;

  } else {
    //otherwise just keep the timer showing in HUD
    true call FNF_ClientSide_fnc_showTimerInHUD;
  };
};
