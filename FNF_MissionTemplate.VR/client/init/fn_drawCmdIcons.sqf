[{!(isNull findDisplay 46) && missionNamespace getVariable ["phx_staggeredLoaded",false]}, {

  // [fnf_ui_handle_commandIcons] call CBA_fnc_removePerFrameHandler;
  fnf_ui_handle_commandIcons = [{

    // remove if not safe start
    if (!(missionNamespace getVariable ["phx_safetyEnabled", true])) then {_handle call CBA_fnc_removePerFrameHandler};

    _cmdUnits = (units playerSide) select {
      // ["officer", typeOf _x] call BIS_fnc_inString
      typeOf _x in ["B_officer_F","O_officer_F","I_officer_F"]
    };

    // address officers (CMD, PL)
    {
      // skip if ACE spectator is drawing group/name icons so as not to clash
      if (missionNamespace getVariable ["ace_spectator_drawunits", false] && ace_spectator_isSet) exitWith {};

      // skip if in objectivePreviewCamera
      if (!isNil "fnf_fnc_objectivePreview_Cam") exitWith {};

				private _targetPositionAGLTop = _x modelToWorldVisual (_x selectionPosition "Head");
	      _targetPositionAGLTop set [2, (_targetPositionAGLTop select 2) + 1.5];

      // _thisName = format["%1: %2", ((roleDescription _x) splitString "@")# 0, name _x];
      // _thisName = groupId (group _x);
      private _thisName = "PL";
			_color = [playerSide] call BIS_fnc_sideColor;
			_color set [3,1];

      if (player distance _x <= 120) then {
        drawIcon3D["", _color, _targetPositionAGLTop, 0.6 / (getResolution select 5), 0.6 / (getResolution select 5), 0, _thisName, true, 0.02 / (getResolution select 5), "PuristaBold", "center"];
      };
    } forEach _cmdUnits;
  }] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_waitUntilAndExecute;
