//CBA Extended Event Handlers

// run on every vehicle just after it's inited
class Extended_InitPost_EventHandlers {

  #include "cfgFNFVehicleLoadouts.hpp"

  // other init settings
  class CAManBase {
    class fnf_FixFriendlyFire { clientInit = "(_this select 0) addRating 100000;";};
  };
  class Car {
    class fnf_NoBitchZone { init = "(_this select 0) allowCrewInImmobile true;"; };
    class fnf_DisableThermals { serverInit = "(_this select 0) disableTIEquipment true;"; };
    //class fnf_ignoreCookoff { serverInit = "(this select 0) setVariable [""ace_cookoff_enable"", false, true]"; }; doesn't seem to set the var
  };
  class Tank {
    class fnf_NoBitchZone { init = "(_this select 0) allowCrewInImmobile true;"; };
    class fnf_DisableThermals { serverInit = "(_this select 0) disableTIEquipment true;"; };
  };
  class StaticWeapon {
    class fnf_DisableThermals { serverInit = "(_this select 0) disableTIEquipment true;"; };
  };
  class Ship_F {
    class fnf_DisableThermals { serverInit = "(_this select 0) disableTIEquipment true;"; };
  };
  class Air {
    class FNF_restoreAirLoadouts { serverInit = "_this spawn fnf_server_fnc_restoreAirLoadouts"; };
    class fnf_DisableThermals { serverInit = "(_this select 0) disableTIEquipment true;"; };
  };
};

// run once at mission PostInit
class Extended_PostInit_Eventhandlers {
  class FNF_saveAirLoadouts {
    serverInit = "{private _vehicle= _x;_vehicle setVariable[""fnf_pylonLoadout"",getAllPylonsInfo _vehicle,true];_vehicle setVariable [""ace_pylons_magazineWhitelist"", getPylonMagazines _vehicle select {_x != """"}, true];[_vehicle] spawn fnf_server_fnc_restoreAirLoadouts;}forEach(entities[[""Air""],[],false,true]);if(is3DENPreview) then {""[FNF] (saveAirLoadouts) [PreviewOnly] Inited air vehicle pylon settings"" remoteExec [""systemChat"", 0];};";
  };
  class FNF_cleanModules {
    serverInit = "if !(fnf_gameMode isEqualTo ""neutralSector"")then{{deleteVehicle _x}forEach([""fnf_sector1"",""fnf_sector2"",""fnf_sector3"",""fnf_sector4""]apply{missionNamespace getVariable[_x,objNull]}select{!isNull _x});};";
  };
};

// run when the vehicle changes locality
class Extended_Local_EventHandlers {
  class AllVehicles {
    class FNF_applySafetyOnLocalitySwitch {
      local = "_this call fnf_safety_fnc_reapplySafetyVic;";
    };
  };
};

// run when the vehicle is being fired
class Extended_FiredBIS_Eventhandlers {
  class rhs_9k79_K {
    ScudFired = "_this call fnf_fnc_SCUDfired";
  };
};
