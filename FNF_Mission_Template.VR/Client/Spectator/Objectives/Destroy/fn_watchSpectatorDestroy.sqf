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

_desc = taskDescription _task;
_splitString = (_desc select 1) splitString " ";
_splitString deleteRange [0, 3];
_item = _splitString joinString " ";
_image = _desc select 0;
_splitImage = _image splitString ">";
_image = (_splitImage select 0) + ">";
_image = _image regexReplace ["width='300'", "size='6' align='center'"];

_targetConfig = _objectiveObject call CBA_fnc_getObjectConfig;
_targetPic = [_targetConfig >> "editorPreview", "STRING", "\A3\EditorPreviews_F\Data\CfgVehicles\Box_FIA_Ammo_F.jpg"] call CBA_fnc_getConfigEntry;
_targetName = getText (_targetConfig >> "DisplayName");

["<t size='1.5' align='center'>Objective " + _objNum + " Complete</t><br/><br/><t align='center'>" + _item + " has been destroyed</t><br/><br/>" + _image, "success", 10, 20] call FNF_ClientSide_fnc_notificationSystem;

true;
