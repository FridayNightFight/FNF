if (!(alive player) || missionNamespace getVariable ["phx_safetyEnabled",true]) then {
  _ctrl = (findDisplay 49) displayCtrl 1010;
  _ctrl ctrlEnable false;
};
