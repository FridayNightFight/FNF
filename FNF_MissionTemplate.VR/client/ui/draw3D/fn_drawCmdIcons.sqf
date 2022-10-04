[{!(isNull findDisplay 46) && missionNamespace getVariable ["fnf_staggeredLoaded",false]}, {

  // [fnf_ui_handle_commandIcons] call CBA_fnc_removePerFrameHandler;
  fnf_ui_handle_commandIcons = [{

    // remove if not safe start
    if (!(missionNamespace getVariable ["fnf_safetyEnabled", true])) then {_handle call CBA_fnc_removePerFrameHandler};

    _cmdUnits = (units playerSide) select {
      ["officer", typeOf _x] call BIS_fnc_inString &&
      (_x getVariable ["fnfLoadout", "BASE"]) in ["CC","EO","SGT"]
    };

    // address officers (CMD, PL)
    {
      // skip if ACE spectator is drawing group/name icons so as not to clash
      if (missionNamespace getVariable ["ace_spectator_drawunits", false] && ace_spectator_isSet) exitWith {};

      // skip if in objectivePreviewCamera
      if (!isNil "fnf_fnc_objectivePreview_Cam") exitWith {};

      private _targetPositionAGLTop = _x modelToWorldVisual (_x selectionPosition "Head");
      _targetPositionAGLTop set [2, (_targetPositionAGLTop select 2) + 3];

      // _thisName = format["%1: %2", ((roleDescription _x) splitString "@")# 0, name _x];
      // _thisName = groupId (group _x);
      private _thisName = format["CMD %1", _x getVariable ["fnfLoadout", "CC"]];

      if (player distance _x <= 120) then {
        drawIcon3D["", [1, 1, 1, 0.9], _targetPositionAGLTop, 0.6 / (getResolution select 5), 0.6 / (getResolution select 5), 0, _thisName, true, 0.015 / (getResolution select 5), "PuristaBold", "center"];
      };
    } forEach (_cmdUnits select {!(isNull _x) && alive _x});
  }] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_waitUntilAndExecute;
