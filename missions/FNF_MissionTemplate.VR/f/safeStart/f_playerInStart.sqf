//Make sure player stays inside safe start markers
_side = playerSide;
phx_startMarkers = [];
phx_safeZoneWarning = false;
phx_playerInStart = true;

switch (_side) do {
  case east: {
    phx_startMarkers = ["opforSafeMarker"];
  };
  case west: {
    phx_startMarkers = ["bluforSafeMarker"];
  };
  case independent: {
    phx_startMarkers = ["indforSafeMarker"];
  };
};

if !(typeName phx_startSelectionSide == "BOOL") then {
  if (_side == phx_startSelectionSide) then {
    _defaultStartMarkers = ["startSelectionMarker_1","startSelectionMarker_2","startSelectionMarker_3"];

    {
      if !(getMarkerColor _x == "") then {
        phx_startMarkers pushBack _x;
      };
    } forEach _defaultStartMarkers;

    startActions = ["startLocations","Select start location","",{},{true}] call ace_interact_menu_fnc_createAction;

    _startSelectAction = ["Tele","Go to main start","",{
      switch (playerSide) do {
        case east: {
          "opforSafeMarker" execVM "f\safeStart\teleport.sqf";
        };
        case west: {
          "bluforSafeMarker" execVM "f\safeStart\teleport.sqf";
        };
        case independent: {
          "indforSafeMarker" execVM "f\safeStart\teleport.sqf";
        };
      };
    },{true}] call ace_interact_menu_fnc_createAction;
    _startSelectAction_1 = ["Tele1","Go to start 1","",{
      "startSelectionMarker_1" execVM "f\safeStart\teleport.sqf"
    },{true}] call ace_interact_menu_fnc_createAction;
    _startSelectAction_2 = ["Tele2","Go to start 2","",{
      "startSelectionMarker_2" execVM "f\safeStart\teleport.sqf"
    },{true}] call ace_interact_menu_fnc_createAction;
    _startSelectAction_3 = ["Tele3","Go to start 3","",{
      "startSelectionMarker_3" execVM "f\safeStart\teleport.sqf"
    },{true}] call ace_interact_menu_fnc_createAction;

    [(typeOf player), 1, ["ACE_SelfActions"],startActions] call ace_interact_menu_fnc_addActionToClass;
    [(typeOf player), 1, ["ACE_SelfActions","startLocations"],_startSelectAction] call ace_interact_menu_fnc_addActionToClass;
    [(typeOf player), 1, ["ACE_SelfActions","startLocations"],_startSelectAction_1] call ace_interact_menu_fnc_addActionToClass;
    [(typeOf player), 1, ["ACE_SelfActions","startLocations"],_startSelectAction_2] call ace_interact_menu_fnc_addActionToClass;
    [(typeOf player), 1, ["ACE_SelfActions","startLocations"],_startSelectAction_3] call ace_interact_menu_fnc_addActionToClass;
  };
};

phx_notInStart = {
  _timeAllowed = 15;
  while {!phx_playerInStart && alive player && phx_safeStartEnabled} do {
    for [{_i=_timeAllowed}, {_i>0}, {_i=_i-1}] do {
      if (phx_playerInStart || !phx_safeStartEnabled) exitWith {phx_safeZoneWarning = false; hintSilent "sad"};
      hintSilent format ["You have %1 seconds to get back into the safe zone.", _i];
      sleep 1;
    };
    if (!phx_playerInStart && phx_safeStartEnabled) then {
      phx_safeZoneWarning = false;
      player setDamage 1;
    };
  };
  hintSilent "";
};

safeStartZonePFH = [{
  _pos = getPos vehicle player;
  for [{_i=0}, {_i<=(count phx_startMarkers)-1}, {_i=_i+1}] do {
    if (_pos inArea (phx_startMarkers select _i)) then {
      phx_playerInStart = true;
    } else {
      phx_playerInStart = false;
    };
    if (phx_playerInStart) exitWith {};
  };
  if (phx_playerInStart) exitWith {};
  if (!phx_playerInStart && !phx_safeZoneWarning) then {
    [] spawn phx_notInStart;
    phx_safeZoneWarning = true;
  };
  }, 0.5, []] call CBA_fnc_addPerFrameHandler;
