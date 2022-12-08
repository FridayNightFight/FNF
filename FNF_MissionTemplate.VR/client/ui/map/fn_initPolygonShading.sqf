fnf_trianglesToDraw = [];

[{!isNull findDisplay 12},{
findDisplay 12 displayCtrl 51 ctrlAddEventHandler ["Draw",
{
  _map = _this select 0;
  {
    _pos1 = getMarkerPos ((_x select 0) select 0);
    _pos2 = getMarkerPos ((_x select 0) select 1);
    _pos3 = getMarkerPos ((_x select 0) select 2);
	  _map drawTriangle [[_pos1, _pos2, _pos3], _x select 1, _x select 2];
  } forEach fnf_trianglesToDraw;
}];
}] call CBA_fnc_waitUntilAndExecute;

[{!isNull findDisplay 52},{
findDisplay 52 displayCtrl 51 ctrlAddEventHandler ["Draw",
{
  _map = _this select 0;
  {
    _pos1 = getMarkerPos ((_x select 0) select 0);
    _pos2 = getMarkerPos ((_x select 0) select 1);
    _pos3 = getMarkerPos ((_x select 0) select 2);
	  _map drawTriangle [[_pos1, _pos2, _pos3], _x select 1, _x select 2];
  } forEach fnf_trianglesToDraw;
}];
}] call CBA_fnc_waitUntilAndExecute;

[{!isNull findDisplay 60000},{
findDisplay 60000 displayCtrl 60014 ctrlAddEventHandler ["Draw",
{
  _map = _this select 0;
  {
    _pos1 = getMarkerPos ((_x select 0) select 0);
    _pos2 = getMarkerPos ((_x select 0) select 1);
    _pos3 = getMarkerPos ((_x select 0) select 2);
	  _map drawTriangle [[_pos1, _pos2, _pos3], _x select 1, _x select 2];
  } forEach fnf_trianglesToDraw;
}];
}] call CBA_fnc_waitUntilAndExecute;

//these are both supposed to draw the trinagles to any GPS screens, they aren't working, i dont know why, there are literally no other map controls i can find

/*[{!isNull (findDisplay 313 displayCtrl 51)},{
findDisplay 313 displayCtrl 51 ctrlAddEventHandler ["Draw",
{
  systemChat "Running";
  _map = _this select 0;
  {
    _pos1 = getMarkerPos ((_x select 0) select 0);
    _pos2 = getMarkerPos ((_x select 0) select 1);
    _pos3 = getMarkerPos ((_x select 0) select 2);
	  _map drawTriangle [[_pos1, _pos2, _pos3], _x select 1, _x select 2];
  } forEach fnf_trianglesToDraw;
}];
}] call CBA_fnc_waitUntilAndExecute;
[{
  if (!isNull (findDisplay 313 displayCtrl 51)) then
  {
    _map = findDisplay 313 displayCtrl 51;
    {
      _pos1 = getMarkerPos ((_x select 0) select 0);
      _pos2 = getMarkerPos ((_x select 0) select 1);
      _pos3 = getMarkerPos ((_x select 0) select 2);
	    _map drawTriangle [[_pos1, _pos2, _pos3], _x select 1, _x select 2];
    } forEach fnf_trianglesToDraw;
  };
},0,[]] call CBA_fnc_addPerFrameHandler;*/
