_vehiclesToProcessBLUFOR = [];
_vehiclesToProcessOPFOR = [];
_vehiclesToProcessINDFOR = [];
_outArr = [];
_transportsPresentBLU = 0;
_transportsPresentOPF = 0;
_transportsPresentIND = 0;

_getVic = {
  params ["_vic", "_thisSide", "_arr"];

  private _thisObj = _vic;
  private _className = typeOf _vic;
  private _thisObjConfig = (configFile >> "CfgVehicles" >> (typeOf _vic));
    private _displayName = _thisObjConfig call BIS_fnc_displayName;
  private _typeCount = 0;
  private _thisObjSide = sideLogic;
  private _objExists = [];

  // [dispName, count, side]

  private _objIndex = _arr findIf {(_x # 0) == _className};
  if (_objIndex == -1) then {
    _arr pushBack [
      _className,
      1
    ];
  } else {
    _typeCount = _arr # _objIndex # 1;
    _arr # _objIndex set [1, (_typeCount + 1)];
  };
};



{
  private _thisConfig = (configFile >> "CfgVehicles" >> (typeOf _x));
  private _threat = [_thisConfig, "threat"] call BIS_fnc_returnConfigEntry;
  if ([_x, west] call phx_fnc_inSafeZone) then {
    [_x, "BLU", _vehiclesToProcessBLUFOR] call _getVic;
  };
  if ([_x, east] call phx_fnc_inSafeZone) then {
    [_x, "OPF", _vehiclesToProcessOPFOR] call _getVic;
  };
  if ([_x, independent] call phx_fnc_inSafeZone) then {
    [_x, "IND", _vehiclesToProcessINDFOR] call _getVic;
  };

} forEach (entities[["Motorcycle", "Tank", "StaticWeapon", "Ship", "Air", "Car", "Truck"], [], false, true] select {(_x call BIS_fnc_objectType select 0) == "Vehicle" && (locked _x) in [0,1]});



phx_ORBATHandlers = [];
{
  private _side = _x;
  private [
    "_sideShort",
    "_sideColorStr",
    "_sideCfgStr",
    "_sideNameStr",
    "_sideIcon",
    "_vehicles"
  ];
  switch (_side) do {
    case east: {
      _sideShort = "OPF";
      _sideColorStr = "Red";
      _sideCfgStr = "East";
      _sideNameStr = "OPFOR";
      _sideIcon = "o_motor_inf";
      _vehicles = _vehiclesToProcessOPFOR;
    };
    case west: {
      _sideShort = "BLU";
      _sideColorStr = "Blue";
      _sideCfgStr = "West";
      _sideNameStr = "BLUFOR";
      _sideIcon = "b_motor_inf";
      _vehicles = _vehiclesToProcessBLUFOR;
    };
    case independent: {
      _sideShort = "IND";
      _sideColorStr = "Green";
      _sideCfgStr = "Resistance";
      _sideNameStr = "INDFOR";
      _sideIcon = "n_motor_inf";
      _vehicles = _vehiclesToProcessINDFOR;
    };
  };

  if (playableSlotsNumber _side > 3 && phx_enemyStartVisible) then {
    _PLTLeader = allPlayers select {side _x isEqualTo _side && _x getVariable "phxLoadout" isEqualTo "PL"};
    [ // PLTHQ
      missionConfigFile >> "CfgORBAT" >> format["FNF%1PLTHQ", _sideShort],
      _sideColorStr,
      "Platoon",
      "HQ",
      _sideCfgStr,
      _sideNameStr + " Motorized Platoon",
      "Platoon HQ",
      _sideIcon,
      1,
      getMissionPath "description\images\fnf.paa",
      [_side, false] call BIS_fnc_sideColor,
      (
        if (count _PLTLeader > 0) then {name (_PLTLeader # 0)} else {""}
      ), // commander name
      "", // rank
      format["GEAR:<br/>  %1<br/>UNIFORM:<br/>  %2",
        missionNamespace getVariable [format["phx_%1Gear",_sideNameStr], "N/A"],
        missionNamespace getVariable [format["phx_%1Uniform",_sideNameStr], "N/A"]
      ], // description
      _vehicles
    ] call BIS_fnc_ORBATSetGroupParams;

    [ // X
      missionConfigFile >> "CfgORBAT" >> format["FNF%1PLTX", _sideShort],
      _sideColorStr,
      "Squad",
      "Recon",
      _sideCfgStr,
      "X-Ray Recon Team",
      "X-Ray - Recon",
      _sideIcon,
      1,
      "",
      [_side, false] call BIS_fnc_sideColor,
      "", // commander name
      "", // rank
      "", // description
      []
    ] call BIS_fnc_ORBATSetGroupParams;


    { // Squads
      private _squadName = _x;
      private _squadChar = _x select [0,1];
      [ // Alpha
        missionConfigFile >> "CfgORBAT" >> format["FNF%1PLT%2", _sideShort, _squadChar],
        _sideColorStr,
        "Squad",
        "MotorizedInfantry",
        _sideCfgStr,
        _squadName + " Squad - Assault",
        _squadName + " - Assault",
        _sideIcon,
        1,
        "",
        [_side, false] call BIS_fnc_sideColor,
        "", // commander name
        "", // rank
        "The primary fighting force of the platoon for taking and holding objectives. This rifle squad has an assault team with a designated marksman and a support team with an MMG and HuntIR-equipped Grenadier. It also carries LAT, CE, and a Medic in each team. Attached is a two-man vehicle crew, meant for manning armed vehicles in direct support of the squad.", // description
        []
      ] call BIS_fnc_ORBATSetGroupParams;
    } forEach ["Alpha", "Bravo", "Charlie", "Delta"];

    { // G
      private _number = str(_x);
      [ // Alpha
        missionConfigFile >> "CfgORBAT" >> format["FNF%1PLTG%2", _sideShort, _number],
        _sideColorStr,
        "Fireteam",
        "MechanizedInfantry",
        _sideCfgStr,
        "Golf " + _number + " - Detached Asset",
        "Golf " + _number,
        _sideIcon,
        1,
        "",
        [_side, false] call BIS_fnc_sideColor,
        "", // commander name
        "", // rank
        "", // description
        []
      ] call BIS_fnc_ORBATSetGroupParams;
    } forEach [1, 2];

    { // H
      private _number = str(_x);
      [ // Alpha
        missionConfigFile >> "CfgORBAT" >> format["FNF%1PLTH%2", _sideShort, _number],
        _sideColorStr,
        "Fireteam",
        "AviationSupport",
        _sideCfgStr,
        "Hotel " + _number + " - Detached Asset",
        "Hotel " + _number,
        _sideIcon,
        1,
        "",
        [_side, false] call BIS_fnc_sideColor,
        "", // commander name
        "", // rank
        "", // description
        []
      ] call BIS_fnc_ORBATSetGroupParams;
    } forEach [1, 2];

    _logic = missionNamespace getVariable ("ORBAT" + _sideShort);
    missionNamespace setVariable ["ORBAT" + _sideShort + "handler", [_logic] spawn BIS_fnc_moduleStrategicMapORBAT];
  };
} forEach [east, west, independent];

[{!phx_safetyEnabled && time > 0}, {
  missionNamespace setVariable ["BIS_fnc_moduleStrategicMapORBAT_drawIcon", nil];
}] call CBA_fnc_waitUntilAndExecute;
