//Make sure player stays inside safe start markers
_side = side player;
startMarkers = [];
safeZoneWarning = false;
playerInStart = true;

switch (_side) do {
  case east: {
    startMarkers = ["opforSafeMarker"];
  };
  case west: {
    startMarkers = ["bluforSafeMarker"];
  };
  case independent: {
    startMarkers = ["indforSafeMarker"];
  };
};

if !(typeName startSelectionSide == "BOOL") then {
  if (_side == startSelectionSide) then {
    _defaultStartMarkers = ["startSelectionMarker_1","startSelectionMarker_2","startSelectionMarker_3"];

    {
      if !(getMarkerColor _x == "") then {
        startMarkers pushBack _x;
      };
    } forEach _defaultStartMarkers;

    startActions = ["startLocations","Select start location","",{},{true}] call ace_interact_menu_fnc_createAction;

    startSelectAction = ["Tele","Go to main start","",{
      switch (side player) do {
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
    startSelectAction_1 = ["Tele1","Go to start 1","",{
      "startSelectionMarker_1" execVM "f\safeStart\teleport.sqf"
    },{true}] call ace_interact_menu_fnc_createAction;
    startSelectAction_2 = ["Tele2","Go to start 2","",{
      "startSelectionMarker_2" execVM "f\safeStart\teleport.sqf"
    },{true}] call ace_interact_menu_fnc_createAction;
    startSelectAction_3 = ["Tele3","Go to start 3","",{
      "startSelectionMarker_3" execVM "f\safeStart\teleport.sqf"
    },{true}] call ace_interact_menu_fnc_createAction;

    [(typeOf player), 1, ["ACE_SelfActions"],startActions] call ace_interact_menu_fnc_addActionToClass;
    [(typeOf player), 1, ["ACE_SelfActions","startLocations"],startSelectAction] call ace_interact_menu_fnc_addActionToClass;
    [(typeOf player), 1, ["ACE_SelfActions","startLocations"],startSelectAction_1] call ace_interact_menu_fnc_addActionToClass;
    [(typeOf player), 1, ["ACE_SelfActions","startLocations"],startSelectAction_2] call ace_interact_menu_fnc_addActionToClass;
    [(typeOf player), 1, ["ACE_SelfActions","startLocations"],startSelectAction_3] call ace_interact_menu_fnc_addActionToClass;
  };
};

notInStart = {
  _timeAllowed = 15;
  while {!playerInStart && alive player && phx_safeStartEnabled} do {
    for [{_i=_timeAllowed}, {_i>0}, {_i=_i-1}] do {
      if (playerInStart || !phx_safeStartEnabled) exitWith {safeZoneWarning = false; hintSilent "sad"};
      hintSilent format ["You have %1 seconds to get back into the safe zone.", _i];
      sleep 1;
    };
    if (!playerInStart && phx_safeStartEnabled) then {
      safeZoneWarning = false;
      player setDamage 1;
    };
  };
  hintSilent "";
};

safeStartZonePFH = [{
  _pos = getPos vehicle player;
  for [{_i=0}, {_i<=(count startMarkers)-1}, {_i=_i+1}] do {
    if (_pos inArea (startMarkers select _i)) then {
      playerInStart = true;
    } else {
      playerInStart = false;
    };
    if (playerInStart) exitWith {};
  };
  if (playerInStart) exitWith {};
  if (!playerInStart && !safeZoneWarning) then {
    [] spawn notInStart;
    safeZoneWarning = true;
  };
  }, 0.5, []] call CBA_fnc_addPerFrameHandler;
