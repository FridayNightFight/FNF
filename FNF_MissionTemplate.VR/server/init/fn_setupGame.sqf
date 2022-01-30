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

//To do: allow objectives to be deleted w/o throwing error

_deleteObj = {
  params ["_obj"];

  if (!isNil "_obj") then {
    if (!isNull _obj) then {deleteVehicle _obj};
  };
};

if !(phx_gameMode isEqualTo "destroy") then {
  _test = (getMissionLayerEntities "FNF Gamemode: Destroy");
  if (count _test > 0) then {
    _test params ["_objects", "_markers"];
    {_x call _deleteObj} forEach _objects;
    {_x remoteExec ["deleteMarkerLocal", 0, true]} forEach _markers;
  };
};

if !(phx_gameMode isEqualTo "uplink" || phx_gameMode isEqualTo "rush" || phx_gameMode isEqualTo "connection") then {
  _test = (getMissionLayerEntities "FNF Gamemode: Rush, Uplink, Connection");
  if (count _test > 0) then {
    _test params ["_objects", "_markers"];
    {_x call _deleteObj} forEach _objects;
    {_x remoteExec ["deleteMarkerLocal", 0, true]} forEach _markers;
  };
};

if !(phx_gameMode isEqualTo "captureTheFlag") then {
  _test = (getMissionLayerEntities "FNF Gamemode: CTF");
  if (count _test > 0) then {
    _test params ["_objects", "_markers"];
    {_x call _deleteObj} forEach _objects;
    {_x remoteExec ["deleteMarkerLocal", 0, true]} forEach _markers;
  };
};

if !(phx_gameMode isEqualTo "adSector") then {
  _test = (getMissionLayerEntities "FNF Gamemode: ADSector");
  if (count _test > 0) then {
    _test params ["_objects", "_markers"];
    {_x call _deleteObj} forEach _objects;
    {_x remoteExec ["deleteMarkerLocal", 0, true]} forEach _markers;
  };
};

if !(phx_gameMode isEqualTo "scavHunt") then {
  _test = (getMissionLayerEntities "FNF Gamemode: ScavHunt");
  if (count _test > 0) then {
    _test params ["_objects", "_markers"];
    {_x call _deleteObj} forEach _objects;
    {_x remoteExec ["deleteMarkerLocal", 0, true]} forEach _markers;
  };
};

if !(phx_gameMode isEqualTo "assassin") then {
  _test = (getMissionLayerEntities "FNF Gamemode: Assassin");
  if (count _test > 0) then {
    _test params ["_objects", "_markers"];
    {_x call _deleteObj} forEach _objects;
    {_x remoteExec ["deleteMarkerLocal", 0, true]} forEach _markers;
  };
};


if (phx_gameMode != "sustainedAssault") then {

  call phx_server_fnc_safeZoneTeleportInit_STD;


  { // set flag textures for flags
    private _thisSide = _x;
    private _thisSideStr = toLower (_thisSide call BIS_fnc_sideNameUnlocalized);
    _sideFlagsPresent = missionNamespace getVariable [
      format["fnf_%1_safeZone_flags", _thisSideStr],
      []
    ];

    { // for each side flag present
      private _thisFlag = _x;

      // Set flag appropriate to faction on owner side

      // get uniform meta settings passed from server via phx_server_fnc_sendUniforms
      private "_thisSideUniform";
      switch (_thisSide) do {
        case east: {
          _thisSideUniform = missionNamespace getVariable ["phx_briefing_east_uniformMeta", [""]];
        };
        case west: {
          _thisSideUniform = missionNamespace getVariable ["phx_briefing_west_uniformMeta", [""]];
        };
        case independent: {
          _thisSideUniform = missionNamespace getVariable ["phx_briefing_ind_uniformMeta", [""]];
        };
      };

      // then based on the uniform, set flag texture
      #define SIDEUNIFORM (_thisSideUniform select 0)
      switch (true) do {
        case (SIDEUNIFORM find "_US_" > -1): {_thisFlag setFlagTexture "\A3\ui_f\data\map\markers\flags\USA_ca.paa"};
        case (SIDEUNIFORM find "_NATO_" > -1): {_thisFlag setFlagTexture "\A3\ui_f\data\map\markers\flags\nato_ca.paa"};
        case (SIDEUNIFORM find "_RU_" > -1): {_thisFlag setFlagTexture "\a3\UI_F_Enoch\Data\CfgMarkers\Russia_CA.paa"};
        case (SIDEUNIFORM find "_GER_" > -1): {_thisFlag setFlagTexture "\A3\ui_f\data\map\markers\flags\Germany_ca.paa"};
        case (SIDEUNIFORM find "_NL_" > -1): {_thisFlag setFlagTexture "\A3\ui_f\data\map\markers\flags\Netherlands_ca.paa"};
        case (SIDEUNIFORM find "_ID_" > -1): {_thisFlag setFlagTexture "\rhsgref\addons\rhsgref_main\data\Flags\flag_NAPA_co.paa"};
        case (SIDEUNIFORM find "_CROATIAN_" > -1): {_thisFlag setFlagTexture "\A3\ui_f\data\map\markers\flags\Croatia_ca.paa"};
        case (SIDEUNIFORM find "_SERBIAN_" > -1): {_thisFlag setFlagTexture "\rhssaf\addons\rhssaf_main\data\flags\flag_serbia_co.paa"};
        case (SIDEUNIFORM find "_YUGOSLAVIA_" > -1): {_thisFlag setFlagTexture "\rhssaf\addons\rhssaf_main\data\flags\flag_yugoslavia_co.paa"};
        case (SIDEUNIFORM find "_CZECHFORCES_" > -1): {_thisFlag setFlagTexture "ca\Ca_E\data\flag_cz_co.paa"};
        default {
          switch (_thisSide) do {
            case east: {_thisFlag setFlagTexture "ca\Ca_E\data\flag_opfor_co.paa"};
            case west: {_thisFlag setFlagTexture "ca\Ca_E\data\flag_blufor_co.paa"};
            case independent: {_thisFlag setFlagTexture "ca\Ca_E\data\flag_indfor_co.paa"};
          };
        };
      };
    } forEach _sideFlagsPresent;
  } forEach [west, east, independent];
};


if (phx_gameMode == "sustainedAssault") then {
  call phx_server_fnc_ambientFlyby;

  if (!isNil "safeZone_BLUFOR") then {
    phx_safeZone_BLUFOR_marker = ["safeZone_BLUFOR_marker", safeZone_BLUFOR] call BIS_fnc_markerToTrigger;
    publicVariable "phx_safeZone_BLUFOR_marker";
    phx_safeZone_BLUFOR_marker setMarkerColor "ColorBLUFOR";
    phx_safeZone_BLUFOR_marker setMarkerBrush "FDiagonal";
  };
  if (!isNil "safeZone_OPFOR") then {
    phx_safeZone_OPFOR_marker = ["safeZone_OPFOR_marker", safeZone_OPFOR] call BIS_fnc_markerToTrigger;
    publicVariable "phx_safeZone_Independent_marker";
    phx_safeZone_OPFOR_marker setMarkerColor "ColorOPFOR";
    phx_safeZone_OPFOR_marker setMarkerBrush "FDiagonal";
  };
  if (!isNil "safeZone_Independent") then {
    phx_safeZone_Independent_marker = ["safeZone_Independent_marker", safeZone_Independent] call BIS_fnc_markerToTrigger;
    publicVariable "phx_safeZone_OPFOR_marker";
    phx_safeZone_Independent_marker setMarkerColor "ColorGUER";
    phx_safeZone_Independent_marker setMarkerBrush "FDiagonal";
  };


  {
    private _thisSide = _x;
    private _thisSideStr = toLower(_thisSide call BIS_fnc_sideNameUnlocalized);
    private _thisSideStrLoc = _thisSide call BIS_fnc_sideName;

    // Aux markers
    // west_teleportAux_1
    // east_teleportAux_1
    // guer_teleportAux_1
    // civ_teleportAux_1
    private _auxMarkersPresent = [];
    for "_i" from 1 to 5 do {
      private _markStr = format["%1_teleportAux_%2", _thisSideStr, _i];
      if (markerColor _markStr != "") then {
        private _markNumber = _markStr select [(count _markStr) - 1, 1];
        _markStr setMarkerText format["Aux Teleport %1", _markNumber];
      };
    };
  } forEach [west, east, independent, civilian];

  // add handler for zoneProtection on vehicles
  #define MISSIONVICS (entities[["Air", "Truck", "Car", "Motorcycle", "Tank", "StaticWeapon", "Ship"], [], false, true] select {(_x call BIS_fnc_objectType select 0) == "Vehicle"})
  [{
    MISSIONVICS spawn {
      {
        _inSafeZone = [_x] call phx_fnc_inSafeZone;
        if (_inSafeZone && _x getVariable ["fnf_zoneProtectionActive", false]) then {
          _x setVariable ["fnf_zoneProtectionActive", true];
          [_x, false] remoteExec ["allowDamage", _x];
        };
        if (!_inSafezone && _x getVariable ["fnf_zoneProtectionActive", true]) then {
          _x setVariable ["fnf_zoneProtectionActive", false];
          [_x, true] remoteExec ["allowDamage", _x];
        };
      } forEach _this;
    };
  }, 15] call CBA_fnc_addPerFrameHandler;
};


missionNamespace setVariable ["phx_serverGameSetup", true, true];
