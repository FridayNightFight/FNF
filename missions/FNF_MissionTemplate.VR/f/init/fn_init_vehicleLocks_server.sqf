/*
To use:
Add the vehicle you wish to lock to the arrays: bluVics, opfVics, or indVics (server-side only)
Example:
Adding a vehicle to the Blufor lock list (only Blufor, or Blufor crewman can operate depending on which parameter you choose
Add this to the vehicle's init in the editor:
if (isServer) then {
bluVics pushBack this;
};
*/

_locking = "phx_vehicleLocks" call BIS_fnc_getParamValue;

if !(_locking isEqualTo -1) then {
  switch (_locking) do {
    case 0: { //Lock to side only
      clientLocks = {
        switch (side player) do {
          case west: {
            {_x lockDriver true; _x lockTurret [[0],true]; _x lockTurret [[1],true];} forEach opfVics;
            {_x lockDriver true; _x lockTurret [[0],true]; _x lockTurret [[1],true];} forEach indVics;
          };
          case east: {
            {_x lockDriver true; _x lockTurret [[0],true]; _x lockTurret [[1],true];} forEach bluVics;
            {_x lockDriver true; _x lockTurret [[0],true]; _x lockTurret [[1],true];} forEach indVics;
          };
        };
        case independent: {
          {_x lockDriver true; _x lockTurret [[0],true]; _x lockTurret [[1],true];} forEach bluVics;
          {_x lockDriver true; _x lockTurret [[0],true]; _x lockTurret [[1],true];} forEach opfVics;
        };
      };
    };
    case 1: { //Lock to side and crewman
      clientLocks = {
        switch (side player) do {
          case west: {
            if !(pRole == 15 || pRole == 14) then {
              {_x lockDriver true; _x lockTurret [[0],true]; _x lockTurret [[1],true];} forEach bluVics;
            };
            {_x lockDriver true; _x lockTurret [[0],true]; _x lockTurret [[1],true];} forEach opfVics;
            {_x lockDriver true; _x lockTurret [[0],true]; _x lockTurret [[1],true];} forEach indVics;
          };
          case east: {
            if !(pRole == 15 || pRole == 14) then {
              {_x lockDriver true; _x lockTurret [[0],true]; _x lockTurret [[1],true];} forEach opfVics;
            };
            {_x lockDriver true; _x lockTurret [[0],true]; _x lockTurret [[1],true];} forEach bluVics;
            {_x lockDriver true; _x lockTurret [[0],true]; _x lockTurret [[1],true];} forEach indVics;
          };
          case independent: {
            if !(pRole == 15 || pRole == 14) then {
              {_x lockDriver true; _x lockTurret [[0],true]; _x lockTurret [[1],true];} forEach indVics;
            };
            {_x lockDriver true; _x lockTurret [[0],true]; _x lockTurret [[1],true];} forEach bluVics;
            {_x lockDriver true; _x lockTurret [[0],true]; _x lockTurret [[1],true];} forEach opfVics;
          };
        };
      };
    };
  };
  [bluVics,opfVics,indVics] remoteExec ["clientLocks", 0, true];
};
