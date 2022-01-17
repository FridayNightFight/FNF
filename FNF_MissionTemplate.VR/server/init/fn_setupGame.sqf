/*
Calls server portion of the game modes
Deletes unused objectives
*/

if (!isServer) exitWith {};

missionNamespace setVariable ["phx_gameEnd", false, true];

phx_overTimeConStr = "N/A";

_fnc_warnForAD = {
  _str = format["phx_attackingSide (%1) or phx_defendingSide (%2) isn't set, but this is an attack/defend gamemode (%3).",phx_attackingSide,phx_defendingSide,phx_gameMode];
  _strStruct = "<t align='center'>" + _str + "<br/>The framework may not work properly!</t>";
  [{time > 3}, {
    [_this, "error", 15] remoteExecCall ["phx_ui_fnc_notify", 0, true];
  }, _strStruct] call CBA_fnc_waitUntilAndExecute;
  [_str] call BIS_fnc_error;
  systemChat _str;
  systemChat "The framework may not work properly!";
};
_fnc_warnForNeutral = {
  _str = format["phx_attackingSide (%1) or phx_defendingSide (%2) is set, but this is a neutral gamemode (%3).",phx_attackingSide,phx_defendingSide,phx_gameMode];
  _strStruct = "<t align='center'>" + _str + "<br/>The framework may not work properly!</t>";
  [{time > 3}, {
    [_this, "error", 15] remoteExecCall ["phx_ui_fnc_notify", 0, true];
  }, _strStruct] call CBA_fnc_waitUntilAndExecute;
  [_str] call BIS_fnc_error;
  systemChat _str;
  systemChat "The framework may not work properly!";
};

switch (phx_gameMode) do {
  case "destroy": {
    if (sideEmpty in [phx_attackingSide, phx_defendingSide]) exitWith {call _fnc_warnForAD};
    execVM "modes\destroy\destroy_server.sqf";
    phx_overTimeConStr = "The mission will go into overtime if there is only 1 alive objective remaining and attackers stay near the objective.";
  };
  case "uplink": {
    if (sideEmpty in [phx_attackingSide, phx_defendingSide]) exitWith {call _fnc_warnForAD};
    execVM "modes\uplink\uplink_server.sqf";
    phx_overTimeConStr = "The mission will go into overtime if any terminal is being hacked.";
  };
  case "rush": {
    if (sideEmpty in [phx_attackingSide, phx_defendingSide]) exitWith {call _fnc_warnForAD};
    execVM "modes\rush\rush_server.sqf";
    phx_overTimeConStr = "The mission will go into overtime if the final terminal is being hacked.";
  };
  case "captureTheFlag": {
    if (sideEmpty in [phx_attackingSide, phx_defendingSide]) exitWith {call _fnc_warnForAD};
    execVM "modes\ctf\ctf_server.sqf";
    phx_overTimeConStr = "The mission will go into overtime if the flag stays within the capture zone.";
  };
  case "adSector": {
    if (sideEmpty in [phx_attackingSide, phx_defendingSide]) exitWith {call _fnc_warnForAD};
    execVM "modes\adsector\adSector.sqf";
    phx_overTimeConStr = "The mission will go into overtime if there is only 1 active sector remaining and attackers stay inside it.";
  };
  case "assassin": {
    if (sideEmpty in [phx_attackingSide, phx_defendingSide]) exitWith {call _fnc_warnForAD};
    execVM "modes\assassin\assassin_server.sqf";
  };
  case "neutralSector": {
    if !(sideEmpty in [phx_attackingSide, phx_defendingSide]) exitWith {call _fnc_warnForNeutral};
    execVM "modes\neutralsector\neutralSector.sqf";
    phx_overTimeConStr = "The mission will go into overtime if the second-highest side stays within 20 points of the highest side. The first side to 100 points will still win if mission is within normal time limit.";
  };
  case "scavHunt": {
    if !(sideEmpty in [phx_attackingSide, phx_defendingSide]) exitWith {call _fnc_warnForNeutral};
    execVM "modes\scavHunt\scavHunt_server.sqf";
    phx_overTimeConStr = "The mission will go into overtime if both teams hold an equal number of target items in their zone when the timer reaches zero.";
  };
  case "connection": {
    if !(sideEmpty in [phx_attackingSide, phx_defendingSide]) exitWith {call _fnc_warnForNeutral};
    execVM "modes\connection\connection_server.sqf";
    phx_overTimeConStr = "The mission will go into overtime if the second-highest side stays within 20 points of the highest side. The first side to 100 points will still win if mission is within normal time limit.";
  };
};

publicVariable "phx_overTimeConStr";

_deleteObj = {
  params ["_obj"];

  if (!isNil "_obj") then {
    if (!isNull _obj) then {deleteVehicle _obj};
  };
};

if !(phx_gameMode isEqualTo "destroy") then {
  {_x call _deleteObj} forEach [destroy_obj_1,destroy_obj_2];
  {if !(getMarkerColor _x isEqualTo "") then {_x remoteExec ["deleteMarkerLocal", 0, true]}} forEach ["destroy_obj_1_mark","destroy_obj_2_mark"];
};

if !(phx_gameMode isEqualTo "uplink" || phx_gameMode isEqualTo "rush" || phx_gameMode isEqualTo "connection") then {
  {_x call _deleteObj} forEach [term1,term2,term3];
};

if !(phx_gamEMode isEqualTo "captureTheFlag") then {
  {_x call _deleteObj} forEach [ctf_flagPole, ctf_attackTrig];
};

if !(phx_gameMode isEqualTo "adSector") then {
  {_x call _deleteObj} forEach [phx_sec1,phx_sec2,phx_sec3];
};

if !(phx_gameMode isEqualTo "scavHunt") then {
  {_x call _deleteObj} forEach [scav_obj_1,scav_obj_2,scav_obj_3,scav_obj_4,scav_obj_5,scav_obj_6,scav_obj_7,scav_obj_8,scav_obj_9,scav_obj_10];
  {_x call _deleteObj} forEach [scav_transport_1,scav_transport_2,scav_transport_3,scav_transport_4,scav_transport_5,scav_transport_6,scav_transport_7,scav_transport_8,scav_transport_9,scav_transport_10];
  {
    {
      deleteMarker _x;
    } forEach ["scavHuntCapEAST", "scavHuntCapWEST", "scavHuntCapGUER"];
  } remoteExec ["call", 0, true];
};

if !(phx_gameMode isEqualTo "assassin") then {
  private _markers = ["fnf_assassin_boundaries_"] call BIS_fnc_getMarkers;
  {
    deleteMarker _x;
  } forEach _markers;
};
