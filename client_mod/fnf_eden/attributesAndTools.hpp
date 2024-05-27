	};
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
						expression = "_this setVariable ['%s',_value, true];";
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
						expression = "_this setVariable ['%s',_value, true];";
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
						expression = "_this setVariable ['%s',_value, true];";
						typeName = "BOOL";
						condition = "objectVehicle";
						defaultValue = "true";
					};
				};
			};
		};
	};
};

class ctrlMenuStrip;
class display3DEN
{
	class Controls
	{
		class MenuStrip : ctrlMenuStrip
		{
			class Items
			{
				class Tools
				{
					items[] += {"fnf_mmFolder", "fnf_staffFolder"};
				};

				class fnf_mmFolder
				{
					text = "FNF Mission Maker Tools...";
					items[] = {"fnf_generateLobbyDescription"};
				};

				class fnf_staffFolder
				{
					text = "FNF Staff Tools...";
					items[] = {"fnf_checkKitsToComposition", "fnf_exportToCompositions", "fnf_importOldFrameworkKits"};
				};

				class fnf_checkKitsToComposition
				{
					text = "Check Kits To Composition";
					picture = "";
					action = "[] call FNF_ModFunctions_fnc_startKitCheck;";
					opensNewWindow = 0;
				};

				class fnf_generateLobbyDescription
				{
					text = "Generate Lobby Description";
					picture = "";
					action = "[] call FNF_ModFunctions_fnc_generateLobbyDescription;";
					opensNewWindow = 0;
				};

				class fnf_exportToCompositions
				{
					text = "Export to Compositions";
					picture = "";
					action = "[] call FNF_ModFunctions_fnc_exportToCompositions;";
					opensNewWindow = 0;
				};

				class fnf_importOldFrameworkKits
				{
					text = "Import Old Framework Loadouts";
					picture = "";
					action = "[] call FNF_ModFunctions_fnc_importOldFrameworkKits;";
					opensNewWindow = 1;
				};
			};
		};
	};
};
