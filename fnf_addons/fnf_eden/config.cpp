class CfgPatches
{
	class fnf_eden
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {};
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
                collapsed = 0;
                class Attributes
                {
                    class fnf_autoMarkExclude
                    {
                        displayName = "Exclude from Map Auto-Mark";
                        tooltip = "If checked, this object will be excluded from the FNF custom object marking script.";
                        property = "BooleanAutoMarkExclude";
                        control = "Checkbox";
                        expression = "_this setVariable ['%s',_value];";
                        defaultValue = "false";
                        unique = 0;
                        validate = "none";
                        condition = "1";
                        typeName = "BOOL";
                    };
                };
            };
        };
    };
};
