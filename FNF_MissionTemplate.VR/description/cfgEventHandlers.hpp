//CBA Extended Event Handlers
class Extended_InitPost_EventHandlers {
  class CAManBase {
    class PHX_FixFriendlyFire { clientInit = "(_this select 0) addRating 100000;";};
  };
  class Car {
    class PHX_NoBitchZone { init = "(_this select 0) allowCrewInImmobile true;"; };
    class PHX_DisableThermals { serverInit = "(_this select 0) disableTIEquipment true;"; };
	class tnk_EjectCrew { init = "((_this select 0) addMPEventHandler ['MPKilled', {params ['_unit', '_killer', '_instigator', '_useEffects']; if !(isServer) exitWith {}; {_kill = selectRandom [0,1];if (_kill isEqualTo 1) then {_x setDamage 1;} else {moveOut _x;};} forEach crew _unit;}]);};"};
  };
  class Tank {
    class PHX_NoBitchZone { init = "(_this select 0) allowCrewInImmobile true;"; };
    class PHX_DisableThermals { serverInit = "(_this select 0) disableTIEquipment true;"; };
	class tnk_EjectCrew { init = "((_this select 0) addMPEventHandler ['MPKilled', {params ['_unit', '_killer', '_instigator', '_useEffects']; if !(isServer) exitWith {}; {_kill = selectRandom [0,1];if (_kill isEqualTo 1) then {_x setDamage 1;} else {moveOut _x;};} forEach crew _unit;}]);};"};
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