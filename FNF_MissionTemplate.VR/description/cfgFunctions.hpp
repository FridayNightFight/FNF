class CfgFunctions {
  class fnf {
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
    class misc {
      file = "client\misc";
      class hintThenClear{};
      class fortifyClient{};
      class clientTime{};
      class clientSafeStartTime{};
      class handleRespawn{};
      class killCounter{};
      class showTimeOnMap{};
      class objectivePreview{};
      class fixUniformBug{};
      class SCUDFired{};
      class lobbyTextGenerator{};
      class lobbyTextGenButton{};
      class inSafeZone{};
      class inRestrictedZone{};
      class grassCut{};
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
  };
  class fnf_admin {
    class adminPatches {
      file = "client\loadout\patches";
      class setAdminPatch{};
    };
    class adminMenu {
      file = "client\misc\admin\menu";
      class addAdminUIButton{};
      class adminUI{};
      class serverCommands{};
    };
    class diaryActions {
      file = "client\misc\admin";
      class safetyEndExpression{};
    };
    class functions {
      file = "client\misc\admin\functions";
      class adminAdjustGameClock{};
      class adminSetLoadout{};
      class copyPlayerUIDs{};
      class killPlayer{};
      class messagePlayer{};
      class resetAnimState{};
      class respawnPlayer{};
      class setIndforAllegiance{};
      class zuesAceOptions{};
    };
    class gameEnd {
      file = "client\misc\admin";
      class adminGameEnd{};
    };
  };
  class fnf_briefing {
    class core {
      file = "client\briefing";
      class init{};
      class setGroupIDs{};
      class createBrief{};
      class createBriefSpec{};
      class assetDiary{};
      class assetDiaryStruct{};
      class createOrbat{};
      class news{};
      class objectiveRecon{};
    };
    class tools {
      file = "client\briefing\tools";
      class parseLoadout{};
      class parseGear{};
      class parseMAT{};
      class parseCSW{};
      class weaponDetails{};
      class notesItems{};
      class getItemInfo{};
      class getUniformPics{};
    };
    class briefingtable {
      file = "client\briefing\table";
      class setupTables{};
      class setupTablesClient{};
      class removeTables{};
      class createTable{};
      class clearTable{};
    };
  };
  class fnf_article {
    class articles {
      file = "client\briefing\articles";
      class NewYear2022{};
    };
  };
  class fnf_client {
    class core {
      file = "client\init";
      class initCall{postInit = 1;};
      class init{};
      class canPlay{};
      class setupGame{};
      class staggeredLoad{};
      class teleportActions_SA{};
      class teleportActions_STD{};
    };
  };
  class fnf_selector {
    class selectors {
      file = "client\loadout\selector";
      class init{};
      class weapons{};
      class sidearm{};
      class optics{};
      class grenades{};
      class charges{};
      class csw{};
    };
  };
  class fnf_loadout {
    class core {
      file = "client\loadout";
      class applyLoadout{};
      class checkLoadout{};
      class addGear{};
    };
    class tools {
      file = "client\loadout\tools";
      class handleSHQAUX{};
      class screenshotLoadout{};
      class getWeaponMagazines{};
      class setMAT{};
    };
    class procedure {
      file = "client\loadout\procedure";
      class addUniform{};
      class giveRadios{};
      class giveGear{};
      class givePrimaryWeapon{};
      class prepWeaponsSelector{};
      class giveSidearmWeapon{};
      class giveSilencer{};
      class giveNVG{};
      class giveAT{};
      class prepOpticsSelector{};
      class giveCECharges{};
      class giveCEGrenades{};
      class setAttributes{};
      class giveSideKey{};
      class giveBinoculars{};
      class loadWeapons{};
      class setRank{};
      class setFace{};
    };
  };
  class fnf_radio {
    class functions {
      file = "client\radio";
      class waitGear{};
      class getChannels{};
      class calcBaseFreqs{};
      class setRadios{};
      class cleanup{};
    };
  };
  class fnf_restrictions {
    class functions {
      file = "client\restrictions";
      class init{};
      class disableTyping{postInit = 1;};
      class zoneBoundary{};
      class startBoundary{};
      class restrictedZones{};
      class disableMisc{};
      class afkCheck{};
      class removeRespawnButton{};
      class hideMarkers{};
      class restrictUniform{};
      class restrictETool{};
      class restrictGamma{};
      class viewDistance{};
      class restrictVoiceVolume{};
      class restrictWeaponThermal{};
      class restrictTeamManagement{};
    };
  };
  class fnf_safety {
    class safety {
      file = "client\safety";
      class init{};
      class handleVics{};
      class reapplySafetyVic{};
    };
  };
  class fnf_spectator {
    class functions {
      file = "client\spectator";
      class init{};
      class muteSpectators{};
    };
  };
  class fnf_ui {
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
    class draw3D {
      file = "client\ui\draw3D";
      class drawStaffIcons{};
      class drawCmdIcons{};
      class drawSLIcons{};
      class drawHelpers{};
    };
    class scripts {
      file = "client\ui";
      class missionInfoPanel{};
    };
    class map {
      file = "client\ui\map";
      class mapZoneAssets{};
    };
  };
  class fnf_server {
    class initServer {
      file = "server\init";
      class safety{};
      class sendUniforms{};
      class markCustomObjs{};
      class fortifyServer{};
      class setupGame{};
      class genRadioFreqs{};
      class keyVehicles{};
      class lockVehicles{};
      class vehicleRadios{};
      class ambientFlyby{};
      class restoreAirLoadouts{};
      class safeZoneTeleportInit_STD{};
      class newPlayers{};
      class markSafezoneAssets{};
      class genIrregularZone{};
      class airdropAssets{};
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
      class customDamage{};
    };
    class webhook {
      file = "server\webhook";
      class webhook_roundPrep;
      class webhook_roundStart;
      class webhook_roundEnd;
    };
  };
  class fnf_debug {
    class functions {
      file = "server\debug";
      class init{postInit=1;};
      class config{preInit=1;};
    };
  };
  class fnf_vehicleLoadouts {
    class tools {
      file = "description\vehicleLoadouts";
      class getLoadout{};
      class getTurretWeps{};
      class shouldModify{};
      class clearAll{};
    };
    class functions {
      file = "description\vehicleLoadouts\functions";
      class 2B14Podnos{};
      class AAV{};
      class AH1Z{};
      class AH6M{};
      class BMP1{};
      class BMP2{};
      class FV510{};
      class GAZ{};
      class Ka52{};
      class LAV25{};
      class LAVC2{};
      class M252{};
      class M1117{};
      class Mi24P{};
      class Mi24V{};
      class MkVSOC{};
      class speedboatHMG{};
      class speedboatMinigun{};
    };
  };
  class fnf_missionSpecials {
    class functions {
      file = "missionSpecials";
      class config{postInit=1;};
      class ambientAirdrop{};
      class ambientArtillery{};
    };
    class tools {
      file = "missionSpecials\tools";
      class ambientAirdrop_plane{};
      class ambientAirdrop_box{};
      class ambientAirdrop_smoke{};
    };
  };
};
