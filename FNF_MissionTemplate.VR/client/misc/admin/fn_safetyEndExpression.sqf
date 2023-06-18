/*
* Author: Martin
*
* Description:
* Validates whether to end safestart. Prompted by admin diary entry.
*
* Arguments:
* <NONE>
*
* Return Value:
* <NONE>
*
* Example:
* "<execute expression='call fnf_admin_fnc_safetyEndExpression'>End Safe Start</execute>"
*
* Public: No
*/

[] spawn {
  private _result = true;

  if (hasInterface) then {
    _result = ["Are you sure you want to end safestart?", "Confirm", true, true] call BIS_fnc_guiMessage;
  };

  if (_result) then {
    ["FNF_Safety_EndNow", [player]] call CBA_fnc_serverEvent;
  };
};
