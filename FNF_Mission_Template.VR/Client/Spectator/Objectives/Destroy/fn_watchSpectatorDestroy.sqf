/*
	Author: Mallen

	Description:
    watch a destroy objective for spectators

	Parameter(s):
		1: ARRAY - Array that objective is stored in

	Returns:
		Boolean
*/

params["_objEntry"];

_objEntry params["_objType","_objectiveModule","_objectiveObject","_objNum","_task"];

if (alive _objectiveObject) exitWith
{
  false;
};

_targetConfig = _objectiveObject call CBA_fnc_getObjectConfig;
_targetPic = [_targetConfig >> "editorPreview", "STRING", "\A3\EditorPreviews_F\Data\CfgVehicles\Box_FIA_Ammo_F.jpg"] call CBA_fnc_getConfigEntry;
_targetName = getText (_targetConfig >> "DisplayName");

["<t size='1.5' align='center'>Objective " + _objNum + " Complete</t><br/><br/><t align='center'>" + _targetName + " has been destroyed</t><br/><br/>" + _targetPic, "success", 10, 20] call FNF_ClientSide_fnc_notificationSystem;

true;
