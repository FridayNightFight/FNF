class CfgPatches
{
  class fnf_eden
  {
    units[] = {"fnf_module_init", "fnf_module_playZone", "fnf_module_safeZone", "fnf_module_hidingZone", "fnf_module_selectorHost", "fnf_module_selectorOption", "fnf_module_destroyObj", "fnf_module_sectorCaptureObj", "fnf_module_sectorHoldObj"};
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
		displayName = "FNF";
	};
};

class CfgVehicles
{
	class Logic;
	class Module_F: Logic
	{
		class AttributesBase
		{
			class Default;
			class Edit;					// Default edit box (i.e. text input field)
			class Combo;				// Default combo box (i.e. drop-down menu)
			class Checkbox;				// Default checkbox (returned value is Boolean)
			class CheckboxNumber;		// Default checkbox (returned value is Number)
			class ModuleDescription;	// Module description
			class Units;				// Selection of units on which the module is applied
		};

		// Description base classes (for more information see below):
		class ModuleDescription
		{
			class AnyBrain;
		};
	};

  class fnf_module_init: Module_F
	{
		author = "Mallen";
    category = "fnf_standardCategory";
    displayName = "FNF Init";
    scope = 2;

    class Attributes: AttributesBase
    {
      class ViewDistance: Edit
      {
        property = "fnf_viewDistance"
        expression = "_this setVariable ['fnf_viewDistance',_value];";
        displayName = "View Distance";
        typeName = "NUMBER";
				defaultValue = "1000";
      };
      class FortifyPoints: Edit
      {
        property = "fnf_fortifyPoints"
        expression = "_this setVariable ['fnf_fortifyPoints',_value];";
        displayName = "Fortify Points";
        typeName = "NUMBER";
				defaultValue = "100";
      };
      class Debug: Checkbox
      {
        property = "fnf_debug"
        expression = "_this setVariable ['fnf_debug',_value];";
        displayName = "Debug";
        tooltip = "If checked, debug data will be shown";
        typeName = "BOOL";
        defaultValue = "false";
      };
    };
	};
	class fnf_module_playZone: Module_F
	{
		author = "Mallen";
    category = "fnf_standardCategory";
    displayName = "FNF Play Zone";
    scope = 2;
    class Attributes: AttributesBase
    {
      class Prefix: Edit
      {
        property = "fnf_prefix"
        expression = "_this setVariable ['fnf_prefix',_value];";
        displayName = "Marker Prefix";
        typeName = "STRING";
				defaultValue = "fnf_marker_playzone_";
      };
    };
	};
  class fnf_module_safeZone: Module_F
	{
		author = "Mallen";
    category = "fnf_standardCategory";
    displayName = "FNF Safe Zone";
    scope = 2;
    class Attributes: AttributesBase
    {
      class Prefix: Edit
      {
        property = "fnf_prefix"
        expression = "_this setVariable ['fnf_prefix',_value];";
        displayName = "Marker Prefix";
        typeName = "STRING";
				defaultValue = "fnf_marker_safezone_";
      };
      class VisibleToAllies: Checkbox
      {
        property = "fnf_visibleToAllies"
        expression = "_this setVariable ['fnf_visibleToAllies',_value];";
        displayName = "Visible to Allies";
        typeName = "BOOL";
        defaultValue = "true";
      };
      class VisibleToEnemies: Checkbox
      {
        property = "fnf_visibleToEnemies"
        expression = "_this setVariable ['fnf_visibleToEnemies',_value];";
        displayName = "Visible to Enemies";
        typeName = "BOOL";
        defaultValue = "true";
      };
    };
	};
  class fnf_module_hidingZone: Module_F
	{
		author = "Mallen";
    category = "fnf_standardCategory";
    displayName = "FNF Hiding Zone";
    scope = 2;
    class Attributes: AttributesBase
    {
      class Prefix: Edit
      {
        property = "fnf_prefix"
        expression = "_this setVariable ['fnf_prefix',_value];";
        displayName = "Marker Prefix";
        typeName = "STRING";
				defaultValue = "fnf_marker_hidingzone_";
      };
    };
	};
  class fnf_module_selectorHost: Module_F
	{
		author = "Mallen";
    category = "fnf_standardCategory";
    displayName = "FNF Selector";
    scope = 2;
    class Attributes: AttributesBase
    {
      class SelectorName: Edit
      {
        property = "fnf_selectorName"
        expression = "_this setVariable ['fnf_selectorName',_value];";
        displayName = "Selector Name";
        typeName = "STRING";
				defaultValue = "";
      };
      class ObjectiveType: Combo
      {
        property = "fnf_selectorType"
        expression = "_this setVariable ['fnf_selectorType',_value];";
        displayName = "Selector Type";
        typeName = "STRING";
				defaultValue = Item;
        class Values
        {
          class Item { name = "Item"; value = "itm";};
          class Optic { name = "Optic"; value = "opt";};
          class PrimaryWeapon { name = "Primary Weapon"; value = "pri";};
          class SecondaryWeapon { name = "Launcher"; value = "sec";};
          class Handgun { name = "Handgun"; value = "hnd";};
        };
      };
    };
	};
  class fnf_module_selectorOption: Module_F
	{
		author = "Mallen";
    category = "fnf_standardCategory";
    displayName = "FNF Selector Option";
    scope = 2;
    class Attributes: AttributesBase
    {
      class OptionName: Edit
      {
        property = "fnf_optionName"
        expression = "_this setVariable ['fnf_optionName',_value];";
        displayName = "Option Name";
        typeName = "STRING";
				defaultValue = "";
      };
      class DefaultSelection: Checkbox
      {
        property = "fnf_defaultSelection"
        expression = "_this setVariable ['fnf_defaultSelection',_value];";
        displayName = "Default?";
        tooltip = "If checked, this option will be treated as already selected";
        typeName = "BOOL";
        defaultValue = "false";
      };
    };
  };
  class fnf_module_objective: Module_F {};
  class fnf_module_destroyObj: fnf_module_objective
	{
		author = "Mallen";
    category = "fnf_standardCategory";
    displayName = "FNF Destroy Objective";
    scope = 2;
    class Attributes: AttributesBase
    {
      class ObjectiveType: Combo
      {
        property = "fnf_objectiveType"
        expression = "_this setVariable ['fnf_objectiveType',_value];";
        displayName = "Objective Type";
        typeName = "STRING";
				defaultValue = Destroy;
        class Values
        {
          class Destroy { name = "Destroy Object"; value = "des";};
          class Protect { name = "Protect Object"; value = "pro";};
        };
      };
      class ZoneKnown: Checkbox
      {
        property = "fnf_zoneKnown"
        expression = "_this setVariable ['fnf_zoneKnown',_value];";
        displayName = "Is hiding zone known";
        tooltip = "If checked, when object is in a linked hiding zone the zone it is in will have the task attached to it";
        typeName = "BOOL";
        defaultValue = "true";
      };
    };
	};
  class fnf_module_sectorCaptureObj: fnf_module_objective
	{
		author = "Mallen";
    category = "fnf_standardCategory";
    displayName = "FNF Capture Sector Objective";
    scope = 2;
    class Attributes: AttributesBase
    {
      class ObjectiveType: Combo
      {
        property = "fnf_objectiveType"
        expression = "_this setVariable ['fnf_objectiveType',_value];";
        displayName = "Objective Type";
        typeName = "STRING";
				defaultValue = "cap";
        class Values
        {
          class Capture { name = "Capture Sector"; value = "cap";};
          class Defend { name = "Defend Sector"; value = "def";};
        };
      };
    };
	};
  class fnf_module_sectorHoldObj: fnf_module_objective
	{
		author = "Mallen";
    category = "fnf_standardCategory";
    displayName = "FNF Hold Sector Objective";
    scope = 2;
    class Attributes: AttributesBase
    {
      class ObjectiveType: Combo
      {
        property = "fnf_objectiveType"
        expression = "_this setVariable ['fnf_objectiveType',_value];";
        displayName = "Objective Type";
        typeName = "STRING";
				defaultValue = "cap";
        class Values
        {
          class Capture { name = "Capture Sector"; value = "cap";};
          class Defend { name = "Defend Sector"; value = "def";};
        };
      };
    };
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
            defaultValue = "false";
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
            defaultValue = "true";
          };
          class fnf_vehicleLoadouts_useDefault
          {
            property = "FNF_vehicleLoadouts_useDefault";
            control = "Checkbox";
            displayName = "Use Default Loadout";
            tooltip = "If checked, the vehicle will be given a standardized FNF weapon set (if one is defined).";
            expression = "_this setVariable ['%s',_value];";
            typeName = "BOOL";
            condition = "objectVehicle";
            defaultValue = "true";
          };
        };
      };
    };
  };
};
