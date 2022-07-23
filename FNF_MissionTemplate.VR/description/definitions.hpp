Saving = 0;
disabledAI = 1;
enableDebugConsole = 1;
// allowFunctionsLog = 1; // 0: disabled - 1: enabled. Default: ?

respawn = 3;
respawnDialog = 0;
respawnButton = 1;
respawndelay = 99999;
respawnOnStart = -1;
respawnTemplates[] = {};
joinUnassigned = 1;

onPauseScript[] = {
  fnf_restrictions_fnc_removeRespawnButton,
  fnf_fnc_addStaffContactButton,
  fnf_admin_fnc_adminGameEnd,
  fnf_admin_fnc_addAdminUIButton,
  fnf_fnc_lobbyTextGenButton
};

// change game type if appropriate
// CTF
// SC (Sector Control)
class Header {
  gameType =  Unknown;	// Game type
  minPlayers =  20;	// minimum number of players the mission supports
  maxPlayers = 124;	// maximum number of players the mission supports
};

class CfgDebriefingSections {
  class acex_killTracker {
    title = "ACEX Killed Events";
    variable = "acex_killTracker_outputText";
  };
};
