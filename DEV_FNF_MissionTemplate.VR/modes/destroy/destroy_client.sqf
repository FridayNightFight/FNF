//Only run client-side
if (!hasInterface) exitWith {};

#include "..\..\mode_config\destroy.sqf"

_objArr = [_obj1,_obj2,_obj3];

phx_destroyObjs = [_obj1 select 0, _obj2 select 0, _obj3 select 0];

if (playerSide != phx_defendingSide) exitWith {};

{
  _obj = _x select 0;
  _mark = _x select 1;
  if (!isNull _obj) then {
    _mark setMarkerAlphaLocal 0;
  };
} forEach _objArr;
