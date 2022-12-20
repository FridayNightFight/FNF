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
        if (fnf_zoneBoundary_timer != 20) then {
          fnf_zoneBoundary_timer = 20;
          titleText ["", "PLAIN"];
        };
      };
    }, 1, []] call CBA_fnc_addPerFrameHandler;
  }] call CBA_fnc_waitUntilAndExecute;
} else {

  [{getClientStateNumber > 8}, {

    _boundryMarkers = [];
    {
      if (_x regexMatch "^fnf_custom_zoneBoundary_1_marker_\d+$") then
      {
        _boundryMarkers pushBack (_x);
      };
    } forEach allMapMarkers;

    _boundryMarkers = [_boundryMarkers, [], {
      _results = _x regexFind ["\d+", 30];
      parseNumber (((_results select 0) select 0) select 0);
    }] call BIS_fnc_sortBy;

    _boundryPositions = [];

    {
      _boundryPositions pushBack (getMarkerPos _x);
    } forEach _boundryMarkers;

    if (!isNil "fnf_zoneBoundary_PFH") then {
        [fnf_zoneBoundary_PFH] call CBA_fnc_removePerFrameHandler;
        fnf_zoneBoundary_PFH = nil;
    };
    if !(count ((_this select 0) select 0) >= 3) exitWith {};
    fnf_zoneBoundary_PFH = [{
      if !(alive player) exitWith {};
      if (!(position (vehicle player) inPolygon ((_this select 0) select 0)) && !(vehicle player isKindOf "Air" || ropeAttachedTo vehicle player isKindOf "Air")) then {
        if (fnf_zoneBoundary_timer == 0) exitWith {
          fnf_zoneBoundary_PFH call CBA_fnc_removePerFrameHandler; titleText ["", "PLAIN"];
          if (player == driver (vehicle player)) then {(vehicle player) call BIS_fnc_neutralizeUnit};
          [{player setDamage 1}, [], 5] call CBA_fnc_waitAndExecute;
        };
        _msg = format ["You have %1 seconds to get back into the mission zone.", fnf_zoneBoundary_timer];
        titleText [_msg, "PLAIN"];
        fnf_zoneBoundary_timer = fnf_zoneBoundary_timer - 1;
      } else {
        if (fnf_zoneBoundary_timer != 20) then {
          fnf_zoneBoundary_timer = 20;
          titleText ["", "PLAIN"];
        };
      };
    }, 1, [_boundryPositions]] call CBA_fnc_addPerFrameHandler;
  }] call CBA_fnc_waitUntilAndExecute;
};
