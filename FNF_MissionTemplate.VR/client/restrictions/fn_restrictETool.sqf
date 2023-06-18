/*
Prevents player from placing trenches on/near roads and near objectives
*/

fnf_trenchObjDist = 30;

if (!isNil "fnf_restrictETool_PFH") then {
  [fnf_restrictETool_PFH] call CBA_fnc_removePerFrameHandler;
  fnf_restrictETool_PFH = nil;
};
fnf_restrictETool_PFH = [{
  if (player getVariable ["ace_trenches_isplacing",false]) then {
    fnf_etool_nearObjs = {if ((player distance _x) < fnf_trenchObjDist) exitWith {true}; false} forEach fnf_fortify_objArr;

    if (isNil "fnf_restrictEToolAction") then {
      fnf_restrictEToolAction = player addAction ["", {format ["Cannot place trench within %1m of an objective or within 12m of a road", fnf_trenchObjDist] call fnf_fnc_hintThenClear}, nil, 0, false, true, "defaultAction", "
        fnf_etool_nearObjs || (count (ace_trenches_trench nearRoads 12) > 0) || (isOnRoad ace_trenches_trench)
      "];
    };
  } else {
    if (!isNil "fnf_restrictEToolAction") then {
      player removeAction fnf_restrictEToolAction;
      fnf_restrictEToolAction = nil;
    };
  };
}, 0.1] call CBA_fnc_addPerFrameHandler;
