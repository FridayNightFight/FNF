/*
Kills the player if they are outside of the mission boundary for too long.
*/

fnf_zoneBoundary_timer = 20;

if (!isNil "zoneTrigger") then {
  [{getClientStateNumber > 8}, {
    if (!isNil "fnf_zoneBoundary_PFH") then {
        [fnf_zoneBoundary_PFH] call CBA_fnc_removePerFrameHandler;
        fnf_zoneBoundary_PFH = nil;
    };
    fnf_zoneBoundary_PFH = [{
      if !(alive player) exitWith {};
      _condition = !(vehicle player inArea zoneTrigger) && !(vehicle player isKindOf "Air" || ropeAttachedTo vehicle player isKindOf "Air");

      if (_condition) then {
        if (fnf_zoneBoundary_timer == 0) exitWith {
          fnf_zoneBoundary_PFH call CBA_fnc_removePerFrameHandler; titleText ["", "PLAIN"];
          if (player == driver (vehicle player)) then {(vehicle player) call BIS_fnc_neutralizeUnit};
          [{player setDamage 1}, [], 5] call CBA_fnc_waitAndExecute;
        };
        _msg = format ["You have %1 seconds to get back into the mission zone.", fnf_zoneBoundary_timer];
        titleText [_msg, "PLAIN"];
        fnf_zoneBoundary_timer = fnf_zoneBoundary_timer - 1;
      } else {
        if (fnf_zoneBoundary_timer != 15) then {
          fnf_zoneBoundary_timer = 15;
          titleText ["", "PLAIN"];
        };
      };
    }, 1, []] call CBA_fnc_addPerFrameHandler;
  }] call CBA_fnc_waitUntilAndExecute;
} else {

  [{getClientStateNumber > 8 && !isNil "fnf_zoneBoundary_boundaryPos"}, {
    if (!isNil "fnf_zoneBoundary_PFH") then {
        [fnf_zoneBoundary_PFH] call CBA_fnc_removePerFrameHandler;
        fnf_zoneBoundary_PFH = nil;
    };
    if !(count fnf_zoneBoundary_boundaryPos >= 3) exitWith {};
    fnf_zoneBoundary_PFH = [{
      if !(alive player) exitWith {};
      if (!(position (vehicle player) inPolygon fnf_zoneBoundary_boundaryPos) && !(vehicle player isKindOf "Air")) then {
        if (fnf_zoneBoundary_timer == 0) exitWith {
          fnf_zoneBoundary_PFH call CBA_fnc_removePerFrameHandler; titleText ["", "PLAIN"];
          if (player == driver (vehicle player)) then {(vehicle player) call BIS_fnc_neutralizeUnit};
          [{player setDamage 1}, [], 5] call CBA_fnc_waitAndExecute;
        };
        _msg = format ["You have %1 seconds to get back into the mission zone.", fnf_zoneBoundary_timer];
        titleText [_msg, "PLAIN"];
        fnf_zoneBoundary_timer = fnf_zoneBoundary_timer - 1;
      } else {
        if (fnf_zoneBoundary_timer != 15) then {
          fnf_zoneBoundary_timer = 15;
          titleText ["", "PLAIN"];
        };
      };
    }, 1, []] call CBA_fnc_addPerFrameHandler;
  }] call CBA_fnc_waitUntilAndExecute;
};
