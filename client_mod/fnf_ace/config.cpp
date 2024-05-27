class CfgPatches
{
	class fnf_ace
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"ace_interaction"};
	};
};

class CfgVehicles {
	class Man;
	class CAManBase: Man {
		class ACE_SelfActions {
			class ACE_TeamManagement {
				class ACE_LeaveGroup {
					condition = "false";
				};
			};
		};
	};
};
