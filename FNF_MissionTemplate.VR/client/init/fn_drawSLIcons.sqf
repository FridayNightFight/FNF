[{!(isNull findDisplay 46) && missionNamespace getVariable ["phx_staggeredLoaded",false]}, {

  // [fnf_ui_handle_SLIcons] call CBA_fnc_removePerFrameHandler;
  fnf_ui_handle_SLIcons = [{

    // remove if not safe start
    if (!(missionNamespace getVariable ["phx_safetyEnabled", true])) then {_handle call CBA_fnc_removePerFrameHandler};

    // skip if ACE spectator is drawing group/name icons so as not to clash
    if (missionNamespace getVariable ["ace_spectator_drawunits", false] && ace_spectator_isSet) exitWith {};

    // skip if in objectivePreviewCamera
    if (!isNil "fnf_fnc_objectivePreview_Cam") exitWith {};

    _slUnits = (units playerSide) select {
      typeOf _x in ["B_Soldier_SL_F", "O_Soldier_SL_F", "I_Soldier_SL_F"]
    };

    // address squad leads (_Soldier_SL_F unit class & is leader of their group, to exclude CMD HQ auxiliaries)
    {
      private _targetPositionAGLTop = _x modelToWorldVisual (_x selectionPosition "Head");
      _targetPositionAGLTop set [2, (_targetPositionAGLTop select 2) + 1];

      private _unit = _x;

      private _group = _x getVariable ["phx_startGroup", group _x];
      private _groupId = groupId _group;

      if (player distance _x <= 120) then {
        _facColor = [1,1,1,1];
        /*
        _facColor = _facColor apply {
          if (_x != 0) then {
            (_x + 0.3) min 1
          } else {
            _x
          };
        };
        _facColor set [3, 1];
        */
        drawIcon3D["", _facColor, _targetPositionAGLTop, 0, 0, 0, _groupId, true, 0.015 / (getResolution select 5), "PuristaBold", "center"];
      };
    } forEach _slUnits;
  }] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_waitUntilAndExecute;
