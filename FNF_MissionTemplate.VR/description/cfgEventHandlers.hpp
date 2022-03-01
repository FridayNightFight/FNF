//CBA Extended Event Handlers

// run on every vehicle just after it's inited
class Extended_InitPost_EventHandlers {
///*
  // automated turret weapon loadout changes
  // M1117
  class rhsusf_M1117_base {
    class FNF_SetLoadout {
      serverInit = "_this call fnf_vehicleLoadouts_fnc_M1117";
    };
  };
  // AH1Z
  class RHS_AH1Z_base {
    class FNF_SetLoadout {
      serverInit = "_this call fnf_vehicleLoadouts_fnc_AH1Z";
    };
  };
  // MkVSOC
  class rhsusf_mkvsoc {
    class FNF_SetLoadout {
      serverInit = "_this call fnf_vehicleLoadouts_fnc_MkVSOC";
    };
  };
  // speedboat HMG
  class O_Boat_Armed_01_hmg_F {
    class FNF_SetLoadout {
      serverInit = "_this call fnf_vehicleLoadouts_fnc_speedboatHMG";
    };
  };
  // speedboat minigun
  class I_Boat_Armed_01_minigun_F {
    class FNF_SetLoadout {
      serverInit = "_this call fnf_vehicleLoadouts_fnc_speedboatMinigun";
    };
  };
//*/

  // other init settings
  class CAManBase {
    class fnf_FixFriendlyFire { clientInit = "(_this select 0) addRating 100000;";};
  };
  class Car {
    class fnf_NoBitchZone { init = "(_this select 0) allowCrewInImmobile true;"; };
    class fnf_DisableThermals { serverInit = "(_this select 0) disableTIEquipment true;"; };
    class FNF_randomDamage { serverInit = "((_this select 0) addMPEventHandler ['MPKilled', {params ['_unit', '_killer', '_instigator', '_useEffects']; [_unit] spawn fnf_server_fnc_handleDamage;}])"; };
    class fnf_ignoreCookoff { serverInit = "(this select 0) setVariable [""ace_cookoff_enable"", false, true]"; };
  };
  class Tank {
    class fnf_NoBitchZone { init = "(_this select 0) allowCrewInImmobile true;"; };
    class fnf_DisableThermals { serverInit = "(_this select 0) disableTIEquipment true;"; };
    class FNF_randomDamage { serverInit = "((_this select 0) addMPEventHandler ['MPKilled', {params ['_unit', '_killer', '_instigator', '_useEffects']; [_unit] spawn fnf_server_fnc_handleDamage;}])"; };
  };
  class StaticWeapon {
    class fnf_DisableThermals { serverInit = "(_this select 0) disableTIEquipment true;"; };
  };
  class Ship_F {
    class fnf_DisableThermals { serverInit = "(_this select 0) disableTIEquipment true;"; };
  };
  class Air {
    class FNF_randomDamage { serverInit = "((_this select 0) addMPEventHandler ['MPKilled', {params ['_unit', '_killer', '_instigator', '_useEffects']; [_unit] spawn fnf_server_fnc_handleDamage;}])"; };
    class FNF_restoreAirLoadouts { serverInit = "_this spawn fnf_server_fnc_restoreAirLoadouts"; };
    class fnf_DisableThermals { serverInit = "(_this select 0) disableTIEquipment true;"; };
  };
};

// run once at mission PostInit
class Extended_PostInit_Eventhandlers {
  class FNF_saveAirLoadouts {
    serverInit = "{private _vehicle= _x;_vehicle setVariable[""fnf_pylonLoadout"",getAllPylonsInfo _vehicle,true];_vehicle setVariable [""ace_pylons_magazineWhitelist"", getPylonMagazines _vehicle select {_x != """"}, true];[_vehicle] spawn fnf_server_fnc_restoreAirLoadouts;}forEach(entities[[""Air""],[],false,true]);if(is3DENPreview) then {""[FNF] (saveAirLoadouts) [PreviewOnly] Inited air vehicle pylon settings"" remoteExec [""systemChat"", 0];};";
  };
};

// run when the vehicle changes locality
class Extended_Local_EventHandlers {
  class AllVehicles {
    class FNF_applySafetyOnLocalitySwitch {
      local = "if (_this select 1) then {_this call fnf_safety_fnc_reapplySafetyVic};";
    };
  };
};

// run when the vehicle is being fired
class Extended_FiredBIS_Eventhandlers {
  class rhs_9k79_K {
    ScudFired = "_this call fnf_fnc_SCUDfired";
  };
};
