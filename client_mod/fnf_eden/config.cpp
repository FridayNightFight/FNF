class CfgPatches
{
  class fnf_eden
  {
    units[] = {"fnf_module_init", "fnf_module_playZone", "fnf_module_safeZone", "fnf_module_teleportPoles", "fnf_module_hidingZone", "fnf_module_selectorHost", "fnf_module_selectorOption", "fnf_module_breifingAssets", "fnf_module_kitInformation", "fnf_module_destroyObj", "fnf_module_sectorCaptureObj", "fnf_module_terminalObj", "fnf_module_sectorHoldObj", "fnf_module_assassinObj", "fnf_module_sequentialObjectivePlanner"};
    weapons[] = {};
    requiredVersion = 0.1;
    requiredAddons[] = {"A3_Modules_F", "cba_main", "ace_arsenal"}; //This is just to get the FNF section to the bottom of the attributes list
  };
};

class CfgFactionClasses
{
	class NO_CATEGORY;
	class fnf_standardCategory: NO_CATEGORY
	{
		displayName = "HK";
	};
};

#include "modules.hpp"
#include "systems.hpp"
#include "attributesAndTools.hpp"
