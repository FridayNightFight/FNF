//Extended Event Handlers:
class Extended_InitPost_EventHandlers {
  class CAManBase {
    class PHX_FixFriendlyFire { init = "if (local (_this select 0)) then {(_this select 0) addRating 100000;};";};
  };
  class Car {
    class PHX_NoBitchZone { init = "(_this select 0) allowCrewInImmobile true;"; };
    class PHX_DisableThermals { init = "(_this select 0) disableTIEquipment true;"; };
  };
  class Tank {
    class PHX_NoBitchZone { init = "(_this select 0) allowCrewInImmobile true;"; };
    class PHX_DisableThermals { init = "(_this select 0) disableTIEquipment true;"; };
  };
  class Helicopter {
    class PHX_DisableThermals { init = "(_this select 0) disableTIEquipment true;"; };
  };
  class Plane {
    class PHX_DisableThermals { init = "(_this select 0) disableTIEquipment true;"; };
  };
  class Ship_F {
    class PHX_DisableThermals { init = "(_this select 0) disableTIEquipment true;"; };
  };
};
