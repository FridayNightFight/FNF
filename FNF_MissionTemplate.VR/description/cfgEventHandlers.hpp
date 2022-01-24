//CBA Extended Event Handlers

// run on every vehicle just after it's inited
class Extended_InitPost_EventHandlers {
  class CAManBase {
    class PHX_FixFriendlyFire { clientInit = "(_this select 0) addRating 100000;";};
  };
  class Car {
    class PHX_NoBitchZone { init = "(_this select 0) allowCrewInImmobile true;"; };
    class PHX_DisableThermals { serverInit = "(_this select 0) disableTIEquipment true;"; };
    class FNF_randomDamage { serverInit = "((_this select 0) addMPEventHandler ['MPKilled', {params ['_unit', '_killer', '_instigator', '_useEffects']; [_unit] spawn phx_server_fnc_handleDamage;}])"; };
    class PHX_ignoreCookoff { serverInit = "(this select 0) setVariable [""ace_cookoff_enable"", false, true]"; };
  };
  class Tank {
    class PHX_NoBitchZone { init = "(_this select 0) allowCrewInImmobile true;"; };
    class PHX_DisableThermals { serverInit = "(_this select 0) disableTIEquipment true;"; };
    class FNF_randomDamage { serverInit = "((_this select 0) addMPEventHandler ['MPKilled', {params ['_unit', '_killer', '_instigator', '_useEffects']; [_unit] spawn phx_server_fnc_handleDamage;}])"; };
  };
  class StaticWeapon {
    class PHX_DisableThermals { serverInit = "(_this select 0) disableTIEquipment true;"; };
  };
  class Ship_F {
    class PHX_DisableThermals { serverInit = "(_this select 0) disableTIEquipment true;"; };
  };
  class Air {
    class FNF_randomDamage { serverInit = "((_this select 0) addMPEventHandler ['MPKilled', {params ['_unit', '_killer', '_instigator', '_useEffects']; [_unit] spawn phx_server_fnc_handleDamage;}])"; };
    class FNF_restoreAirLoadouts { serverInit = "_this spawn phx_server_fnc_restoreAirLoadouts"; };
    class PHX_DisableThermals { serverInit = "(_this select 0) disableTIEquipment true;"; };
  };
};

// run once at mission PostInit
class Extended_PostInit_Eventhandlers {
  class FNF_saveAirLoadouts {
    serverInit = "{private _vehicle= _x;_vehicle setVariable[""fnf_pylonLoadout"",getPylonMagazines _vehicle,true];_vehicle setVariable [""ace_pylons_magazineWhitelist"", getPylonMagazines _vehicle select {_x != """"}, true];[_vehicle] spawn phx_server_fnc_restoreAirLoadouts;}forEach(entities[[""Air""],[],false,true]);""[FNF] (saveAirLoadouts) Inited air vehicle pylon settings"" remoteExec [""systemChat"", 0];"
  };
};

// run when the vehicle changes locality
class Extended_Local_EventHandlers {
  class AllVehicles {
    class FNF_applySafetyOnLocalitySwitch {
      local = "if (_this select 1) then {_this call phx_safety_fnc_reapplySafetyVic};";
    };
  };
};

// run when the vehicle is being fired
class Extended_FiredBIS_Eventhandlers {
  class rhs_9k79_K {
    ScudFired = "_this call phx_fnc_SCUDfired";
  };
};
