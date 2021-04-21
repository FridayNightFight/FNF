Saving = 0;
enableItemsDropping = 0;
disabledAI = 1;
enableDebugConsole = 1;

respawn = 3;
respawnDialog = 0;
respawndelay = 99999;
respawnOnStart = -1;
respawnTemplates[] = {"ace_spectator"};
joinUnassigned = 1;

onPauseScript[] = {phx_fnc_removeRespawnButton};

class CfgDebriefingSections {
    class acex_killTracker {
        title = "ACEX Killed Events";
        variable = "acex_killTracker_outputText";
    };
};
