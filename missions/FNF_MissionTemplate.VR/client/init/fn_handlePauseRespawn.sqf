//Disable respawn button if safestart enabled, player is dead, and player is spectator
if (!(alive player) || missionNamespace getVariable ["phx_safetyEnabled",true] || missionNamespace getVariable ["phx_specEnabled",false]) then {
  waitUntil {!isNull (findDisplay 49)};
  _ctrl = (findDisplay 49) displayCtrl 1010;
  _ctrl ctrlEnable false;
};
