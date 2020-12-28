/*
Prevents player from placing trenches on/near road and near objectives
*/

phx_trenchObjDist = 30;

phx_restrictETool_PFH = [{
  phx_etool_nearObjs = {if ((player distance _x) < phx_trenchObjDist) exitWith {true}; false} forEach phx_fortify_objArr;
  if (player getVariable ["ace_trenches_isplacing",false]) then {
    if (isNil "phx_restrictEToolAction") then {
      phx_restrictEToolAction = player addAction ["", {format ["You must be at least %1m away from an objective and not near road to place a trench", phx_trenchObjDist] call phx_fnc_hintThenClear}, nil, 0, false, true, "defaultAction", "
        phx_etool_nearObjs || (count (ace_trenches_trench nearRoads 12) > 0) || (isOnRoad ace_trenches_trench)
      "];
    };
  } else {
    if (!isNil "phx_restrictEToolAction") then {
      player removeAction phx_restrictEToolAction;
      phx_restrictEToolAction = nil;
    };
  };
}, 0] call CBA_fnc_addPerFrameHandler;
