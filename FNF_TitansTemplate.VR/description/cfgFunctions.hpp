class CfgFunctions {
  class PHX {
    class vars {
      class varsInit{file = "config.sqf"; preInit = 1;};
    };
    class serverInit {
      file = "server";
      class serverInit{};
      class serverInitCall{postInit = 1;};
      class markCustomObjs{};
      class serverSafety{};
      class serverMidInit{};
      class adminCommandHandeler{};
      class serverCheck{};
    };
    class clientInit {
      file = "client";
      class clientInit{};
      class clientMidInit{};
      class clientInitCall{postInit = 1;};
      class clientCanPlay{};
    };
    class gui {
      file = "client\gui";
      class loadoutGUI{};
      class adminDiary{};
      class adminGUI{};
    };
    class roleselect {
      file = "client\roleselect";
      class spawnLoadout{};
      class serverResponse{};
      class roles{};
    };
    class loadout {
      file = "client\loadout";
      class setLoadout{};
      class setUniform{};
      class setWeapons{};
      class addUniform{};
      class addWeapons{};
      class addGear{};
      class addMagazines{};
      class addItems{};
      class checkLoadout{};
      class initLoadout{};
      class loadout_vars{};
    };
    class loadout_misc {
      file = "client\loadout\misc";
      class giveNVG{};
      class setMAT{};
      class setUGLAmmo{};
      class setAttributes{};
    };
    class selector {
      file = "client\loadout\selector";
      class selector_init{};
      class selector_optics{};
      class selector_weapons{};
      class selector_charges{};
      class selector_remove{};
    };
    class end {
      file = "server\end";
      class checkAlive{};
      class checkTime{};
      class overTimeEnd{};
      class titanMultiRoundHandler{};
    };
    class restrictions {
      file = "client\restrictions";
      class restrictions{};
      class disableMisc{};
      class disableTyping{};
      class removeRespawnButton{};
      class restrictUniform{};
      class zoneBoundary{};
      class startBoundary{};
      class restrictETool{};
      class restrictGamma{};
    };
    class spectator {
      file = "client\spectator";
      class spectatorInit{};
    };
    class safety {
      file = "client\safety";
      class safety{};
    };
    class mode {
      file = "mode";
      class terminalClientSetup{};
      class terminalServerSetup{};
      class newRoundClient{};
    };
  };
};
