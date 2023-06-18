[{getClientStateNumber >= 10 && !isNil "fnf_briefing_table_objects" && !isNil "fnf_ui"}, {

  (values fnf_briefing_table_objects) params (keys fnf_briefing_table_objects);

  private "_varset";
  switch (playerSide) do {
    case west: {_varset = [west, _west]};
    case east: {_varset = [east, _east]};
    case independent: {_varset = [independent, _guer]};
  };

  _varset params ["_thisSide", "_sideTables"];
  _thisSideStr = _thisSide call BIS_fnc_sideNameUnlocalized;

  {
    private _table = _x;
    private _tableName = _table getVariable "helperName";
    // "debug_console" callExtension str(_this);

    private _tableVar = _table getVariable "checkVar";
    // "debug_console" callExtension str(_var);

    // add tables to the UI helpers
    (fnf_ui getVariable "HelperTargets") pushBack [
      compile format["missionNamespace getVariable [""%1"", objNull]", _tableVar],
      compile format[
        "_targetInfo = %1 getVariable [""tableTarget"", []];
        _loadedView = %1 getVariable [""loadedView"", """"];
        if (count _targetInfo > 0) then {
          if (_loadedView != (_targetInfo#0)) then {
            (""%2"" + "" - "" + _targetInfo#0 + "" - "" + ""Please re-load!"")
          } else {
            (""%2"" + "" - "" + _targetInfo#0)
          };
        } else {""%2""};
        ",
        _tableVar,
        _tableName
      ],
      "",
      false,
      _thisSide,
      15,
      1.6
    ];


    private _parentAction = [
      format["%1_actions", _tableVar],
      format["%1 Actions", _tableName],
      "",{},
      {
        vehicle _player == _player && (
          if (fnf_gamemode != "sustainedAssault") then {
            (missionNamespace getVariable ["fnf_safetyEnabled", true])
          } else {true}
        )
      },
    {},[],[0,0,1.3],7] call ace_interact_menu_fnc_createAction;
    [_table,0,[],_parentAction] call ace_interact_menu_fnc_addActionToObject;



    // SET/CHANGE PARENT
    private _action = [
      "Set_Change",
      "Set/Change Focus",
      "",
      {},
      {true}
    ] call ace_interact_menu_fnc_createAction;
    [
      _table,
      0,
      [format["%1_actions", _tableVar]],
      _action
    ] call ace_interact_menu_fnc_addActionToObject;



    { // take each view determined by server and add an action that allows players to display it on a table
      _x params ["_viewName", "_position"];

      private _action = [
        _viewName,
        _viewName,
        "",
        {
          params ["_target", "_player", "_params"];
          _params params ["_table", "_tableName", "_position", "_viewName"];

          (_table getVariable ["tableTarget", []]) apply {deleteMarker _x};

          private _marker = createMarkerLocal [format["%1_targetMark", _table getVariable "checkVar"], _position, 1, _player];
          if (_marker isEqualTo "") exitWith {systemChat "Could not create marker to display contents of table."};
          _marker setMarkerTypeLocal "mil_box";
          _marker setMarkerShapeLocal "RECTANGLE";
          _marker setMarkerColorLocal "ColorBlack";
          _marker setMarkerBrushLocal "Border";
          _marker setMarkerAlphaLocal 1;
          _marker setMarkerSize [200, 200];

          _markerSize = getMarkerSize _marker;
          // private _cx = selectRandom([1, -1]) * (_markerSize#0);
          private _cx = _markerSize#0;
          private _cy = -(_markerSize#1) + ((diag_tickTime/2) random ((_markerSize#1)*2));
          _corner = (getMarkerPos _marker) vectorAdd [_cx, _cy, 0];

          private _label = createMarkerLocal [format["%1_targetLabel", _table getVariable "checkVar"], _corner, 1, _player];
          _label setMarkerShapeLocal "ICON";
          _label setMarkerTypeLocal "mil_dot";
          _label setMarkerColorLocal "ColorBlack";
          _label setMarkerAlphaLocal 0.8;
          _label setMarkerTextLocal format["%1 focus", _tableName];
          _label setMarkerSize [0.1,0.1];

          _table setVariable ["tableTarget", [_viewName, _marker, _label], true];

          format["[%3ing Table] %1 set %2 as the focus", name _player, _viewName, _tableName] remoteExecCall ["systemChat", allPlayers select {_x distance _table < 10}];
        }, // statement
        {true}, // condition
        {}, // generate child items
        [_table, _tableName, _position, _viewName]
      ] call ace_interact_menu_fnc_createAction;

      [
        _table,
        0,
        [format["%1_actions", _tableVar], "Set_Change"],
        _action
      ] call ace_interact_menu_fnc_addActionToObject;
    } forEach fnf_briefing_table_views;





    // LOAD/CLEAR PARENT
    private _action = [
      "Load_Clear",
      "Load/Clear Table",
      "",
      {},
      {true},
      {
        params ["_target", "_player", "_params"];
        _params params ["_table"];
        private _loadActions = [];
        {
          _x params ["_resolution", "_performance"];

          private _subAction = [
            format["Resolution %1", _resolution],
            format["Load at %1%2 resolution %3", _resolution, "%", _performance],
            "",
            {
              params ["_target", "_player", "_params"];
              _params params ["_table", "_resolution"];

              private _targetInfo = _table getVariable ["tableTarget", []];
              if (count _targetInfo == 0) exitWith {
                systemChat format["[%1ing Table] No focus is set for this table yet.", _table getVariable "helperName"];
              };

              if (!isNil "fnf_briefingTable_creationHandle") then {
                if (scriptDone fnf_briefingTable_creationHandle) then {
                  fnf_briefingTable_creationHandle = [_table, _targetInfo#1, _targetInfo#0, _resolution, 2, true] spawn fnf_briefing_fnc_createTable;
                } else {
                  systemChat "Briefing table isn't done loading! Please try again soon.";
                };
              } else {
                fnf_briefingTable_creationHandle = [_table, _targetInfo#1, _targetInfo#0, _resolution, 2, true] spawn fnf_briefing_fnc_createTable;
              };
            },
            {true},
            {},
            [_table, _resolution]
          ] call ace_interact_menu_fnc_createAction;

          _loadActions pushBack [_subAction, [], _table]; // New action, it's children, and the action's target
        } forEach [
          [10, "(laptop)"],
          [30, "(low-end)"],
          [50, "(gaming pc)"]
          // [100, "(insane!)"]
        ];
        _loadActions
      },
      [_table]
    ] call ace_interact_menu_fnc_createAction;

    [
      _table,
      0,
      [format["%1_actions", _tableVar]],
      _action
    ] call ace_interact_menu_fnc_addActionToObject;


    // CLEAR TABLE
    private _action = [
      "Clear",
      "Clear off",
      "",
      {
        params ["_target", "_player", "_params"];
        _params params ["_table"];
        [_table] spawn fnf_briefing_fnc_clearTable
      },
      {true},
      {},
      [_table]
    ] call ace_interact_menu_fnc_createAction;

    [
      _table,
      0,
      [format["%1_actions", _tableVar], "Load_Clear"],
      _action
    ] call ace_interact_menu_fnc_addActionToObject;








    // safestart cleanup waiter
    [{!(missionNamespace getVariable ["fnf_safetyEnabled", true])}, {
      {
        if (typeName _x == "STRING") then {
          deleteMarker _x;
        };
      } forEach (_this getVariable ["tableTarget", []]);
    }, _table] call CBA_fnc_waitUntilAndExecute;

  } forEach (_sideTables select {!isNull _x});

}] call CBA_fnc_waitUntilAndExecute;
