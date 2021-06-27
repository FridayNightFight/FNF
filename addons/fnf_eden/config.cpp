class CfgPatches
{
	class fnf_eden
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"cba_main", "ace_arsenal"}; //This is just to get the FNF section to the bottom of the attributes list
	};
};

class Cfg3DEN
{
  class Object
  {
    class AttributeCategories
    {
      class fnf_properties
      {
        displayName = "FNF Properties";
        collapsed = 1;
		class Attributes
		{
			class fnf_autoMarkExclude
			{
				property = "FNF_MarkingExclude";
				control = "Checkbox";
				displayName = "Exclude from Map Auto-Mark";
				tooltip = "If checked, this object will be excluded from the FNF custom object marking script.";
				expression = "_this setVariable ['%s',_value];";
				typeName = "BOOL";
				condition = "1 - objectControllable - objectVehicle";
				defaultValue = false;
			};
			class fnf_clearInventory
			{
				property = "FNF_InventoryAutoClear";
				control = "Checkbox";
				displayName = "Clear Inventory";
				tooltip = "If checked, the vehicle's inventory will be cleared.";
				expression = "_this setVariable ['%s',_value];";
				typeName = "BOOL";
				condition = "objectVehicle";
				defaultValue = true;
			};
		};
      };
    };
  };
};
