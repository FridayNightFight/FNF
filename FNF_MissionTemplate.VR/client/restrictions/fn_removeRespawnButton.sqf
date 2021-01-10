/*
Disables respawn button if safestart enabled, player is dead, or player is spectator
Called from description.ext onPauseScript
*/

if (!(alive player) || missionNamespace getVariable ["phx_safetyEnabled",true] || missionNamespace getVariable ["ace_spectator_isset",false]) then {
  ((findDisplay 49) displayCtrl 1010) ctrlEnable false;
};
