Saving = 0;
disabledAI = 1;
enableDebugConsole = 1;

respawn = 3;
respawnDialog = 1;
respawnButton = 1;
respawndelay = 25;
respawnOnStart = -1;
joinUnassigned = 1;

disableChannels[] = {2};

onPauseScript[] = {\
    fnf_fnc_addStaffContactButton,\
    fnf_admin_fnc_adminGameEnd,\
    fnf_admin_fnc_addAdminUIButton\
};

// change game type if appropriate
// CTF
// SC (Sector Control)
class Header {
  gameType =  SC;	// Game type
  minPlayers =  20;	// minimum number of players the mission supports
  maxPlayers = 124;	// maximum number of players the mission supports
};

class CfgDebriefingSections {
    class acex_killTracker {
        title = "ACEX Killed Events";
        variable = "acex_killTracker_outputText";
    };
};
