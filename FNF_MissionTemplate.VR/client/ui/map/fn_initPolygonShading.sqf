fnf_trianglesToDraw = [];

[{!isNull findDisplay 12},{
findDisplay 12 displayCtrl 51 ctrlAddEventHandler ["Draw",
{
  //hintSilent str fnf_trianglesToDraw;
  _map = _this select 0;
  {
    _pos1 = getMarkerPos ((_x select 0) select 0);
    _pos2 = getMarkerPos ((_x select 0) select 1);
    _pos3 = getMarkerPos ((_x select 0) select 2);
	  _map drawTriangle [[_pos1, _pos2, _pos3], _x select 1, _x select 2];
  } forEach fnf_trianglesToDraw;
}];
}] call CBA_fnc_waitUntilAndExecute;
