params["_markerList", "_rgbaValues", "_invertPolygon"];

if (_invertPolygon) then {
  _markerList = [_markerList] call fnf_ui_fnc_invertPolygon;
};

_outputsToUse = [];

[_markerList, _outputsToUse] call fnf_ui_fnc_triangulatePolygon;
{fnf_trianglesToDraw pushBack [_x, [(_rgbaValues select 0),(_rgbaValues select 1),(_rgbaValues select 2),(_rgbaValues select 3)] ,"#(rgb,1,1,1)color(1,1,1,1)"]} forEach _outputsToUse;
