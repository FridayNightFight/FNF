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

	class fnf_module_init: Module_F
	{
		author = "Mallen";
		category = "fnf_standardCategory";
		displayName = "FNF Init";
		icon = "A3\Modules_F_Tacops\Data\CivilianPresence\icon32_ca.paa";
		scope = 2;

		class Attributes: AttributesBase
		{
			class GameTime: Edit
			{
				property = "fnf_gameTime";
				expression = "_this setVariable ['fnf_gameTime',_value, true];";
				displayName = "Time Limit";
				tooltip = "How long the game should last in minutes";
				typeName = "NUMBER";
				defaultValue = "65";
			};
			class ViewDistance: Edit
			{
				property = "fnf_viewDistance";
				expression = "_this setVariable ['fnf_viewDistance',_value, true];";
				displayName = "View Distance";
				tooltip = "How far players can see in meters";
				typeName = "NUMBER";
				defaultValue = "1000";
			};
			class FortifyPoints: Edit
			{
				property = "fnf_fortifyPoints";
				expression = "_this setVariable ['fnf_fortifyPoints',_value, true];";
				displayName = "Fortify Points";
				tooltip = "How many fortify points each combat engineer has to fortify";
				typeName = "NUMBER";
				defaultValue = "100";
			};
			class FortifyColour: Combo
			{
				property = "fnf_fortifyColour";
				expression = "_this setVariable ['fnf_fortifyColour',_value, true];";
				displayName = "Fortify Colour";
				tooltip = "The colour of the fortify objects placed by combat engineers";
				typeName = "STRING";
				defaultValue = Green;
				class Values
				{
					class Green { name = "Green"; value = "Green";};
					class Tan { name = "Tan"; value = "Tan";};
				};
			};
			class DisableFortifyBlufor: Checkbox
			{
				property = "fnf_disableFortifyBlufor";
				expression = "_this setVariable ['fnf_disableFortifyBlufor',_value, true];";
				displayName = "Disable Fortify Blufor";
				tooltip = "If checked, fortify will be disabled for Blufor";
				typeName = "BOOL";
				defaultValue = "false";
			};
			class DisableFortifyOpfor: Checkbox
			{
				property = "fnf_disableFortifyOpfor";
				expression = "_this setVariable ['fnf_disableFortifyOpfor',_value, true];";
				displayName = "Disable Fortify Opfor";
				tooltip = "If checked, fortify will be disabled for Opfor";
				typeName = "BOOL";
				defaultValue = "false";
			};
			class DisableFortifyIndfor: Checkbox
			{
				property = "fnf_disableFortifyIndfor";
				expression = "_this setVariable ['fnf_disableFortifyIndfor',_value, true];";
				displayName = "Disable Fortify Independent";
				tooltip = "If checked, fortify will be disabled for Independent";
				typeName = "BOOL";
				defaultValue = "false";
			};
			class BreifingNotes
			{
				control = "EditMulti5";
				property = "fnf_breifingNotes";
				expression = "_this setVariable ['fnf_breifingNotes',_value, true];";
				displayName = "Notes";
				tooltip = "General notes about the mission";
				typeName = "STRING";
				defaultValue = "";
			};
			class BreifingAO
			{
				control = "EditMulti5";
				property = "fnf_breifingAO";
				expression = "_this setVariable ['fnf_breifingAO',_value, true];";
				displayName = "Area of Operations";
				tooltip = "A description of terrain or specific features of the terrain to look out for";
				typeName = "STRING";
				defaultValue = "";
			};
			class BreifingBackground
			{
				control = "EditMulti5";
				property = "fnf_breifingBackground";
				expression = "_this setVariable ['fnf_breifingBackground',_value, true];";
				displayName = "Background";
				tooltip = "Lore or the background of the battle and why its happening";
				typeName = "STRING";
				defaultValue = "";
			};
			class BreifingRules
			{
				control = "EditMulti5";
				property = "fnf_breifingRules";
				expression = "_this setVariable ['fnf_breifingRules',_value, true];";
				displayName = "Mission Rules";
				tooltip = "Any custom rules that must be followed in the mission";
				typeName = "STRING";
				defaultValue = "";
			};
			class Debug: Checkbox
			{
				property = "fnf_debug";
				expression = "_this setVariable ['fnf_debug',_value, true];";
				displayName = "Debug";
				tooltip = "If checked, debug errors will be shown";
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
		icon = "\A3\modules_f\data\portraitStrategicMapOpen_ca.paa";
		scope = 2;
		class Attributes: AttributesBase
		{
			class Prefix: Edit
			{
				property = "fnf_prefix";
				expression = "_this setVariable ['fnf_prefix',_value, true];";
				displayName = "Marker Prefix";
				tooltip = "The prefix for the marker the play zone will look for when creating the play zone";
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
		icon = "\a3\Missions_F_Beta\data\img\portraitMPTypeDefense_ca.paa";
		scope = 2;
		class Attributes: AttributesBase
		{
			class Prefix: Edit
			{
				property = "fnf_prefix";
				expression = "_this setVariable ['fnf_prefix',_value, true];";
				displayName = "Marker Prefix";
				tooltip = "The prefix for the marker the safe zone will look for when creating the safe zone";
				typeName = "STRING";
				defaultValue = "fnf_marker_safezone_";
			};
			class TimeToBeDeleted: Edit
			{
				property = "fnf_timeZoneIsDeleted";
				expression = "_this setVariable ['fnf_timeZoneIsDeleted',_value, true];";
				displayName = "Time until Zone is Deleted";
				tooltip = "How long in minutes until the zone is deleted";
				typeName = "NUMBER";
				defaultValue = "15";
			};
			class VisibleToAllies: Checkbox
			{
				property = "fnf_visibleToAllies";
				expression = "_this setVariable ['fnf_visibleToAllies',_value, true];";
				displayName = "Visible to Allies";
				tooltip = "Whether the zone is visible to allies not assigned to it";
				typeName = "BOOL";
				defaultValue = "true";
			};
			class VisibleToEnemies: Checkbox
			{
				property = "fnf_visibleToEnemies";
				expression = "_this setVariable ['fnf_visibleToEnemies',_value, true];";
				displayName = "Visible to Enemies";
				tooltip = "Whether the zone is visible to enemies";
				typeName = "BOOL";
				defaultValue = "true";
			};
		};
	};
	class fnf_module_teleportPoles: Module_F
	{
		author = "Mallen";
		category = "fnf_standardCategory";
		displayName = "FNF Teleport Poles";
		icon = "\A3\modules_f\data\portraitStrategicMapMission_ca.paa";
		scope = 2;
		class Attributes: AttributesBase
		{
			class TimeToBeDeleted: Edit
			{
				property = "fnf_timePolesAreDeleted";
				expression = "_this setVariable ['fnf_timePolesAreDeleted',_value, true];";
				displayName = "Time until Poles is Deleted";
				tooltip = "How long in minutes util the teleport poles are deleted";
				typeName = "NUMBER";
				defaultValue = "15";
			};
			class VisibleToOthers: Checkbox
			{
				property = "fnf_visibleToOthers";
				expression = "_this setVariable ['fnf_visibleToOthers',_value, true];";
				displayName = "Visible To Others";
				tooltip = "Whether the teleport poles are visible to those not assigned to the teleport pole";
				typeName = "BOOL";
				defaultValue = "false";
			};
		};
	};
	class fnf_module_hidingZone: Module_F
	{
		author = "Mallen";
		category = "fnf_standardCategory";
		displayName = "FNF Hiding Zone";
		icon = "\a3\Modules_f\data\portraitSectorDummy_ca.paa";
		scope = 2;
		class Attributes: AttributesBase
		{
			class Prefix: Edit
			{
				property = "fnf_prefix";
				expression = "_this setVariable ['fnf_prefix',_value, true];";
				displayName = "Marker Prefix";
				tooltip = "The prefix for the marker the hiding zone will look for when creating the hiding zone";
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
				property = "fnf_selectorName";
				expression = "_this setVariable ['fnf_selectorName',_value, true];";
				displayName = "Selector Name";
				tooltip = "The name the slector is called in players ace menu";
				typeName = "STRING";
				defaultValue = "";
			};
			class ObjectiveType: Combo
			{
				property = "fnf_selectorType";
				expression = "_this setVariable ['fnf_selectorType',_value, true];";
				displayName = "Selector Type";
				tooltip = "The type of selector being described";
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
				property = "fnf_optionName";
				expression = "_this setVariable ['fnf_optionName',_value, true];";
				displayName = "Option Name";
				tooltip = "The name of the option in the players ace menu";
				typeName = "STRING";
				defaultValue = "";
			};
			class DefaultSelection: Checkbox
			{
				property = "fnf_defaultSelection";
				expression = "_this setVariable ['fnf_defaultSelection',_value, true];";
				displayName = "Default?";
				tooltip = "If checked, this option will be treated as already selected on mission start";
				typeName = "BOOL";
				defaultValue = "false";
			};
		};
	};
	class fnf_module_breifingAssets: Module_F
	{
		author = "Mallen";
		category = "fnf_standardCategory";
		displayName = "FNF Breifing Assets";
		icon = "\A3\Ui_f\data\IGUI\Cfg\simpleTasks\types\car_ca.paa";
		scope = 2;
		class Attributes: AttributesBase
		{
			class TimeToBeVincible: Edit
			{
				property = "fnf_timeToBeVincible";
				expression = "_this setVariable ['fnf_timeToBeVincible',_value, true];";
				displayName = "Time until connected vics are vincible";
				tooltip = "How long in minutes until the vics are vincible";
				typeName = "NUMBER";
				defaultValue = "15";
			};
		};
	};
	class fnf_module_kitInformation: Module_F
	{
		author = "Mallen";
		category = "fnf_standardCategory";
		displayName = "FNF Kit Information";
		icon = "\a3\Modules_F_Curator\Data\portraitMissionName_ca.paa";
		scope = 2;
		class Attributes: AttributesBase
		{
			class KitName: Edit
			{
				property = "fnf_kitName";
				expression = "_this setVariable ['fnf_kitName',_value, true];";
				displayName = "Name";
				tooltip = "The name associated with the kit";
				typeName = "STRING";
				defaultValue = "Unknown Kit";
			};
			class KitAuthor: Edit
			{
				property = "fnf_kitAuthor";
				expression = "_this setVariable ['fnf_kitAuthor',_value, true];";
				displayName = "Author";
				tooltip = "The author of the kit";
				typeName = "STRING";
				defaultValue = "Unknown Author";
			};
		};
	};
	class fnf_module_sequentialObjectivePlanner: Module_F
	{
		author = "Mallen";
		category = "fnf_standardCategory";
		displayName = "FNF Sequential Objective Planner";
		icon = "\a3\Modules_F_Curator\Data\portraitEndMission_ca.paa";
		scope = 2;
		class Attributes: AttributesBase
		{
			class NextObjectiveKnown: Checkbox
			{
				property = "fnf_nextObjectiveKnown";
				expression = "_this setVariable ['fnf_nextObjectiveKnown', _value, true];";
				displayName = "Is next Objective shown";
				tooltip = "If checked, the next objective will be visible before it is active, otherwise it will stay hidden";
				typeName = "BOOL";
				defaultValue = "true";
			};
		};
	};
	class fnf_module_objective: Module_F {};
	class fnf_module_destroyObj: fnf_module_objective
	{
		author = "Mallen";
		category = "fnf_standardCategory";
		displayName = "FNF Destroy Objective";
		icon = "\A3\Ui_f\data\IGUI\Cfg\simpleTasks\types\destroy_ca.paa";
		scope = 2;
		class Attributes: AttributesBase
		{
			class ObjectiveType: Combo
			{
				property = "fnf_objectiveType";
				expression = "_this setVariable ['fnf_objectiveType',_value, true];";
				displayName = "Objective Type";
				tooltip = "What the side is supposed to do with the objective";
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
				property = "fnf_zoneKnown";
				expression = "_this setVariable ['fnf_zoneKnown',_value, true];";
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
		icon = "\A3\Ui_f\data\IGUI\Cfg\simpleTasks\types\meet_ca.paa";
		scope = 2;
		class Attributes: AttributesBase
		{
			class ObjectiveType: Combo
			{
				property = "fnf_objectiveType";
				expression = "_this setVariable ['fnf_objectiveType',_value, true];";
				displayName = "Objective Type";
				tooltip = "What the side is supposed to do with the objective";
				typeName = "STRING";
				defaultValue = "cap";
				class Values
				{
					class Capture { name = "Capture Sector"; value = "cap";};
					class Defend { name = "Defend Sector"; value = "def";};
				};
			};
			class Prefix: Edit
			{
				property = "fnf_prefix";
				expression = "_this setVariable ['fnf_prefix',_value, true];";
				displayName = "Marker Prefix";
				tooltip = "The prefix for the marker the sector will look for when creating the sector";
				typeName = "STRING";
				defaultValue = "fnf_marker_sector_";
			};
			class TimeToCapture: Edit
			{
				property = "fnf_TimeToCapture";
				expression = "_this setVariable ['fnf_TimeToCapture',_value, true];";
				displayName = "Time to Capture";
				tooltip = "How long in seconds it takes for a side to completely capture the sector";
				typeName = "NUMBER";
				defaultValue = "60";
			};
		};
	};
	class fnf_module_terminalObj: fnf_module_objective
	{
		author = "Mallen";
		category = "fnf_standardCategory";
		displayName = "FNF Terminal Objective";
		icon = "\A3\Ui_f\data\IGUI\Cfg\simpleTasks\types\upload_ca.paa";
		scope = 2;
		class Attributes: AttributesBase
		{
			class ObjectiveType: Combo
			{
				property = "fnf_objectiveType";
				expression = "_this setVariable ['fnf_objectiveType',_value, true];";
				displayName = "Objective Type";
				tooltip = "What the side is supposed to do with the objective";
				typeName = "STRING";
				defaultValue = Capture;
				class Values
				{
					class Capture { name = "Hack Terminal"; value = "hck";};
					class Defend { name = "Defend Terminal"; value = "def";};
				};
			};
			class HackingTime: Edit
			{
				property = "fnf_hackingTime";
				expression = "_this setVariable ['fnf_hackingTime',_value, true];";
				displayName = "Time to Hack";
				tooltip = "How long in seconds it takes for a side to hack the terminal";
				typeName = "NUMBER";
				defaultValue = "90";
			};
			class ZoneKnown: Checkbox
			{
				property = "fnf_zoneKnown";
				expression = "_this setVariable ['fnf_zoneKnown',_value, true];";
				displayName = "Is hiding zone known";
				tooltip = "If checked, when object is in a linked hiding zone the zone it is in will have the task attached to it";
				typeName = "BOOL";
				defaultValue = "true";
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
				property = "fnf_objectiveType";
				expression = "_this setVariable ['fnf_objectiveType',_value, true];";
				displayName = "Objective Type";
				tooltip = "What the side is supposed to do with the objective";
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
	class fnf_module_assassinObj: fnf_module_objective
	{
		author = "Mallen";
		category = "fnf_standardCategory";
		displayName = "FNF Assassin Objective";
		icon = "\A3\Ui_f\data\IGUI\Cfg\simpleTasks\types\kill_ca.paa";
		scope = 2;
		class Attributes: AttributesBase
		{
			class ObjectiveType: Combo
			{
				property = "fnf_objectiveType";
				expression = "_this setVariable ['fnf_objectiveType',_value, true];";
				displayName = "Objective Type";
				tooltip = "What the side is supposed to do with the objective";
				typeName = "STRING";
				defaultValue = "elm";
				class Values
				{
					class Eliminate { name = "Eliminate Target"; value = "elm";};
					class Protect { name = "Protect Target"; value = "pro";};
				};
			};
			class TargetName: Edit
			{
				property = "fnf_targetName";
				expression = "_this setVariable ['fnf_targetName',_value, true];";
				displayName = "Target Name";
				tooltip = "The name assigned to the target in the task description";
				typeName = "STRING";
				defaultValue = "the VIP";
			};
			class ZoneKnown: Checkbox
			{
				property = "fnf_zoneKnown";
				expression = "_this setVariable ['fnf_zoneKnown',_value, true];";
				displayName = "Is hiding zone known";
				tooltip = "If checked, when object is in a linked hiding zone the zone it is in will have the task attached to it";
				typeName = "BOOL";
				defaultValue = "true";
			};
		};
	};
	class fnf_module_escortObj: fnf_module_objective
	{
		author = "Mallen";
		category = "fnf_standardCategory";
		displayName = "FNF Escort Objective";
		icon = "\A3\Ui_f\data\IGUI\Cfg\simpleTasks\types\run_ca.paa";
		scope = 2;
		class Attributes: AttributesBase
		{
			class ObjectiveType: Combo
			{
				property = "fnf_objectiveType";
				expression = "_this setVariable ['fnf_objectiveType',_value, true];";
				displayName = "Objective Type";
				tooltip = "What the side is supposed to do with the objective";
				typeName = "STRING";
				defaultValue = "esc";
				class Values
				{
					class Prevent { name = "Prevent Escort"; value = "prv";};
					class Escort { name = "Escort Object"; value = "esc";};
				};
			};
			class Prefix: Edit
			{
				property = "fnf_prefix";
				expression = "_this setVariable ['fnf_prefix',_value, true];";
				displayName = "Marker Prefix";
				tooltip = "The prefix for the marker the objective will look for when creating the end zone";
				typeName = "STRING";
				defaultValue = "fnf_marker_escortObject_";
			};
			class TimeToConfirm: Edit
			{
				property = "fnf_timeToConfirm";
				expression = "_this setVariable ['fnf_timeToConfirm',_value, true];";
				displayName = "Time to Confirm";
				tooltip = "How long in seconds it takes for the escort to be considered complete";
				typeName = "NUMBER";
				defaultValue = "60";
			};
			class TargetName: Edit
			{
				property = "fnf_targetName";
				expression = "_this setVariable ['fnf_targetName',_value, true];";
				displayName = "Target Name";
				tooltip = "The name assigned to the target in the task description";
				typeName = "STRING";
				defaultValue = "the VIP";
			};
			class ZoneKnown: Checkbox
			{
				property = "fnf_zoneKnown";
				expression = "_this setVariable ['fnf_zoneKnown',_value, true];";
				displayName = "Is hiding zone known";
				tooltip = "If checked, when object is in a linked hiding zone the zone it is in will have the task attached to it";
				typeName = "BOOL";
				defaultValue = "true";
			};
		};
	};
};
