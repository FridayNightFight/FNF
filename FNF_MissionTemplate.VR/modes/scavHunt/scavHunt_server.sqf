// Only run server-side
if (!isServer) exitWith {};

#include "..\..\mode_config\scavHunt.sqf"

// Lower game mode to 40 minutes
phx_missionTimeLimit = 40;
publicVariable "phx_missionTimeLimit";

// Get present sides
phx_sidesInMission = [east, west, independent] select {playableSlotsNumber _x > 3};


/*
[OBJECT_NAME, MARKER_NAME, OBJECT_DESCRIPTION, INDEX]
*/
private _scavHuntObjectives = [];
for "_i" from 1 to _numberOfObjectives do {
	private _obj = missionNamespace getVariable [format["scav_obj_%1", _i], objNull];
	if !(isNull _obj) then {
		private _name = "Weapons Cache";
		if (typeOf _obj != "Box_FIA_Ammo_F") then {
			_name = [configfile >> "CfgVehicles" >> typeOf _obj] call BIS_fnc_displayName;
		};
		_scavHuntObjectives pushBack [
			_obj,
			format["scav_obj_%1_mark", _i],
			_name,
			_i
		];
	};
};

private _scavHuntTransports = [];
for "_i" from 1 to (_numberOfTransportsPerSide * (count phx_sidesInMission)) do {
	private _obj = missionNamespace getVariable [format["scav_transport_%1", _i], objNull];
	if !(isNull _obj) then {
		_scavHuntTransports pushBack _obj;
	};
};



// Create array of objectives and transports and push to global var for use in other scripts
phx_scavHuntObjDetails = _scavHuntObjectives;
phx_scavHuntObjs = phx_scavHuntObjDetails apply {_x select 0};
phx_scavHuntTransports = _scavHuntTransports;

// Prep capturable objects
{
  _x allowDamage false;
  _x setVariable ["capturedBy", sideUnknown, true];
  _x setVariable ["phx_objLoaded", false, true];
  _x setVariable ["phx_isRevealed", false, true];
  [_x, true] call ace_arsenal_fnc_removeBox;
  [_x, 7] call ace_cargo_fnc_setSize;
} forEach phx_scavHuntObjs;



// Prep transport truck properties
{
  private _truckID = round(random(50) + 20);
  _x setVariable ["truckID", _truckID, true];

  // set size to 17, room for 1 objective + 2 wheels
  [_x, 9] call ace_cargo_fnc_setSpace;
  // clear existing wheels, add two
  ["ACE_Wheel", _x, 5] call ace_cargo_fnc_removeCargoItem;
  ["ACE_Wheel", _x] call ace_cargo_fnc_loadItem;
  ["ACE_Wheel", _x] call ace_cargo_fnc_loadItem;


  private _transportSide = ([_x, true] call BIS_fnc_objectSide);
  private _transportSideColor = [_transportSide, true] call BIS_fnc_sideColor;

  // prevent sides from using each other's vehicles
  _x addEventHandler ["GetIn", {
    params ["_vehicle", "_role", "_unit", "_turret"];
    if !(side _unit isEqualTo ([_vehicle, true] call BIS_fnc_objectSide)) then {
      _unit action ["Eject", _vehicle];
    };
  }];

} forEach phx_scavHuntTransports;

publicVariable "phx_scavHuntObjs";
publicVariable "phx_scavHuntTransports";


{
  _x addEventHandler ["Local", {
    params ["_truck", "_isLocal"];
    if (_isLocal) then {
      _truck allowDamage false;
    };
  }];
} forEach phx_scavHuntObjs;

{
  _x addEventHandler ["Local", {
    params ["_truck", "_isLocal"];
    if (_isLocal) then {
      _truck allowDamage false;
    };
  }];
} forEach phx_scavHuntTransports;


// Fetch zone triggers
// phx_scavHuntCapZones = [];
// {
//   private _triggerObj = missionNamespace getVariable [_x, objNull];
//   if (!isNull _triggerObj) then {
//     phx_scavHuntCapZones pushBack _triggerObj;
//   };
// } forEach ["scavHuntCapEAST", "scavHuntCapWEST", "scavHuntCapGUER"];

// publicVariable "phx_scavHuntCapZones";

// CAP ZONE MARKERS
phx_scavHuntCapZones = [];
{
	private _marker = ("scavHuntCap" + str _x);
	if (((markerPos _marker) select 0) != 0) then {
		phx_scavHuntCapZones pushBack _marker;
	};
} forEach phx_sidesInMission;


// Add loaded/unloaded Event Handlers
["ace_cargoLoaded", {
  if (!isServer) exitWith {};
  _this params ["_item", "_vehicle"];
  private _objIndex = phx_scavHuntObjs find _item;
  if (_objIndex > -1 && (phx_scavHuntTransports find _vehicle) > -1) then {
    (_thisArgs select (_objIndex)) params ["_obj", "_marker", "_name", "_index"];
    private _likelyPlayer = nearestObject [_vehicle, "CAManBase"];
    format["Item %1 (%2) loaded into a transport by %3 (%4)!", _index, _name, side _likelyPlayer call BIS_fnc_sideName, name _likelyPlayer] remoteExec ["systemChat", 0];
    _item setVariable ["phx_objLoaded", true, true];
    _item allowDamage false;
  } else {
    if (_objIndex > -1) then {
      [_item, _vehicle] call ace_cargo_fnc_unloadItem;
      _item allowDamage false;
    };
  };
}, phx_scavHuntObjDetails] call CBA_fnc_addEventHandlerArgs;

["ace_cargoUnloaded", {
  if (!isServer) exitWith {};
  _this params ["_item", "_vehicle"];
  private _objIndex = phx_scavHuntObjs find _item;
  if (_objIndex > -1 && (phx_scavHuntTransports find _vehicle) > -1) then {
    (_thisArgs select (_objIndex)) params ["_obj", "_marker", "_name", "_index"];
    private _likelyPlayer = nearestObject [_vehicle, "CAManBase"];
    format["Item %1 (%2) unloaded from a transport by %3 (%4)!", _index, _name, side _likelyPlayer call BIS_fnc_sideName, name _likelyPlayer] remoteExec ["systemChat", 0];
    _item setVariable ["phx_objLoaded", false, true];
    _item allowDamage false;
  };
}, phx_scavHuntObjDetails] call CBA_fnc_addEventHandlerArgs;







// Create objective markers
{
  _x params ["_obj", "_marker", "_name", "_index"];

  private _markStr = [
    _marker, // markerName
    [0,0,0], //getPos _obj, // markerPos
    "mil_dot", // markerType
    "ELLIPSE", // markerShape
    [25, 25], //markerSize
    0, // markerDir
    "Solid", //markerBrush
    "ColorOrange", //markerColor
    1, // markerAlpha
    format["Obj %1 - %2", _index, _name] // markerText
  ] joinString '|';

  format["|%1", _markStr] call BIS_fnc_stringToMarker;
} forEach phx_scavHuntObjDetails;



// Define cap monitors
phx_scavHuntObjIsNeutral = {
  params ["_obj","_marker","_captureID"];

  waitUntil {
    private _capped = false;
    sleep 2;
    {
      if (_obj inArea _x && (_obj getVariable ["phx_objLoaded", true] isEqualTo false)) exitWith {_capped = true};
    } forEach phx_scavHuntCapZones;
    if (_capped) then {true} else {false};
  };

  {
    private _capMark = _x;
    if (_obj inArea _capMark) exitWith {
      private _cappedSide = sideUnknown;
      switch (_capMark) do {
        case "scavHuntCapEAST": {_cappedSide = east};
        case "scavHuntCapWEST": {_cappedSide = west};
        case "scavHuntCapGUER": {_cappedSide = independent};
        case "scavHuntCapCIV": {_cappedSide = civilian};
        default {_cappedSide = sideUnknown};
      };
      _obj setVariable ["capturedBy", _cappedSide, true];
      [_captureID + str _cappedSide, "SUCCEEDED", true] call BIS_fnc_taskSetState;
      _failedSides = +phx_sidesInMission - [_cappedSide];
      {
        [_captureID + str _x, "FAILED", true] call BIS_fnc_taskSetState;
      } forEach _failedSides;
      format["%1 has captured an objective!", _cappedSide call BIS_fnc_sideName] remoteExec ["systemChat", 0];

      _highScore = (call phx_scavHuntCheckScores) toArray false;
      "Leading Team(s):" remoteExec ["systemChat", 0];
      {
        format["  %1 with %2 items", (_x # 0) call BIS_fnc_sideName, _x # 1] remoteExec ["systemChat", 0];
      } forEach _highScore;

      // switch to recappable
      // [_obj, _marker, _captureID, _cappedSide, _capMark] spawn phx_scavHuntObjIsCapped;

      // switch to NOT recappable
      [_obj, false] remoteExec ["ace_dragging_fnc_setDraggable", 0];
      [_obj, false] remoteExec ["ace_dragging_fnc_setCarryable", 0];
      [_obj, -1] remoteExec ["ace_cargo_fnc_setSize", 0];
    };
  } forEach phx_scavHuntCapZones;
};

phx_scavHuntObjIsCapped = {
  params ["_obj","_marker","_captureID","_cappedSide","_capMark"];
  waitUntil {
    sleep 2;
    if (!(_obj inArea _capMark) || (_obj getVariable ["phx_objLoaded", false] isEqualTo true)) then {
      true
    } else {
      false;
    };
  };
  _obj setVariable ["capturedBy", sideUnknown, true];
  [_captureID + str _cappedSide, "CREATED", true] call BIS_fnc_taskSetState;
  format["%1 has lost an objective!", _cappedSide call BIS_fnc_sideName] remoteExec ["systemChat", 0];

  _highScore = (call phx_scavHuntCheckScores) toArray false;
  format["Leading Team(s):"] remoteExec ["systemChat", 0];
  {
    format["  %1 with %2 items", (_x # 0) call BIS_fnc_sideName, _x # 1] remoteExec ["systemChat", 0];
  } forEach _highScore;

  [_obj, _marker, _captureID] spawn phx_scavHuntObjIsNeutral;
};


{
  if !(isNull (_x select 0)) then {
    _x params ["_obj", "_marker", "_name", "_index"];
    private _captureTaskText = "Capture and bring back the ";
    private _captureTaskImg = format["<img width='200' height='100' image='%1'/>", getText(configFile >> "CfgVehicles" >> typeOf _obj >> 'editorPreview')];
    private _captureID = "captureTask" + str _index + "_";

    // create tasks
    {
      [
        _x,
        _captureID + str _x,
        [
          format [_captureTaskText + "%1" + "<br/>" + _captureTaskImg, _name],
          format ["Item %1", _index],
          _marker
        ],
        [0,0,0],
        "CREATED"
      ] call BIS_fnc_taskCreate;
    } forEach phx_sidesInMission;
    

    //Check for objectives captured or not
    [_obj, _marker, _captureID] spawn phx_scavHuntObjIsNeutral;


    //Handle moving objective
    [_obj, _marker, _captureID] spawn {
      params ["_obj", "_marker", "_captureID"];

      _objMarkerUpdateTime = 3; //Change this value to however often you want the objective markers to update (seconds)
      _objMaxDistance = selectMin (getMarkerSize _marker);

      //Sets marker position to a random area around the objective, keeping the objective inside the marker
      if (!(_obj inArea _marker) && _obj getVariable ["phx_isRevealed", false]) then {
        _marker setMarkerPos ([[[position _obj,(_objMaxDistance * random [0.1,0.7,1])]],[]] call BIS_fnc_randomPos);
        {
          [_captureID + str _x, _marker] call BIS_fnc_taskSetDestination;
        } forEach phx_sidesInMission;
      };
      //Loop over objective position every _objMarkerUpdateTime
      //If objective moves more than _objMaxDistance meters away from it's last known position, the objective marker will update
      while {true} do {
        if !((_obj getVariable ["capturedBy", sideUnknown]) isEqualTo sideUnknown) then {[_marker] remoteExec ["deleteMarker", 0]; terminate _thisScript;};
        if (!(_obj inArea _marker) && _obj getVariable ["phx_isRevealed", false]) then {
          //Move the objective marker to a random position around the objective, while keeping the objective inside the marker's area
          _newPos = ([[[position _obj,(_objMaxDistance * random [0.1,0.7,1])]],[]] call BIS_fnc_randomPos);
          _marker setMarkerPos _newPos;

          {
            [_captureID + str _x, _marker] call BIS_fnc_taskSetDestination;
          } forEach phx_sidesInMission;
        };
        sleep _objMarkerUpdateTime;
      };
    };
  };
} forEach phx_scavHuntObjDetails;



phx_scavHuntAnyScore = {
  private _scores = [
    count(phx_scavHuntObjs select {(_x getVariable ["capturedBy", sideUnknown]) isEqualTo east}),
    count(phx_scavHuntObjs select {(_x getVariable ["capturedBy", sideUnknown]) isEqualTo west}),
    count(phx_scavHuntObjs select {(_x getVariable ["capturedBy", sideUnknown]) isEqualTo independent})
  ];

  private _highScore = selectMax _scores;
  (_highScore > 0)
};

[ // at 15 minutes after safe start, or when first score is made, reveal cap zones
  {
    (!phx_safetyEnabled && (cba_missiontime - (missionNamespace getVariable ["phx_safetyEndTime", 1])) / 60 >= 15) ||
    (call phx_scavHuntAnyScore)
  },
  {
    {
      _x setMarkerAlphaLocal 1;
    } forEach phx_scavHuntCapZones;
  }
] call CBA_fnc_waitUntilAndExecute;








[ // after safe start
  {(!phx_safetyEnabled && (cba_missiontime - (missionNamespace getVariable ["phx_safetyEndTime", 1])) >= 2)}, {

    // remind trucks they should be invincible
    {
      {
        _x allowDamage false;
      } forEach phx_scavHuntTransports;
    } remoteExec ["call", 0, true];


    // Reveal new objective every mission time minus 15 divided by number of objectives
    _objRevealTime = (phx_missionTimeLimit - 15) / count phx_scavHuntObjs;
    // 5 objectives -- every 5 minutes
    // 10 objectives -- every 2.5 minutes
    [{
      _args params ["_objs"];

      // select randomly from objectives that haven't been revealed or captured yet, and reveal them
      private _objsToMaybeReveal = _objs select {
        (_x getVariable ["capturedBy", sideUnknown]) isEqualTo sideUnknown &&
        !(_x getVariable ["phx_isRevealed", false]) 
      };

      private _revealThis = selectRandom _objsToMaybeReveal;
      _revealThis setVariable ["phx_isRevealed", true, true];
      private _index = phx_scavHuntObjs find _revealThis;

      (phx_scavHuntObjDetails select _index) params ["_obj", "_mark", "_name", "_index"];
      format["Item %1 has been revealed!", _index] remoteExec ["systemChat", 0];

    }, _objRevealTime * 60, [phx_scavHuntObjs]] call CBA_fnc_addPerFrameHandler;


    // Show leading teams every 5 minutes
    [{
      _highScore = (call phx_scavHuntCheckScores) toArray false;
      "Leading Team(s):" remoteExec ["systemChat", 0];
      {
        format["  %1 with %2 items", (_x # 0) call BIS_fnc_sideName, _x # 1] remoteExec ["systemChat", 0];
      } forEach _highScore;
    }, 300] call CBA_fnc_addPerFrameHandler;

  }
] call CBA_fnc_waitUntilAndExecute;




// Win conditions handled at end of timer -- fn_overTimeEnd.sqf











phx_scavHuntCheckScores = {
  private _scores = createHashMapFromArray [
    [
      east,
      count(phx_scavHuntObjs select {(_x getVariable ["capturedBy", sideUnknown]) isEqualTo east})
    ],
    [
      west,
      count(phx_scavHuntObjs select {(_x getVariable ["capturedBy", sideUnknown]) isEqualTo west})
    ],
    [
      independent,
      count(phx_scavHuntObjs select {(_x getVariable ["capturedBy", sideUnknown]) isEqualTo independent})
    ]
  ];

  private _winScore = selectMax (values _scores);
  private _winSide = createHashMap;
  {
    if (_y == _winScore) then {_winSide set [_x, _y]};
  } forEach _scores;

  _winSide
};


[{(values (call phx_scavHuntCheckScores)) findIf {_x > ((count phx_scavHuntObjs) / 2)} > -1}, {
  phx_gameEnd = true;
  publicVariable "phx_gameEnd";
  private _winData = ((call phx_scavHuntCheckScores) toArray false) select 0;
  [_winData # 0, format["%1 won by capturing a majority of items! (%2)", (_winData # 0) call BIS_fnc_sideName, _winData # 1]] spawn phx_fnc_gameEnd;
}] call CBA_fnc_waitUntilAndExecute;

