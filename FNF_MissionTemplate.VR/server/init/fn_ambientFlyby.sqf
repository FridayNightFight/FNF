private _airGroups = [];

if (["VN_UNI_", phx_bluforUniform] call BIS_fnc_inString) then {
  // VIETNAM
  // get config groups to potentially spawn
  {
    private _base = _x;
    private _configNames = (_x  call Bis_fnc_getCfgSubClasses);
    {
      _airGroups pushBack (_base >> _x);
    } forEach _configNames;
  } forEach [
    (configfile >> "CfgGroups" >> "West" >> "VN_MACV" >> "vn_b_group_air_army"),
    (configfile >> "CfgGroups" >> "West" >> "VN_MACV" >> "vn_b_group_air_navy"),
    (configfile >> "CfgGroups" >> "West" >> "VN_MACV" >> "vn_b_group_air_usaf"),
    (configfile >> "CfgGroups" >> "West" >> "VN_MACV" >> "vn_b_group_air_usmc")
  ];
} else {
  // MODERN
  // get config groups to potentially spawn
  _airGroups pushBack ["RHS_AH64D","RHS_AH64D"];
  _airGroups pushBack["RHS_AH64D","RHS_UH60M_d","RHS_UH60M_d"];
  _airGroups pushBack ["RHS_UH60M_MEV_d","RHS_UH60M_MEV2_d","RHS_UH60M_d"];
  _airGroups pushBack ["RHS_CH_47F_light","RHS_CH_47F_light"];
  _airGroups pushBack ["RHS_MELB_AH6M","RHS_MELB_AH6M","RHS_MELB_MH6M","RHS_MELB_MH6M","RHS_MELB_MH6M","RHS_MELB_MH6M"];
  _airGroups pushBack ["RHS_MELB_AH6M","RHS_MELB_AH6M"];
  _airGroups pushBack ["RHS_A10","RHS_A10"];
  _airGroups pushBack ["RHS_C130J"];
  _airGroups pushBack ["rhsusf_f22","rhsusf_f22","rhsusf_f22","rhsusf_f22"];

  _airGroups pushBack ["RHS_Mi24P_vdv","RHS_Mi24P_vdv"];
  _airGroups pushBack ["RHS_Mi8MTV3_heavy_vdv","RHS_Mi8MTV3_heavy_vdv","RHS_Mi8MTV3_heavy_vdv"];
  _airGroups pushBack ["RHS_Mi8mt_vdv","RHS_Mi8mt_vdv"];
  _airGroups pushBack ["rhs_mi28n_vvsc","RHS_Mi8T_vvsc","RHS_Mi8T_vvsc"];
  _airGroups pushBack ["RHS_Ka52_vvsc","RHS_Ka52_vvsc"];
  _airGroups pushBack ["RHS_Su25SM_vvsc","RHS_Su25SM_vvsc"];
  _airGroups pushBack ["rhs_mig29s_vvsc","rhs_mig29s_vvsc"];
};


#define BOTTOM_LEFT (markerPos "ambient_helispawn_1")
#define TOP_LEFT (markerPos "ambient_helispawn_2")
#define TOP_RIGHT (markerPos "ambient_helispawn_3")
#define BOTTOM_RIGHT (markerPos "ambient_helispawn_4")

fnf_ambient_randomFlyby = [{
  _args spawn {
    params ["_cfgGroups","_paths"];
    selectRandom(_paths) params ["_startPos","_endPos"];

  if !(["VN_UNI_", phx_bluforUniform] call BIS_fnc_inString) then {
    // MODERN
    {
      [_startPos, _endPos, random(50) + 100, "NORMAL", _x, independent] call BIS_fnc_ambientFlyby;
      sleep 1;
    } forEach selectRandom(_cfgGroups);
    {_x allowDamage false} forEach (units independent);

  } else {
    // VIETNAM / CfgGroups
    _startPos set [2,200];
    private _thisGroup = [
      _startPos,
      civilian,
      selectRandom _cfgGroups,
      [],
      [],
      [],
      [0,0],
      [2,1],
      _startPos getDir _endPos,
      false, 50
    ] call BIS_fnc_spawnGroup;
    {
      switch (true) do {
        case (_x isKindOf "Plane"): {
          _x flyInHeightASL[700,700,700];
          _x flyInHeight 250;
        };
        default {
          _x flyInHeightASL[400,400,400];
          _x flyInHeight 100;
          // _x limitSpeed 200;
        };
      };
      _x setCaptive true;
    } forEach (units _thisGroup);
    private _wpt = _thisGroup addWaypoint [_endPos, 300];
    _wpt setWaypointType "MOVE";
    _wpt setWaypointCombatMode "GREEN";
    _wpt setWaypointForceBehaviour true;
    _wpt setWaypointSpeed "NORMAL";
    _wpt setWaypointCompletionRadius 100;
    _wpt setWaypointFormation selectRandom([
      "STAG COLUMN",
      "FILE",
      "ECH LEFT",
      "WEDGE",
      "DIAMOND"
    ]);
    _thisGroup deleteGroupWhenEmpty true;
    _thisGroup setCombatMode "GREEN";
    waitUntil {currentWaypoint _thisGroup != 1};
    {deleteVehicle _x} count (units _thisGroup);
  };
}, random(120) + 240, [
  _airGroups,
  [
    [BOTTOM_LEFT,TOP_RIGHT],
    [TOP_LEFT,BOTTOM_RIGHT],
    [TOP_RIGHT,BOTTOM_LEFT],
    [BOTTOM_RIGHT,TOP_LEFT]
  ]
]] call CBA_fnc_addPerFrameHandler;
