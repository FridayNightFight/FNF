//WIP

fnf_maxGrassCutters = 10;
fnf_grassCutters = 0;

_action = ["GrassCut",format ["Remove Grass %1/%2", fnf_grassCutters, fnf_maxGrassCutters],"",{
  createVehicle ["Land_ClutterCutter_medium_F", player modelToWorld [0,1.75,0], [], 0, "CAN_COLLIDE"];
  fnf_grassCutters = fnf_grassCutters + 1;
  systemChat format ["Grass removals: %1/%2", fnf_grassCutters, fnf_maxGrassCutters];
},{"ACE_EntrenchingTool" in items player}] call ace_interact_menu_fnc_createAction;

[(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment"], _action] call ace_interact_menu_fnc_addActionToClass;
