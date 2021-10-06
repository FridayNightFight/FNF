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
    requiredAddons[] = {"rhs_c_rva"};
  };
};

class CfgVehicles {
  class Car_F;

  class Truck_F: Car_F{
    class UserActions;
  };

  class OTR21_Base: Truck_F {
    class UserActions: UserActions {
      class ControlPanel;
    };
  };

  class rhs_9k79: OTR21_Base {
    class UserActions: UserActions {
      class ControlPanel: ControlPanel {
        condition = "(alive this)&&((call rhs_fnc_findPlayer)==(gunner this))&&!(missionNamespace getVariable ['phx_safetyEnabled', true])";
      };
    };
  };
};
