[{!(isNull findDisplay 46) && missionNamespace getVariable ["fnf_staggeredLoaded",false]}, {

  // [fnf_ui_handle_SLIcons] call CBA_fnc_removePerFrameHandler;
  fnf_ui_handle_SLIcons = [{

    // remove if not safe start
    if (!(missionNamespace getVariable ["fnf_safetyEnabled", true])) then {_handle call CBA_fnc_removePerFrameHandler};

    // skip if ACE spectator is drawing group/name icons so as not to clash
    if (missionNamespace getVariable ["ace_spectator_drawunits", false] && ace_spectator_isSet) exitWith {};

    // skip if in objectivePreviewCamera
    if (!isNil "fnf_fnc_objectivePreview_Cam") exitWith {};

    _slUnits = (units playerSide) select {
      (_x getVariable ["fnfLoadout", "BASE"]) isEqualTo "PL"
    };

    private _templateGroups = (missionNamespace getVariable ["fnf_templateGroupsListExtended", []]);
    if (count _templateGroups == 0) then {continue};

    // address squad leads (_Soldier_SL_F unit class & is leader of their group, to exclude CMD HQ auxiliaries)
    {
      private _targetPositionAGLTop = _x modelToWorldVisual (_x selectionPosition "Head");
      _targetPositionAGLTop set [2, (_targetPositionAGLTop select 2) + 1.5];

      // private _thisName = "";
      // private _role = "";
      // if (["@", roleDescription _x] call BIS_fnc_inString) then {
      //   _role = (roleDescription _x splitString '@');
      //   if (count _role > 1) then {
      //     if (count (_role # 1) > 0) then {
      //       _thisName = _role # 1;
      //     } else {
      //       _thisName = roleDescription _x;
      //     };
      //   } else {
      //     _thisName = _role;
      //   };
      // } else {
      //   _thisName = roleDescription _x;
      // };

      private _unit = _x;

      private _groupArr = _templateGroups select {(_x # 0) isEqualTo (_unit getVariable ["fnf_startGroup", []])};
      if (count _groupArr == 0) then {continue};
      private _groupNameShort = _groupArr # 0 # 2;
      private _thisName = _groupNameShort;


      if (player distance _x <= 120) then {
        _facColor = [playerSide] call BIS_fnc_sideColor;
        _facColor = _facColor apply {
          if (_x != 0) then {
            (_x + 0.3) min 1
          } else {
            _x
          };
        };
        _facColor set [3, 1];
        drawIcon3D["", _facColor, _targetPositionAGLTop, 0, 0, 0, _thisName, true, 0.015 / (getResolution select 5), "PuristaBold", "center"];
      };
    } forEach (_slUnits select {!(isNull _x) && alive _x});
  }] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_waitUntilAndExecute;
