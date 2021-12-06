Saving = 0;
disabledAI = 1;
enableDebugConsole = 1;

respawn = 3;
respawnDialog = 0;
respawndelay = 5;
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

class CfgSettings {
    class CBA {
        class Caching {
            compile = 0;
            xeh = 0;
            functions = 0;
        };
    };
};
