if (!isServer || !phx_safeStartEnabled) exitWith {};

if !(getMarkerColor "opforSafeMarker" isEqualTo "") then {
  ["opforSafeMarker"] remoteExec ["deleteMarker",0,true];
};
if !(getMarkerColor "bluforSafeMarker" isEqualTo "") then {
  ["bluforSafeMarker"] remoteExec ["deleteMarker",0,true];
};
if !(getMarkerColor "indforSafeMarker" isEqualTo "") then {
  ["indforSafeMarker"] remoteExec ["deleteMarker",0,true];
};

if !(getMarkerColor "optStartMark_1" isEqualTo "") then {
  _areaMarkers = ["optStartMark_1","optStartMark_2","optStartMark_3","optStartMark_4","optStartMark_5"];

  {
    if (!(getMarkerColor _x isEqualTo "")) then {
      [_x] remoteExec ["deleteMarker",0,true];
    };
  } forEach _areaMarkers;
};

uiSleep  10;

if (!isNil "lap_1") then {
  _laptops = [lap_1,lap_2,lap_3,lap_4,lap_5];
  _tables = [table1,table2,table3,table4,table5];
  _teleportMarkers = ["optStart_1","optStart_2","optStart_3","optStart_4","optStart_5"];

  for [{_i=0}, {_i<10}, {_i=_i+1}] do {
    {_x setObjectTextureGlobal [0, "#(rgb,8,8,3)color(1,0,0,1)"];} forEach _laptops;
    uiSleep  0.5;
    {_x setObjectTextureGlobal [0, "#(rgb,8,8,3)color(1,1,1,1)"];} forEach _laptops;
    uiSleep  0.5;
  };
  {deleteVehicle _x;} forEach _laptops;
  {deleteVehicle _x;} forEach _tables;
  {
    if (!(getMarkerColor _x isEqualTo "")) then {
      [_x] remoteExec ["deleteMarker",0,true];
    };
  } forEach _teleportMarkers;
};

phx_safeStartEnabled = false;
