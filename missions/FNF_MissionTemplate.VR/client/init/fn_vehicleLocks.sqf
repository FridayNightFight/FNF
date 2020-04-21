/*
To use:
Add the vehicle you wish to lock to the array phx_bluVics, phx_opfVics, or phx_indVics
Example:
Adding a vehicle to the Blufor lock list (only Blufor, or Blufor crewman can operate depending on which mission parameter you choose)
Add this to the vehicle's init in the editor:

phx_bluVics pushBack this;
or
phx_opfVics pushBack this;
or
phx_indVics pushBack this;

*/

_locking = "phx_vehicleLocks" call BIS_fnc_getParamValue;
if (_locking < 0) exitWith {};

switch (_locking) do {
  case 0: {
    inGameUISetEventHandler ["Action", "
      _vic = (_this select 0);
      switch (playerSide) do {
        case east: {
          if (_vic in phx_bluVics || _vic in phx_indVics) then {
            'Cannot enter enemy vehicle' call phx_fnc_hintThenClear;
            true
          };
        };

        case west: {
          if (_vic in phx_opfVics || _vic in phx_indVics) then {
            'Cannot enter enemy vehicle' call phx_fnc_hintThenClear;
            true
          };
        };

        case independent: {
          if (_vic in phx_opfVics || _vic in phx_bluVics) then {
            'Cannot enter enemy vehicle' call phx_fnc_hintThenClear;
            true
          };
        };
      };
    "];
  };
  case 1: {
    inGameUISetEventHandler ["Action", "
      _vic = (_this select 0);
      _actionName = _this select 3;
      _actionText = _this select 4;
      switch (playerSide) do {
        case east: {
          if (_vic in phx_bluVics || _vic in phx_indVics) then {
            'Cannot enter enemy vehicle' call phx_fnc_hintThenClear;
            true
          } else {
            if (_vic in phx_opfVics) then {
              if ((_actionName isEqualTo 'GetInDriver' || _actionName isEqualTo 'GetInTurret' || _actionName isEqualTo 'MoveToDriver' || _actionName isEqualTo 'MoveToTurret') && (_actionText find 'Passenger' == -1)  && !(pRole == 15 || pRole == 14)) then {
                'Crewman required' call phx_fnc_hintThenClear;
                true
              };
            };
          };
        };

        case west: {
          if (_vic in phx_opfVics || _vic in phx_indVics) then {
            'Cannot enter enemy vehicle' call phx_fnc_hintThenClear;
            true
          } else {
            if (_vic in phx_bluVics) then {
              if ((_actionName isEqualTo 'GetInDriver' || _actionName isEqualTo 'GetInTurret' || _actionName isEqualTo 'MoveToDriver' || _actionName isEqualTo 'MoveToTurret') && (_actionText find 'Passenger' == -1)  && !(pRole == 15 || pRole == 14)) then {
                'Crewman required' call phx_fnc_hintThenClear;
                true
              };
            };
          };
        };

        case independent: {
          if (_vic in phx_opfVics || _vic in phx_bluVics) then {
            'Cannot enter enemy vehicle' call phx_fnc_hintThenClear;
            true
          } else {
            if (_vic in phx_indVics) then {
              if ((_actionName isEqualTo 'GetInDriver' || _actionName isEqualTo 'GetInTurret' || _actionName isEqualTo 'MoveToDriver' || _actionName isEqualTo 'MoveToTurret') && (_actionText find 'Passenger' == -1)  && !(pRole == 15 || pRole == 14)) then {
                'Crewman required' call phx_fnc_hintThenClear;
                true
              };
            };
          };
        };
      };
    "];
  };
};
