Saving = 0;
disabledAI = 0;
enableDebugConsole = 1;

respawn = 3;
respawnDialog = 0;
respawndelay = 99999;
respawnOnStart = -1;
respawnTemplates[] = {};
joinUnassigned = 1;

onPauseScript[] = {\
    phx_fnc_removeRespawnButton,\
    phx_fnc_addStaffContactButton,\
    phx_admin_fnc_adminGameEnd,\
    phx_admin_fnc_addAdminKickButton\
};

class CfgDebriefingSections {
    class acex_killTracker {
        title = "ACEX Killed Events";
        variable = "acex_killTracker_outputText";
    };
};
