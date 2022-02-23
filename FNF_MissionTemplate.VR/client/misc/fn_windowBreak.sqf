/*
  Author: IndigoFox
  Contact: Indigo#6290 on Discord

  Required Mods:
    - CBA
    - ACE3 (ace_interact_menu)

  Description:
    Players will see an ACE action on the windows of all buildings that will allow them to break the glass, bypassing the need to shoot them out.

  Notes:
    This script runs on a player's local machine.
    Every 10 seconds, it will gather all buildings in a 125 meter radius and add an ACE action for the player which allows them to break any windows on that building, based on "glass" hitPoints of that building's model.
    A player-only variable is saved on a building once it's processed, to avoid re-processing and save time on cycles.
    This procedure runs in the scheduled environment to not cost frames, and is very light to begin with.
    Because models are made differently by different devs, the exact position of the interaction relative to the window's center will vary.

  Installation:
    Add this file to initPlayerLocal.sqf, or any client-side init scripts you already use.

  Copyright 2022 IndigoFox

  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

if (isDedicated || !hasInterface) exitWith {};
if (!isNil "ifx_windowBreak_handle") then {
  [ifx_windowBreak_handle] call CBA_fnc_removePerFrameHandler;
  ifx_windowBreak_handle = nil;
};

ifx_windowBreak_handle = [{
  if (!isNil "ifx_windowBreak_subHandle") then {
    if (!scriptDone ifx_windowBreak_subHandle) exitWith {};
  };

  if_windowBreak_subHandle = [] spawn {
    _buildings = player nearObjects ["Building", 125];

    {
      private _building = _x;
      if (isNull _building) then {continue};
      if (_building getVariable ["ifx_windowBreak_registered", false]) then {continue};


      _selections = (_building selectionNames "HitPoints") select {_x find "glass" > -1};
      {
        private _helperPos = AGLtoASL (_building modelToWorld (_building selectionPosition _x));
        private _helperObject = "ACE_LogicDummy" createVehicleLocal [0,0,0];
        _helperObject setPosASL _helperPos;

        private _breakWindowAction = [
          "Break_Window",
          "Break Window",
          ["", "#C4D4E0"],
          {
            params ["_target", "_player", "_params"];
            _params params ["_building", "_selectionName"];
            _building setHit [_selectionName, 1, true];
          }, // statement
          {
            params ["_target", "_player", "_params"];
            _params params ["_building", "_selectionName"];
            (_building getHit _selectionName) < 1;
            // true;
          }, // condition
          {}, // child code
          [_building, _x], // params
          [0,0,0], // position
          2, // distance
          //[showDisabled,enableInside,canCollapse,runOnHover,doNotCheckLOS] // special params
          [false, true, true, false, true]
        ] call ace_interact_menu_fnc_createAction;

        // [typeOf _building, 0, [], _breakWindowAction] call ace_interact_menu_fnc_addActionToClass;
        [_helperObject, 0, [], _breakWindowAction] call ace_interact_menu_fnc_addActionToObject;

      } forEach _selections;

      _building setVariable ["ifx_windowBreak_registered", true];
    } forEach _buildings;
  };
}, 10] call CBA_fnc_addPerFrameHandler;
