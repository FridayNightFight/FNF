class CfgPatches
{
	class fnf_wargames_eden
	{
		units[] = {"fnf_module_selectorAssetHost", "fnf_module_mobileSpawnPointHandeler"};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_Modules_F", "cba_main", "ace_arsenal", "fnf_eden"}; //This is just to get the FNF section to the bottom of the attributes list
	};
};

#include "modules.hpp"
