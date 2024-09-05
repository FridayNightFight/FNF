class CfgVehicles
{
	class Logic;
	class Module_F: Logic
	{
		class AttributesBase
		{
			class Default;
			class Edit;
			class Combo;
			class Checkbox;
			class CheckboxNumber;
			class ModuleDescription;
			class Units;
		};

		class ModuleDescription
		{
			class AnyBrain;
		};
	};

	class fnf_module_safeZone: Module_F
	{
		class Attributes: AttributesBase
		{
			class SwitchToNonRestrictive: Checkbox
			{
				property = "fnf_switchToNonRestrictive";
				expression = "_this setVariable ['fnf_switchToNonRestrictive',_value, true];";
				displayName = "Switch to Non-Restrictive";
				tooltip = "Whether the zone switches to Non-Restrictive mode on deletion, all standard restrictions apply regarding weapon disables, however player can leave the zone";
				typeName = "BOOL";
				defaultValue = "false";
			};
		};
	};
	class fnf_module_selectorAssetHost: Module_F
	{
		author = "Mallen";
		category = "fnf_standardCategory";
		displayName = "FNF Asset Selector";
		scope = 2;
		class Attributes: AttributesBase
		{
			class SelectorName: Edit
			{
				property = "fnf_selectorName";
				expression = "_this setVariable ['fnf_selectorName',_value, true];";
				displayName = "Selector Name";
				tooltip = "The name the selector is called in players ace menu";
				typeName = "STRING";
				defaultValue = "";
			};
			class TimeToBeDeleted: Edit
			{
				property = "fnf_timeVicsAreDeleted";
				expression = "_this setVariable ['fnf_timeVicsAreDeleted',_value, true];";
				displayName = "Time until Vics are Deleted";
				tooltip = "How long in minutes util the left over vics are deleted";
				typeName = "NUMBER";
				defaultValue = "15";
			};
		};
	};
	class fnf_module_mobileSpawnPointHandeler: Module_F
	{
		author = "Mallen";
		category = "fnf_standardCategory";
		displayName = "FNF Mobile Spawn Point Handeler";
		scope = 2;
	};
};
