/*
Adds an action for players with an entrenching tool to remove grass around them.
*/

if (isNil "fnf_maxGrassCutters" && isNil "fnf_grassCutters") then {
  fnf_maxGrassCutters = 6;
  fnf_grassCutters = 0;
};

private _action = ["GrassCut",format ["Remove Grass %1/%2", fnf_grassCutters, fnf_maxGrassCutters],"",{
  createVehicle ["Land_ClutterCutter_large_F", player modelToWorld [0,2.2,0], [], 0, "CAN_COLLIDE"];
  fnf_grassCutters = fnf_grassCutters + 1;

  [typeOf player, 1, ["ACE_SelfActions","ACE_Equipment","ace_trenches","GrassCut"]] call ace_interact_menu_fnc_removeActionFromClass;
  call fnf_fnc_grassCut;
},{fnf_grassCutters < fnf_maxGrassCutters}] call ace_interact_menu_fnc_createAction;

[typeOf player, 1, ["ACE_SelfActions","ACE_Equipment","ace_trenches"], _action] call ace_interact_menu_fnc_addActionToClass;
