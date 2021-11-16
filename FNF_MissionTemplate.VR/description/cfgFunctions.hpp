class CfgFunctions {
  class PHX {
    class vars {
      class varsInit{file = "config.sqf"; preInit = 1;};
      class sekritVars{file = "description\sekrit.sqf"; preInit = 1;};
    };
    class serverInit {
      file = "server\init";
      class serverInit{};
      class serverInitCall{postInit = 1;};
    };
    class teleport {
      file = "client\misc\leaderTeleport";
      class teleportInit{};
      class teleportExec{};
    }
    class clientInit {
      file = "client\init";
      class clientInit{};
      class clientCanPlay{};
      class clientSetupGame{};
      class staggeredLoad{};
      class drawStaffIcons{};
      class drawCmdIcons{};
      class drawSLIcons{};
      class assetDiaryInfo{};
      class clientInitCall{postInit = 1;};
    };
    class briefing {
      file = "client\briefing";
      class briefInit{};
      class setGroupIDs{};
      class createBrief{};
      class createOrbat{};
      class objectiveRecon{};
    };
    class briefingLoadouts {
      file = "client\briefing\loadoutPrep";
      class briefingParseLoadout{};
      class briefingWeaponDetails{};
    };
    class radio {
      file = "client\radio";
      class radio_waitGear{};
      class radio_getChannels{};
      class radio_setRadios{};
      class radio_cleanup{};
    };
    class spectator {
      file = "client\spectator";
      class spectatorInit{};
    };
    class loadout {
      file = "client\loadout";
      class applyCfgLoadout{};
      class addGear{};
      class checkLoadout{};
      class setMAT{};
    };
    class restrictions {
      file = "client\restrictions";
      class restrictions{};
      class disableMisc{};
      class afkCheck{};
      class disableTyping{postInit = 1;};
      class removeRespawnButton{};
      class hideMarkers{};
      class restrictUniform{};
      class zoneBoundary{};
      class startBoundary{};
      class restrictETool{};
      class restrictGamma{};
    };
    class safety {
      file = "client\safety";
      class safety{};
      class handleSafetyVics{};
    };
    class misc {
      file = "client\misc";
      class hintThenClear{};
      class fortifyClient{};
      class clientTime{};
      class killCounter{};
      class showTimeOnMap{};
      class objectivePreview{};
      class fixUniformBug{};
      class SCUDFired{};
    };
    class contactStaff {
      file = "client\misc\contactStaff";
      class addStaffContactButton{};
      class contactStaffInit{};
      class contactStaff{};
    };
    class unflip {
      file = "client\misc\unflip";
      class unflipVehicle{};
      class unflipVehicleAddAction{};
    };
    class initServer {
      file = "server\init";
      class serverSafety{};
      class sendUniforms{};
      class markCustomObjs{};
      class fortifyServer{};
      class server_setupGame{};
      class radio_genFreqs{};
      class populateORBATS{};
      class keyVehicles{};
      class lockVehicles{};
      class vehicleRadios{};
    };
    class end {
      file = "server\end";
      class checkAlive{};
      class checkTime{};
      class overTimeEnd{};
      class gameEnd{};
      class endElimination{};
    };
    class damage {
      file = "server\damage";
      class handleDamage{};
    };
    class webhook {
      file = "server\webhook";
      class webhook_roundPrep;
      class webhook_roundStart;
      class webhook_roundEnd;
    };
  };
  class phx_ui {
    class safeStartMenu {
      file = "client\ui\safeStartMenu";
      class safeStartMain{};
      class weaponSelector{};
      class opticSelector{};
      class chargesSelector{};
      class grenadesSelector{};
    };
    class notifications {
      file = "client\ui\notifications";
      class notify{};
    };
  };
  class phx_admin {
    class adminPatches {
      file = "server\patches";
      class adminPatch{};
      class jipPatch{};
    };
    class adminKick {
      file = "client\misc\admin\adminKick";
      class addAdminKickButton{};
      class adminKickUI{};
      class kickPlayer{};
    };
    class gameEnd {
      file = "client\misc\admin";
      class adminGameEnd{};
    };
  };
  class phx_selector {
    class selectors {
      file = "client\loadout\selector";
      class init{};
      class weapons{};
      class optics{};
      class grenades{};
      class charges{};
      class csw{};
    };
  };
};
