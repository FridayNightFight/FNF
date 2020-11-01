//Remove player from kick array once loadout is set
waitUntil {missionNamespace getVariable ["phx_loadoutAssigned",false] && (CBA_missionTime > 1)};

uisleep 3;

[getPlayerUID player] remoteExec ["phx_server_clientLoaded",2,false];
