call phx_restrictions_fnc_disableMisc;
call phx_restrictions_fnc_zoneBoundary;
call phx_restrictions_fnc_restrictGamma;
call phx_restrictions_fnc_startBoundary;

//Uniform and etool restrictions
[{missionNamespace getVariable ["phx_loadoutAssigned",false]}, {call phx_restrictions_fnc_restrictETool}] call CBA_fnc_waitUntilAndExecute;
[{!(missionNamespace getVariable ["phx_safetyEnabled",true])}, {call phx_restrictions_fnc_restrictUniform}] call CBA_fnc_waitUntilAndExecute;
//[{!phx_safetyEnabled && !isNull (findDisplay 46)}, {call phx_restrictions_fnc_afkCheck}] call CBA_fnc_waitUntilAndExecute;

//Set TFAR volume to whisper
TF_speak_volume_level = "whispering";
TF_speak_volume_meters = 5;
call TFAR_fnc_updateSpeakVolumeUI;

//View distance and terrain grid force & disable commanding menu
phx_viewDistanceHandler = [{
  if (!isNil "phx_fnc_objectivePreview_Cam") exitWith {}; //Disable if obj preview is active
  if (!alive player) exitWith {};
  if (viewDistance > phx_maxViewDistance) then {
    setViewDistance phx_maxViewDistance;
  };
  if (getTerrainGrid > 25) then {
    setTerrainGrid 25;
  };

  if !(commandingMenu isEqualTo "") then {showCommandingMenu ""};
} , 0.5] call CBA_fnc_addPerFrameHandler;

//Disable zeus ping
missionnamespace setvariable ["bis_fnc_curatorPinged_time", 9999, false];

if (phx_gameMode == "sustainedAssault") then {

  phx_safeZone_fnc_stopVehicle = {
    params [["_object",objNull]];
    if (getPosATL _object < 15) then {
      _object setVectorUp (surfaceNormal (position _object));
    } else {
      _object setVectorUp [0,0,1];
    };
    _object setVelocity [0,0,0];
  };

  phx_safeZone_fnc_moveOutside = {
    params [["_object",objNull]];
    if (phx_restrictEntry_lastGoodPos select 2 > 0.2) then {
      _object setpos phx_restrictEntry_lastGoodPos;
    } else {
      _object setpos (phx_restrictEntry_lastGoodPos findEmptyPosition [0, 50, typeOf _object]);
    };

    ["<t align='center'><t color='#FF3333'>You're too close to the enemy's entry point!!</t>", "warning", 5] call phx_ui_fnc_notify;
  };

  [{!isNull player}, {
    // disable moving within 250m of enemy teleport location or main bases

    if (!isNil "phx_restrictions_handle_forbiddenAreas") then {
      if !(scriptDone phx_restrictions_handle_forbiddenAreas) then {
        [phx_restrictions_handle_forbiddenAreas] call CBA_fnc_removePerFrameHandler;
      };
    };

    switch (side (group player)) do {
      case west: {
      phx_restrictions_handle_forbiddenAreas = [{
          _args params ["_forbiddenAreas","_maxTime"];
          private _vic = vehicle player;
          if (getPosATL _vic select 2 < 15) then {
            if (
              // _forbiddenAreas findIf {(getPos (vehicle player) distance (getPos _x)) < 250} == -1
              _forbiddenAreas findIf {(_vic inArea _x) == true} == -1
            ) then {
              phx_restrictEntry_lastGoodPos = getpos _vic;
            } else {
              [_vic] call phx_fnc_stopVehicle;
              [_vic] call phx_safeZone_fnc_moveOutside;
            };
          };
        }, 2, [["rally_east_marker",safeZone_OPFOR],2]] call CBA_fnc_addPerFrameHandler;
      };
      case east: {
        phx_restrictions_handle_forbiddenAreas = [{
          _args params ["_forbiddenAreas","_maxTime"];
          private _vic = vehicle player;
          if (getPosATL _vic select 2 < 15) then {
            if (
              // _forbiddenAreas findIf {(getPos (vehicle player) distance (getPos _x)) < 250} == -1
              _forbiddenAreas findIf {(_vic inArea _x) == true} == -1
            ) then {
              phx_restrictEntry_lastGoodPos = getpos _vic;
            } else {
              [_vic] call phx_fnc_stopVehicle;
              [_vic] call phx_safeZone_fnc_moveOutside;
            };
          };
        }, 2, [["rally_west_marker",safeZone_BLUFOR],2]] call CBA_fnc_addPerFrameHandler;
      };
    };
  }] call CBA_fnc_waitUntilAndExecute;
};
