_marker = _this;

if ((driver (vehicle player)) isEqualTo player) then {
  if (vehicle player isKindOf "Air") exitWith {};
  vehicle player setPos (getMarkerPos (_marker) findEmptyPosition [0,50,typeOf vehicle player])
} else {
   player setPos (getMarkerPos (_marker) findEmptyPosition [0,25,typeOf player])
};