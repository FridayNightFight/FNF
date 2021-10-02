/*
  Vehicle configs
*/

class CfgPatches
{
  class fnf_vehicles
  {
    units[] = {};
    weapons[] = {};
    requiredVersion = 0.1;
    requiredAddons[] = {"ace_compat_rhs_afrf3"};
  };
};

class CfgVehicles {
  class Truck_F {
    class UserActions;
  };
  class OTR21_Base : Truck_F {
    class UserActions : UserActions {
      class ControlPanel;
    };
  };
  class rhs_9k79 : OTR21_Base {
    class UserActions : UserActions {
      class ControlPanel : ControlPanel {
        condition = "(alive this)&&((call rhs_fnc_findPlayer)==(gunner this))&&!(missionNamespace getVariable [""phx_safetyEnabled"", true])";
      };
    };
  };
};
