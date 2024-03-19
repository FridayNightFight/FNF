/*
	Author: Mallen

	Description:
    watch a terminal objective including updating task, returns if objective has been completed (failed for protection objectives)

	Parameter(s):
		0: OBJECT -  The terminal objective object to be processed

	Returns:
		Boolean
*/

params["_objectiveObject", "_objectiveModule"];

_timeOfCompletion = _objectiveObject getVariable ['fnf_currentlyHackingCompletionTime', -1];

_timeServerStarted = missionNamespace getVariable ["fnf_startTime", 0];
_result = objNull;
if (isServer and hasInterface) then
{
  _result = time > _timeOfCompletion;
} else {
  _result = (serverTime - _timeServerStarted) > _timeOfCompletion;
};
if (time < 1) then
{
  _result = false;
};
if (_timeOfCompletion isEqualTo -1) then
{
  _result = false;
};

if (_result) then
{
  _objectiveModule setVariable ["fnf_objComplete", true, true];

  _objectiveObject setVariable ['fnf_currentlyHackingCompletionTime', 2, true];

  _completedExplosion = _objectiveObject getVariable ['fnf_explosionHandeled', false];

  if (_completedExplosion isEqualTo false) then
  {
    _objectiveObject setVariable ['fnf_explosionHandeled', true, false];
    playSound3D ["fnf_sounds\sounds\bomb_alarm.ogg", _objectiveObject];
    [{
      hideObjectGlobal _this;
      "Bo_GBU12_LGB" createVehicle (getposATL _this);
    },_objectiveObject,12] call CBA_fnc_waitAndExecute;
  };
};

_result;
