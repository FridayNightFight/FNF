//Only run client-side
if (!hasInterface) exitWith {};
if (playerSide != phx_defendingSide) exitWith {};

#include "..\..\mode_config\destroy.sqf"

_objArr = [_obj1,_obj2,_obj3];

{
  if (!isNull (_x select 0)) then {
    (_x select 1) setMarkerAlphaLocal 0;
  };
} forEach _objArr;
