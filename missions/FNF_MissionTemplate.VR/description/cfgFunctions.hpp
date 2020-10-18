class CfgFunctions {
  class PHX {
    //////////
    class clientInit {
      file = "client\init";
      class clientInit{};
      class markerVisibility{};
      class clientJIP{};
      class postBriefing{};
      class setGroupIDs{};
      class fortifyClient{};
      class client_setupGame{};
      class platoonActions{};
      class gearSelection{};
      class getKeys{};
      class handlePauseRespawn{};
      class restrictUniform{};
    };
    class clientSafety {
      file = "client\safety";
      class safety{};
      class startBoundary{};
    };
    class loadout {
      file = "client\loadout";
      class removeGear{};
      class setLoadout{};
      class setWeapons{};
      class setUniform{};
      class addUniform{};
      class addGear{};
      class checkLoadout{};
    };
    class misc {
      file = "client\misc";
      class hintThenClear{};
      class zoneBoundary{};
      class disableTyping{};
      class afkCheck{};
    };
    class spectator {
      file = "client\spectator";
      class spectatorInit{};
    };
    class serverInit {
      file = "server\init";
      class serverInit{};
      class serverSafety{};
      class fortifyServer{};
      class server_setupGame{};
      class objBuildingDamage{};
    };
    class unflip {
      file = "client\unflip";
      class unflipVehicle{};
      class unflipVehicleAddAction{};
    };
    class radios {
      file = "shared\radios";
      class radio_genFreqs{};
      class radio_waitGear{};
      class radio_getChannels{};
      class radio_waitRadios{};
      class radio_setRadios{};
      class radio_cleanup{};
    };
    class endConditions {
      file = "shared\endconditions";
      class checkAlive{};
      class checkTime{};
      class clientTime{};
      class overTimeEnd{};
    };
    //////////
  };
};
