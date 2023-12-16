class CfgEditorCategories
{
	class fnf_Kits
	{
		displayName = "FNF - Kits";
	};
  class fnf_Objectives
	{
		displayName = "FNF - Objectives";
	};
  class fnf_Systems
	{
		displayName = "FNF - Systems";
	};
};

class CfgEditorSubcategories
{
	class fnf_Blufor
	{
		displayName = "Blufor";
	};
  class fnf_Opfor
	{
		displayName = "Opfor";
	};
  class fnf_Indfor
	{
		displayName = "Independant";
	};
  class fnf_CaptureSector
	{
		displayName = "Capture Sector";
	};
  class fnf_Destroy
	{
		displayName = "Destroy Object";
	};
  class fnf_Terminal
	{
		displayName = "Hack Terminal";
	};
  class fnf_Assassin
	{
		displayName = "Assassinate Target";
	};
  class fnf_SafeZones
	{
		displayName = "Safe Zones";
	};
  class fnf_PlayZones
	{
		displayName = "Play Zones";
	};
  class fnf_HidingZones
	{
		displayName = "Hiding Zones";
	};
  class fnf_TeleportPoles
	{
		displayName = "Teleport Poles";
	};
  class fnf_BreifingAssets
	{
		displayName = "Breifing Assets";
	};
};

class Cfg3DEN
{
  class Compositions
	{
    //play zones

    class fnf_PlayZone_1 // one class per composition
		{
			path = "fnf_eden\systems\PlayZonePreset[1]";	// pbo path to a folder containing header.sqe/composition.sqe files
			side = 8;											// 0 opfor, 1 blufor, 2 indfor, 3 civ, 8 Empty/Props
			editorCategory = "fnf_Systems";						// link to CfgEditorCategories
			editorSubcategory = "fnf_PlayZones";				// link to CfgEditorSubcategories
			displayName = "Play Zone Preset [ 1 ]";
			useSideColorOnIcon = 1;								// 1 == icon is always colored in faction color
		};
    class fnf_PlayZone_2 // one class per composition
		{
			path = "fnf_eden\systems\PlayZonePreset[2]";	// pbo path to a folder containing header.sqe/composition.sqe files
			side = 8;											// 0 opfor, 1 blufor, 2 indfor, 3 civ, 8 Empty/Props
			editorCategory = "fnf_Systems";						// link to CfgEditorCategories
			editorSubcategory = "fnf_PlayZones";				// link to CfgEditorSubcategories
			displayName = "Play Zone Preset [ 2 ]";
			useSideColorOnIcon = 1;								// 1 == icon is always colored in faction color
		};
    class fnf_PlayZone_3 // one class per composition
		{
			path = "fnf_eden\systems\PlayZonePreset[3]";	// pbo path to a folder containing header.sqe/composition.sqe files
			side = 8;											// 0 opfor, 1 blufor, 2 indfor, 3 civ, 8 Empty/Props
			editorCategory = "fnf_Systems";						// link to CfgEditorCategories
			editorSubcategory = "fnf_PlayZones";				// link to CfgEditorSubcategories
			displayName = "Play Zone Preset [ 3 ]";
			useSideColorOnIcon = 1;								// 1 == icon is always colored in faction color
		};

    //hiding zones

    class fnf_HidingZone_1 // one class per composition
		{
			path = "fnf_eden\systems\HidingZonePreset[1]";	// pbo path to a folder containing header.sqe/composition.sqe files
			side = 8;											// 0 opfor, 1 blufor, 2 indfor, 3 civ, 8 Empty/Props
			editorCategory = "fnf_Systems";						// link to CfgEditorCategories
			editorSubcategory = "fnf_HidingZones";				// link to CfgEditorSubcategories
			displayName = "Hiding Zone Preset [ 1 ]";
			useSideColorOnIcon = 1;								// 1 == icon is always colored in faction color
		};
    class fnf_HidingZone_2 // one class per composition
		{
			path = "fnf_eden\systems\HidingZonePreset[2]";	// pbo path to a folder containing header.sqe/composition.sqe files
			side = 8;											// 0 opfor, 1 blufor, 2 indfor, 3 civ, 8 Empty/Props
			editorCategory = "fnf_Systems";						// link to CfgEditorCategories
			editorSubcategory = "fnf_HidingZones";				// link to CfgEditorSubcategories
			displayName = "Hiding Zone Preset [ 2 ]";
			useSideColorOnIcon = 1;								// 1 == icon is always colored in faction color
		};
    class fnf_HidingZone_3 // one class per composition
		{
			path = "fnf_eden\systems\HidingZonePreset[3]";	// pbo path to a folder containing header.sqe/composition.sqe files
			side = 8;											// 0 opfor, 1 blufor, 2 indfor, 3 civ, 8 Empty/Props
			editorCategory = "fnf_Systems";						// link to CfgEditorCategories
			editorSubcategory = "fnf_HidingZones";				// link to CfgEditorSubcategories
			displayName = "Hiding Zone Preset [ 3 ]";
			useSideColorOnIcon = 1;								// 1 == icon is always colored in faction color
		};

    //safe zones

    class fnf_BluforSafeZone_1 // one class per composition
		{
			path = "fnf_eden\systems\(Blufor)SafeZonePreset[1]";	// pbo path to a folder containing header.sqe/composition.sqe files
			side = 8;											// 0 opfor, 1 blufor, 2 indfor, 3 civ, 8 Empty/Props
			editorCategory = "fnf_Systems";						// link to CfgEditorCategories
			editorSubcategory = "fnf_SafeZones";				// link to CfgEditorSubcategories
			displayName = "(Blufor) Safe Zone Preset [ 1 ]";
			useSideColorOnIcon = 1;								// 1 == icon is always colored in faction color
		};
    class fnf_BluforSafeZone_2 // one class per composition
		{
			path = "fnf_eden\systems\(Blufor)SafeZonePreset[2]";	// pbo path to a folder containing header.sqe/composition.sqe files
			side = 8;											// 0 opfor, 1 blufor, 2 indfor, 3 civ, 8 Empty/Props
			editorCategory = "fnf_Systems";						// link to CfgEditorCategories
			editorSubcategory = "fnf_SafeZones";				// link to CfgEditorSubcategories
			displayName = "(Blufor) Safe Zone Preset [ 2 ]";
			useSideColorOnIcon = 1;								// 1 == icon is always colored in faction color
		};
    class fnf_BluforSafeZone_3 // one class per composition
		{
			path = "fnf_eden\systems\(Blufor)SafeZonePreset[3]";	// pbo path to a folder containing header.sqe/composition.sqe files
			side = 8;											// 0 opfor, 1 blufor, 2 indfor, 3 civ, 8 Empty/Props
			editorCategory = "fnf_Systems";						// link to CfgEditorCategories
			editorSubcategory = "fnf_SafeZones";				// link to CfgEditorSubcategories
			displayName = "(Blufor) Safe Zone Preset [ 3 ]";
			useSideColorOnIcon = 1;								// 1 == icon is always colored in faction color
		};

    class fnf_IndforSafeZone_1 // one class per composition
		{
			path = "fnf_eden\systems\(Indfor)SafeZonePreset[1]";	// pbo path to a folder containing header.sqe/composition.sqe files
			side = 8;
			editorCategory = "fnf_Systems";						// link to CfgEditorCategories
			editorSubcategory = "fnf_SafeZones";				// link to CfgEditorSubcategories
			displayName = "(Indfor) Safe Zone Preset [ 1 ]";
			useSideColorOnIcon = 1;								// 1 == icon is always colored in faction color
		};
    class fnf_IndforSafeZone_2 // one class per composition
		{
			path = "fnf_eden\systems\(Indfor)SafeZonePreset[2]";	// pbo path to a folder containing header.sqe/composition.sqe files
			side = 8;
			editorCategory = "fnf_Systems";						// link to CfgEditorCategories
			editorSubcategory = "fnf_SafeZones";				// link to CfgEditorSubcategories
			displayName = "(Indfor) Safe Zone Preset [ 2 ]";
			useSideColorOnIcon = 1;								// 1 == icon is always colored in faction color
		};
    class fnf_IndforSafeZone_3 // one class per composition
		{
			path = "fnf_eden\systems\(Indfor)SafeZonePreset[3]";	// pbo path to a folder containing header.sqe/composition.sqe files
			side = 8;
			editorCategory = "fnf_Systems";						// link to CfgEditorCategories
			editorSubcategory = "fnf_SafeZones";				// link to CfgEditorSubcategories
			displayName = "(Indfor) Safe Zone Preset [ 3 ]";
			useSideColorOnIcon = 1;								// 1 == icon is always colored in faction color
		};

    class fnf_OpforSafeZone_1 // one class per composition
		{
			path = "fnf_eden\systems\(Opfor)SafeZonePreset[1]";	// pbo path to a folder containing header.sqe/composition.sqe files
			side = 8;
			editorCategory = "fnf_Systems";						// link to CfgEditorCategories
			editorSubcategory = "fnf_SafeZones";				// link to CfgEditorSubcategories
			displayName = "(Opfor) Safe Zone Preset [ 1 ]";
			useSideColorOnIcon = 1;								// 1 == icon is always colored in faction color
		};
    class fnf_OpforSafeZone_2 // one class per composition
		{
			path = "fnf_eden\systems\(Opfor)SafeZonePreset[2]";	// pbo path to a folder containing header.sqe/composition.sqe files
			side = 8;
			editorCategory = "fnf_Systems";						// link to CfgEditorCategories
			editorSubcategory = "fnf_SafeZones";				// link to CfgEditorSubcategories
			displayName = "(Opfor) Safe Zone Preset [ 2 ]";
			useSideColorOnIcon = 1;								// 1 == icon is always colored in faction color
		};
    class fnf_OpforSafeZone_3 // one class per composition
		{
			path = "fnf_eden\systems\(Opfor)SafeZonePreset[3]";	// pbo path to a folder containing header.sqe/composition.sqe files
			side = 8;
			editorCategory = "fnf_Systems";						// link to CfgEditorCategories
			editorSubcategory = "fnf_SafeZones";				// link to CfgEditorSubcategories
			displayName = "(Opfor) Safe Zone Preset [ 3 ]";
			useSideColorOnIcon = 1;								// 1 == icon is always colored in faction color
		};

    //teleports

    class fnf_BluforTeleportPole // one class per composition
		{
			path = "fnf_eden\systems\(Blufor)TeleportPolePreset";	// pbo path to a folder containing header.sqe/composition.sqe files
			side = 8;
			editorCategory = "fnf_Systems";						// link to CfgEditorCategories
			editorSubcategory = "fnf_TeleportPoles";				// link to CfgEditorSubcategories
			displayName = "(Blufor) Teleport Pole Preset";
			useSideColorOnIcon = 1;								// 1 == icon is always colored in faction color
		};
    class fnf_OpforTeleportPole // one class per composition
		{
			path = "fnf_eden\systems\(Opfor)TeleportPolePreset";	// pbo path to a folder containing header.sqe/composition.sqe files
			side = 8;
			editorCategory = "fnf_Systems";						// link to CfgEditorCategories
			editorSubcategory = "fnf_TeleportPoles";				// link to CfgEditorSubcategories
			displayName = "(Opfor) Teleport Pole Preset";
			useSideColorOnIcon = 1;								// 1 == icon is always colored in faction color
		};
    class fnf_IndforTeleportPole // one class per composition
		{
			path = "fnf_eden\systems\(Indfor)TeleportPolePreset";	// pbo path to a folder containing header.sqe/composition.sqe files
			side = 8;
			editorCategory = "fnf_Systems";						// link to CfgEditorCategories
			editorSubcategory = "fnf_TeleportPoles";				// link to CfgEditorSubcategories
			displayName = "(Indfor) Teleport Pole Preset";
			useSideColorOnIcon = 1;								// 1 == icon is always colored in faction color
		};

    //breifing assets

    class fnf_BluforBreifingAssets // one class per composition
		{
			path = "fnf_eden\systems\(Blufor)BreifingAssetsPreset";	// pbo path to a folder containing header.sqe/composition.sqe files
			side = 8;
			editorCategory = "fnf_Systems";						// link to CfgEditorCategories
			editorSubcategory = "fnf_BreifingAssets";				// link to CfgEditorSubcategories
			displayName = "(Blufor) Breifing Assets Preset";
			useSideColorOnIcon = 1;								// 1 == icon is always colored in faction color
		};
    class fnf_OpforBreifingAssets // one class per composition
		{
			path = "fnf_eden\systems\(Opfor)BreifingAssetsPreset";	// pbo path to a folder containing header.sqe/composition.sqe files
			side = 8;
			editorCategory = "fnf_Systems";						// link to CfgEditorCategories
			editorSubcategory = "fnf_BreifingAssets";				// link to CfgEditorSubcategories
			displayName = "(Opfor) Breifing Assets Preset";
			useSideColorOnIcon = 1;								// 1 == icon is always colored in faction color
		};
    class fnf_IndforBreifingAssets // one class per composition
		{
			path = "fnf_eden\systems\(Indfor)BreifingAssetsPreset";	// pbo path to a folder containing header.sqe/composition.sqe files
			side = 8;
			editorCategory = "fnf_Systems";						// link to CfgEditorCategories
			editorSubcategory = "fnf_BreifingAssets";				// link to CfgEditorSubcategories
			displayName = "(Indfor) Breifing Assets Preset";
			useSideColorOnIcon = 1;								// 1 == icon is always colored in faction color
		};

    //objectives

    class fnf_DestroyObjective // one class per composition
		{
			path = "fnf_eden\objectives\DestroyObjectivePreset";	// pbo path to a folder containing header.sqe/composition.sqe files
			side = 8;
			editorCategory = "fnf_Objectives";						// link to CfgEditorCategories
			editorSubcategory = "fnf_Destroy";				// link to CfgEditorSubcategories
			displayName = "Destroy Objective Preset";
			useSideColorOnIcon = 1;								// 1 == icon is always colored in faction color
		};

    class fnf_TerminalObjective // one class per composition
		{
			path = "fnf_eden\objectives\TerminalObjectivePreset";	// pbo path to a folder containing header.sqe/composition.sqe files
			side = 8;
			editorCategory = "fnf_Objectives";						// link to CfgEditorCategories
			editorSubcategory = "fnf_Terminal";				// link to CfgEditorSubcategories
			displayName = "Terminal Objective Preset";
			useSideColorOnIcon = 1;								// 1 == icon is always colored in faction color
		};

    class fnf_CaptureSectorObjective_1 // one class per composition
		{
			path = "fnf_eden\objectives\CaptureSectorObjectivePreset[1]";	// pbo path to a folder containing header.sqe/composition.sqe files
			side = 8;
			editorCategory = "fnf_Objectives";						// link to CfgEditorCategories
			editorSubcategory = "fnf_CaptureSector";				// link to CfgEditorSubcategories
			displayName = "Capture Sector Objective Preset [ 1 ]";
			useSideColorOnIcon = 1;								// 1 == icon is always colored in faction color
		};
    class fnf_CaptureSectorObjective_2 // one class per composition
		{
			path = "fnf_eden\objectives\CaptureSectorObjectivePreset[2]";	// pbo path to a folder containing header.sqe/composition.sqe files
			side = 8;
			editorCategory = "fnf_Objectives";						// link to CfgEditorCategories
			editorSubcategory = "fnf_CaptureSector";				// link to CfgEditorSubcategories
			displayName = "Capture Sector Objective Preset [ 2 ]";
			useSideColorOnIcon = 1;								// 1 == icon is always colored in faction color
		};
    class fnf_CaptureSectorObjective_3 // one class per composition
		{
			path = "fnf_eden\objectives\CaptureSectorObjectivePreset[3]";	// pbo path to a folder containing header.sqe/composition.sqe files
			side = 8;
			editorCategory = "fnf_Objectives";						// link to CfgEditorCategories
			editorSubcategory = "fnf_CaptureSector";				// link to CfgEditorSubcategories
			displayName = "Capture Sector Objective Preset [ 3 ]";
			useSideColorOnIcon = 1;								// 1 == icon is always colored in faction color
		};
    class fnf_AssassinObjective // one class per composition
		{
			path = "fnf_eden\objectives\AssassinObjectivePreset";	// pbo path to a folder containing header.sqe/composition.sqe files
			side = 8;
			editorCategory = "fnf_Objectives";						// link to CfgEditorCategories
			editorSubcategory = "fnf_Assassin";				// link to CfgEditorSubcategories
			displayName = "Assassin Objective Preset";
			useSideColorOnIcon = 1;								// 1 == icon is always colored in faction color
		};
