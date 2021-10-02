//CBA Extended Event Handlers
class Extended_InitPost_EventHandlers {
  class CAManBase {
    class PHX_FixFriendlyFire { clientInit = "(_this select 0) addRating 100000;";};
  };
  class Car {
    class PHX_NoBitchZone { init = "(_this select 0) allowCrewInImmobile true;"; };
    class PHX_DisableThermals { serverInit = "(_this select 0) disableTIEquipment true;"; };
    class tnk_randomDamage { serverInit = "((_this select 0) addMPEventHandler ['MPKilled', {params ['_unit', '_killer', '_instigator', '_useEffects']; [_unit] spawn PHX_fnc_handleDamage;}])"; };     
    };
  class Tank {
    class PHX_NoBitchZone { init = "(_this select 0) allowCrewInImmobile true;"; };
    class PHX_DisableThermals { serverInit = "(_this select 0) disableTIEquipment true;"; };
    class tnk_randomDamage { serverInit = "((_this select 0) addMPEventHandler ['MPKilled', {params ['_unit', '_killer', '_instigator', '_useEffects']; [_unit] spawn PHX_fnc_handleDamage;}])"; };     
  };
  class Helicopter {
    class PHX_DisableThermals { serverInit = "(_this select 0) disableTIEquipment true;"; };
  };
  class StaticWeapon {
    class PHX_DisableThermals { serverInit = "(_this select 0) disableTIEquipment true;"; };
  };
  class Plane {
    class PHX_DisableThermals { serverInit = "(_this select 0) disableTIEquipment true;"; };
  };
  class Ship_F {
    class PHX_DisableThermals { serverInit = "(_this select 0) disableTIEquipment true;"; };
  };
};

class Extended_FiredBIS_Eventhandlers {
  class rhs_9k79_K {
    ScudFired = "_this call phx_fnc_SCUDfired";
  };
};