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
};
