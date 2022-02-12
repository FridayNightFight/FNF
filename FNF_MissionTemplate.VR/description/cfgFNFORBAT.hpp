class CfgFNFORBAT
{
	class FNFBLUPLTHQ
	{
		id = "Blue";
		idType = 3;
		side = "West"; // Unit side from CfgChainOfCommand >> Sides
		size = "Platoon"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
		type = "HQ"; // Unit type from CfgChainOfCommand >> Types
		// insignia = "\ca\missions_f\data\orbat\7thInfantry_ca.paa"; // Unit insignia, displayed in ORBAT background and in tooltip
		// colorInsignia[] = {0,0,1,1}; // Insignia image color (white default), can be either RGBA array, or class from CfgMarkerColors
		// commander = "Armstrong"; // Name of unit commander. Can be either direct name, or class from CfgWorlds >> GenericNames (random name from the list is then selected)
		// commanderRank = "GENERAL"; // Rank of unit commander (by default selected based on unit size)
		tags[] = {}; // Group tags. When opening ORBAT viewer, user can define what tags will be accepted.
		text = "BLUFOR Motorized Platoon"; // Custom text and short text, can still use some arguments when defined:
			// %1 - ID (e.g. "7th")
			// %2 - Type (e.g. "Infantry")
			// %3 - Size (e.g. "Division")
		textShort = "Platoon HQ";
		// texture = "\ca\missions_f\data\orbat\customTexture_ca.paa"; // Custom texture, will replace icon set by 'type' param.
		// color[] = {0,0,1,1}; // Custom color, will replace color set by 'side' param. Can be either RGBA array, or class from CfgMarkerColors (e.g. color = "ColorWEST";)
		// description= "All of your text would go here."; // A brief description of the group or unit.
		// assets[] = {{B_Heli_Transport_03_F,5},{B_Heli_Light_01_F,3},{B_Heli_Light_01_armed_F,4},B_Heli_Transport_01_camo_F}; // Will display pictures of all available assets to the unit commander:
	 	// Can be an array with format {classname, [int active icons], [int greyed out icons]}, or simply a classname
		subordinates[] = {}; // Subordinates, searched on the same level as this class.
		assets[] = {};

		class FNFBLUPLTX
		{
			id = "X-Ray";
			idType = 2;
			side = "West"; // Unit side from CfgChainOfCommand >> Sides
			size = "Squad"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
			type = "Recon"; // Unit type from CfgChainOfCommand >> Types
			text = "X-Ray Recon Team"; // Custom text and short text, can still use some arguments when defined:
				// %1 - ID (e.g. "7th")
				// %2 - Type (e.g. "Infantry")
				// %3 - Size (e.g. "Division")
			textShort = "X-Ray - Recon";
			description = "";
			assets[] = {};
		};

		class FNFBLUPLTA
		{
			id = "Alpha";
			idType = 2;
			side = "West"; // Unit side from CfgChainOfCommand >> Sides
			size = "Squad"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
			type = "MotorizedInfantry"; // Unit type from CfgChainOfCommand >> Types
			text = "Alpha Squad - Assault"; // Custom text and short text, can still use some arguments when defined:
				// %1 - ID (e.g. "7th")
				// %2 - Type (e.g. "Infantry")
				// %3 - Size (e.g. "Division")
			textShort = "Alpha - Assault";
			description = "";
			assets[] = {};

			class FNFBLUPLTA1 {
				id = 1;
				idType = 0;
				side = "West"; // Unit side from CfgChainOfCommand >> Sides
				size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
				type = "Infantry"; // Unit type from CfgChainOfCommand >> Types
				text = "Team 1 - Assault Team"; // Custom text and short text, can still use some arguments when defined:
					// %1 - ID (e.g. "7th")
					// %2 - Type (e.g. "Infantry")
					// %3 - Size (e.g. "Division")
				textShort = "Assault Team";
				assets[] = {};
			};

			class FNFBLUPLTA2 {
				id = 2;
				idType = 0;
				side = "West"; // Unit side from CfgChainOfCommand >> Sides
				size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
				type = "Infantry"; // Unit type from CfgChainOfCommand >> Types
				text = "Team 2 - Support Team"; // Custom text and short text, can still use some arguments when defined:
					// %1 - ID (e.g. "7th")
					// %2 - Type (e.g. "Infantry")
					// %3 - Size (e.g. "Division")
				textShort = "Support Team";
				assets[] = {};
			};

			class FNFBLUPLTAC {
				id = 3;
				idType = 0;
				side = "West"; // Unit side from CfgChainOfCommand >> Sides
				size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
				type = "MechanizedInfantry"; // Unit type from CfgChainOfCommand >> Types
				text = "Team 3 - Vehicle Crew"; // Custom text and short text, can still use some arguments when defined:
					// %1 - ID (e.g. "7th")
					// %2 - Type (e.g. "Infantry")
					// %3 - Size (e.g. "Division")
				textShort = "Vehicle Crew";
				assets[] = {};
			};
		};

		class FNFBLUPLTB
		{
			id = "Bravo";
			idType = 2;
			side = "West"; // Unit side from CfgChainOfCommand >> Sides
			size = "Squad"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
			type = "MotorizedInfantry"; // Unit type from CfgChainOfCommand >> Types
			text = "Bravo Squad - Heavy Weapons"; // Custom text and short text, can still use some arguments when defined:
				// %1 - ID (e.g. "7th")
				// %2 - Type (e.g. "Infantry")
				// %3 - Size (e.g. "Division")
			textShort = "Bravo - Heavy Weapons";
			description = "";

			class FNFBLUPLTB1 {
				id = 1;
				idType = 0;
				side = "West"; // Unit side from CfgChainOfCommand >> Sides
				size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
				type = "Infantry"; // Unit type from CfgChainOfCommand >> Types
				text = "Team 1 - MAT Team"; // Custom text and short text, can still use some arguments when defined:
					// %1 - ID (e.g. "7th")
					// %2 - Type (e.g. "Infantry")
					// %3 - Size (e.g. "Division")
				textShort = "MAT Team";
			};

			class FNFBLUPLTB2 {
				id = 2;
				idType = 0;
				side = "West"; // Unit side from CfgChainOfCommand >> Sides
				size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
				type = "Infantry"; // Unit type from CfgChainOfCommand >> Types
				text = "Team 2 - MMG Team"; // Custom text and short text, can still use some arguments when defined:
					// %1 - ID (e.g. "7th")
					// %2 - Type (e.g. "Infantry")
					// %3 - Size (e.g. "Division")
				textShort = "MMG Team";
			};

			class FNFBLUPLTBC {
				id = 3;
				idType = 0;
				side = "West"; // Unit side from CfgChainOfCommand >> Sides
				size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
				type = "MechanizedInfantry"; // Unit type from CfgChainOfCommand >> Types
				text = "Team 3 - Vehicle Crew"; // Custom text and short text, can still use some arguments when defined:
					// %1 - ID (e.g. "7th")
					// %2 - Type (e.g. "Infantry")
					// %3 - Size (e.g. "Division")
				textShort = "Vehicle Crew";
			};
		};

		class FNFBLUPLTC
		{
			id = "Charlie";
			idType = 2;
			side = "West"; // Unit side from CfgChainOfCommand >> Sides
			size = "Squad"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
			type = "MotorizedInfantry"; // Unit type from CfgChainOfCommand >> Types
			text = "Charlie Squad - Assault"; // Custom text and short text, can still use some arguments when defined:
				// %1 - ID (e.g. "7th")
				// %2 - Type (e.g. "Infantry")
				// %3 - Size (e.g. "Division")
			textShort = "Charlie - Assault";
			description = "";

			class FNFBLUPLTC1 {
				id = 1;
				idType = 0;
				side = "West"; // Unit side from CfgChainOfCommand >> Sides
				size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
				type = "Infantry"; // Unit type from CfgChainOfCommand >> Types
				text = "Team 1 - Assault Team"; // Custom text and short text, can still use some arguments when defined:
					// %1 - ID (e.g. "7th")
					// %2 - Type (e.g. "Infantry")
					// %3 - Size (e.g. "Division")
				textShort = "Assault Team";
			};

			class FNFBLUPLTC2 {
				id = 2;
				idType = 0;
				side = "West"; // Unit side from CfgChainOfCommand >> Sides
				size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
				type = "Infantry"; // Unit type from CfgChainOfCommand >> Types
				text = "Team 2 - Support Team"; // Custom text and short text, can still use some arguments when defined:
					// %1 - ID (e.g. "7th")
					// %2 - Type (e.g. "Infantry")
					// %3 - Size (e.g. "Division")
				textShort = "Support Team";
			};

			class FNFBLUPLTCC {
				id = 3;
				idType = 0;
				side = "West"; // Unit side from CfgChainOfCommand >> Sides
				size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
				type = "MechanizedInfantry"; // Unit type from CfgChainOfCommand >> Types
				text = "Team 3 - Vehicle Crew"; // Custom text and short text, can still use some arguments when defined:
					// %1 - ID (e.g. "7th")
					// %2 - Type (e.g. "Infantry")
					// %3 - Size (e.g. "Division")
				textShort = "Vehicle Crew";
			};
		};

		class FNFBLUPLTD
		{
			id = "Delta";
			idType = 2;
			side = "West"; // Unit side from CfgChainOfCommand >> Sides
			size = "Squad"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
			type = "MotorizedInfantry"; // Unit type from CfgChainOfCommand >> Types
			text = "Delta Squad - Heavy Weapons"; // Custom text and short text, can still use some arguments when defined:
				// %1 - ID (e.g. "7th")
				// %2 - Type (e.g. "Infantry")
				// %3 - Size (e.g. "Division")
			textShort = "Delta - Heavy Weapons";
			description = "";

			class FNFBLUPLTD1 {
				id = 1;
				idType = 0;
				side = "West"; // Unit side from CfgChainOfCommand >> Sides
				size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
				type = "Infantry"; // Unit type from CfgChainOfCommand >> Types
				text = "Team 1 - MAT Team"; // Custom text and short text, can still use some arguments when defined:
					// %1 - ID (e.g. "7th")
					// %2 - Type (e.g. "Infantry")
					// %3 - Size (e.g. "Division")
				textShort = "MAT Team";
			};

			class FNFBLUPLTD2 {
				id = 2;
				idType = 0;
				side = "West"; // Unit side from CfgChainOfCommand >> Sides
				size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
				type = "Infantry"; // Unit type from CfgChainOfCommand >> Types
				text = "Team 2 - MMG Team"; // Custom text and short text, can still use some arguments when defined:
					// %1 - ID (e.g. "7th")
					// %2 - Type (e.g. "Infantry")
					// %3 - Size (e.g. "Division")
				textShort = "MMG Team";
			};

			class FNFBLUPLTDC {
				id = 3;
				idType = 0;
				side = "West"; // Unit side from CfgChainOfCommand >> Sides
				size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
				type = "MechanizedInfantry"; // Unit type from CfgChainOfCommand >> Types
				text = "Team 3 - Vehicle Crew"; // Custom text and short text, can still use some arguments when defined:
					// %1 - ID (e.g. "7th")
					// %2 - Type (e.g. "Infantry")
					// %3 - Size (e.g. "Division")
				textShort = "Vehicle Crew";
			};
		};

		class FNFBLUPLTG1 {
			id = "Golf";
			idType = 2;
			side = "West"; // Unit side from CfgChainOfCommand >> Sides
			size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
			type = "Cavalry"; // Unit type from CfgChainOfCommand >> Types
			text = "Golf 1 - Detached Asset"; // Custom text and short text, can still use some arguments when defined:
				// %1 - ID (e.g. "7th")
				// %2 - Type (e.g. "Infantry")
				// %3 - Size (e.g. "Division")
			textShort = "Golf 1";
			texture = "b_mech_inf";
			description = "";
		};

		class FNFBLUPLTG2 {
			id = "Golf";
			idType = 2;
			side = "West"; // Unit side from CfgChainOfCommand >> Sides
			size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
			type = "Cavalry"; // Unit type from CfgChainOfCommand >> Types
			text = "Golf 2 - Detached Asset"; // Custom text and short text, can still use some arguments when defined:
				// %1 - ID (e.g. "7th")
				// %2 - Type (e.g. "Infantry")
				// %3 - Size (e.g. "Division")
			textShort = "Golf 2";
			texture = "b_mech_inf";
			description = "";
		};

		class FNFBLUPLTH1 {
			id = "Hotel";
			idType = 2;
			side = "West"; // Unit side from CfgChainOfCommand >> Sides
			size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
			type = "AviationSupport"; // Unit type from CfgChainOfCommand >> Types
			text = "Hotel 1 - Aerial Support"; // Custom text and short text, can still use some arguments when defined:
				// %1 - ID (e.g. "7th")
				// %2 - Type (e.g. "Infantry")
				// %3 - Size (e.g. "Division")
			textShort = "Hotel 1";
			description = "";
		};

		class FNFBLUPLTH2 {
			id = "Hotel";
			idType = 2;
			side = "West"; // Unit side from CfgChainOfCommand >> Sides
			size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
			type = "AviationSupport"; // Unit type from CfgChainOfCommand >> Types
			text = "Hotel 2 - Aerial Support"; // Custom text and short text, can still use some arguments when defined:
				// %1 - ID (e.g. "7th")
				// %2 - Type (e.g. "Infantry")
				// %3 - Size (e.g. "Division")
			textShort = "Hotel 2";
			description = "";
		};
	};









	class FNFOPFPLTHQ
	{
		id = "Red";
		idType = 3;
		side = "East"; // Unit side from CfgChainOfCommand >> Sides
		size = "Platoon"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
		type = "HQ"; // Unit type from CfgChainOfCommand >> Types
		// insignia = "\ca\missions_f\data\orbat\7thInfantry_ca.paa"; // Unit insignia, displayed in ORBAT background and in tooltip
		// colorInsignia[] = {0,0,1,1}; // Insignia image color (white default), can be either RGBA array, or class from CfgMarkerColors
		// commander = "Armstrong"; // Name of unit commander. Can be either direct name, or class from CfgWorlds >> GenericNames (random name from the list is then selected)
		// commanderRank = "GENERAL"; // Rank of unit commander (by default selected based on unit size)
		tags[] = {}; // Group tags. When opening ORBAT viewer, user can define what tags will be accepted.
		text = "OPFOR Motorized Platoon"; // Custom text and short text, can still use some arguments when defined:
			// %1 - ID (e.g. "7th")
			// %2 - Type (e.g. "Infantry")
			// %3 - Size (e.g. "Division")
		textShort = "Platoon HQ";
		// texture = "\ca\missions_f\data\orbat\customTexture_ca.paa"; // Custom texture, will replace icon set by 'type' param.
		// color[] = {0,0,1,1}; // Custom color, will replace color set by 'side' param. Can be either RGBA array, or class from CfgMarkerColors (e.g. color = "ColorWEST";)
		// description= "All of your text would go here."; // A brief description of the group or unit.
		// assets[] = {{B_Heli_Transport_03_F,5},{B_Heli_Light_01_F,3},{B_Heli_Light_01_armed_F,4},B_Heli_Transport_01_camo_F}; // Will display pictures of all available assets to the unit commander:
	 	// Can be an array with format {classname, [int active icons], [int greyed out icons]}, or simply a classname
		subordinates[] = {}; // Subordinates, searched on the same level as this class.
		assets[] = {};

		class FNFOPFPLTX
		{
			id = "X-Ray";
			idType = 2;
			side = "East"; // Unit side from CfgChainOfCommand >> Sides
			size = "Squad"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
			type = "Recon"; // Unit type from CfgChainOfCommand >> Types
			text = "X-Ray Recon Team"; // Custom text and short text, can still use some arguments when defined:
				// %1 - ID (e.g. "7th")
				// %2 - Type (e.g. "Infantry")
				// %3 - Size (e.g. "Division")
			textShort = "X-Ray - Recon";
			description = "";
		};

		class FNFOPFPLTA
		{
			id = "Alpha";
			idType = 2;
			side = "East"; // Unit side from CfgChainOfCommand >> Sides
			size = "Squad"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
			type = "MotorizedInfantry"; // Unit type from CfgChainOfCommand >> Types
			text = "Alpha Squad - Assault"; // Custom text and short text, can still use some arguments when defined:
				// %1 - ID (e.g. "7th")
				// %2 - Type (e.g. "Infantry")
				// %3 - Size (e.g. "Division")
			textShort = "Alpha - Assault";
			description = "";

			class FNFOPFPLTA1 {
				id = 1;
				idType = 0;
				side = "East"; // Unit side from CfgChainOfCommand >> Sides
				size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
				type = "Infantry"; // Unit type from CfgChainOfCommand >> Types
				text = "Team 1 - Assault Team"; // Custom text and short text, can still use some arguments when defined:
					// %1 - ID (e.g. "7th")
					// %2 - Type (e.g. "Infantry")
					// %3 - Size (e.g. "Division")
				textShort = "Assault Team";
			};

			class FNFOPFPLTA2 {
				id = 2;
				idType = 0;
				side = "East"; // Unit side from CfgChainOfCommand >> Sides
				size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
				type = "Infantry"; // Unit type from CfgChainOfCommand >> Types
				text = "Team 2 - Support Team"; // Custom text and short text, can still use some arguments when defined:
					// %1 - ID (e.g. "7th")
					// %2 - Type (e.g. "Infantry")
					// %3 - Size (e.g. "Division")
				textShort = "Support Team";
			};

			class FNFOPFPLTAC {
				id = 3;
				idType = 0;
				side = "East"; // Unit side from CfgChainOfCommand >> Sides
				size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
				type = "MechanizedInfantry"; // Unit type from CfgChainOfCommand >> Types
				text = "Team 3 - Vehicle Crew"; // Custom text and short text, can still use some arguments when defined:
					// %1 - ID (e.g. "7th")
					// %2 - Type (e.g. "Infantry")
					// %3 - Size (e.g. "Division")
				textShort = "Vehicle Crew";
			};
		};

		class FNFOPFPLTB
		{
			id = "Bravo";
			idType = 2;
			side = "East"; // Unit side from CfgChainOfCommand >> Sides
			size = "Squad"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
			type = "MotorizedInfantry"; // Unit type from CfgChainOfCommand >> Types
			text = "Bravo Squad - Heavy Weapons"; // Custom text and short text, can still use some arguments when defined:
				// %1 - ID (e.g. "7th")
				// %2 - Type (e.g. "Infantry")
				// %3 - Size (e.g. "Division")
			textShort = "Bravo - Heavy Weapons";
			description = "";

			class FNFOPFPLTB1 {
				id = 1;
				idType = 0;
				side = "East"; // Unit side from CfgChainOfCommand >> Sides
				size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
				type = "Infantry"; // Unit type from CfgChainOfCommand >> Types
				text = "Team 1 - MAT Team"; // Custom text and short text, can still use some arguments when defined:
					// %1 - ID (e.g. "7th")
					// %2 - Type (e.g. "Infantry")
					// %3 - Size (e.g. "Division")
				textShort = "MAT Team";
			};

			class FNFOPFPLTB2 {
				id = 2;
				idType = 0;
				side = "East"; // Unit side from CfgChainOfCommand >> Sides
				size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
				type = "Infantry"; // Unit type from CfgChainOfCommand >> Types
				text = "Team 2 - MMG Team"; // Custom text and short text, can still use some arguments when defined:
					// %1 - ID (e.g. "7th")
					// %2 - Type (e.g. "Infantry")
					// %3 - Size (e.g. "Division")
				textShort = "MMG Team";
			};

			class FNFOPFPLTBC {
				id = 3;
				idType = 0;
				side = "East"; // Unit side from CfgChainOfCommand >> Sides
				size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
				type = "MechanizedInfantry"; // Unit type from CfgChainOfCommand >> Types
				text = "Team 3 - Vehicle Crew"; // Custom text and short text, can still use some arguments when defined:
					// %1 - ID (e.g. "7th")
					// %2 - Type (e.g. "Infantry")
					// %3 - Size (e.g. "Division")
				textShort = "Vehicle Crew";
			};
		};

		class FNFOPFPLTC
		{
			id = "Charlie";
			idType = 2;
			side = "East"; // Unit side from CfgChainOfCommand >> Sides
			size = "Squad"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
			type = "MotorizedInfantry"; // Unit type from CfgChainOfCommand >> Types
			text = "Charlie Squad - Assault"; // Custom text and short text, can still use some arguments when defined:
				// %1 - ID (e.g. "7th")
				// %2 - Type (e.g. "Infantry")
				// %3 - Size (e.g. "Division")
			textShort = "Charlie - Assault";
			description = "";

			class FNFOPFPLTC1 {
				id = 1;
				idType = 0;
				side = "East"; // Unit side from CfgChainOfCommand >> Sides
				size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
				type = "Infantry"; // Unit type from CfgChainOfCommand >> Types
				text = "Team 1 - Assault Team"; // Custom text and short text, can still use some arguments when defined:
					// %1 - ID (e.g. "7th")
					// %2 - Type (e.g. "Infantry")
					// %3 - Size (e.g. "Division")
				textShort = "Assault Team";
			};

			class FNFOPFPLTC2 {
				id = 2;
				idType = 0;
				side = "East"; // Unit side from CfgChainOfCommand >> Sides
				size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
				type = "Infantry"; // Unit type from CfgChainOfCommand >> Types
				text = "Team 2 - Support Team"; // Custom text and short text, can still use some arguments when defined:
					// %1 - ID (e.g. "7th")
					// %2 - Type (e.g. "Infantry")
					// %3 - Size (e.g. "Division")
				textShort = "Support Team";
			};

			class FNFOPFPLTCC {
				id = 3;
				idType = 0;
				side = "East"; // Unit side from CfgChainOfCommand >> Sides
				size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
				type = "MechanizedInfantry"; // Unit type from CfgChainOfCommand >> Types
				text = "Team 3 - Vehicle Crew"; // Custom text and short text, can still use some arguments when defined:
					// %1 - ID (e.g. "7th")
					// %2 - Type (e.g. "Infantry")
					// %3 - Size (e.g. "Division")
				textShort = "Vehicle Crew";
			};
		};

		class FNFOPFPLTD
		{
			id = "Delta";
			idType = 2;
			side = "East"; // Unit side from CfgChainOfCommand >> Sides
			size = "Squad"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
			type = "MotorizedInfantry"; // Unit type from CfgChainOfCommand >> Types
			text = "Delta Squad - Heavy Weapons"; // Custom text and short text, can still use some arguments when defined:
				// %1 - ID (e.g. "7th")
				// %2 - Type (e.g. "Infantry")
				// %3 - Size (e.g. "Division")
			textShort = "Delta - Heavy Weapons";
			description = "";

			class FNFOPFPLTD1 {
				id = 1;
				idType = 0;
				side = "East"; // Unit side from CfgChainOfCommand >> Sides
				size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
				type = "Infantry"; // Unit type from CfgChainOfCommand >> Types
				text = "Team 1 - MAT Team"; // Custom text and short text, can still use some arguments when defined:
					// %1 - ID (e.g. "7th")
					// %2 - Type (e.g. "Infantry")
					// %3 - Size (e.g. "Division")
				textShort = "MAT Team";
			};

			class FNFOPFPLTD2 {
				id = 2;
				idType = 0;
				side = "East"; // Unit side from CfgChainOfCommand >> Sides
				size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
				type = "Infantry"; // Unit type from CfgChainOfCommand >> Types
				text = "Team 2 - MMG Team"; // Custom text and short text, can still use some arguments when defined:
					// %1 - ID (e.g. "7th")
					// %2 - Type (e.g. "Infantry")
					// %3 - Size (e.g. "Division")
				textShort = "MMG Team";
			};

			class FNFOPFPLTDC {
				id = 3;
				idType = 0;
				side = "East"; // Unit side from CfgChainOfCommand >> Sides
				size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
				type = "MechanizedInfantry"; // Unit type from CfgChainOfCommand >> Types
				text = "Team 3 - Vehicle Crew"; // Custom text and short text, can still use some arguments when defined:
					// %1 - ID (e.g. "7th")
					// %2 - Type (e.g. "Infantry")
					// %3 - Size (e.g. "Division")
				textShort = "Vehicle Crew";
			};
		};

		class FNFOPFPLTG1 {
			id = "Golf";
			idType = 2;
			side = "East"; // Unit side from CfgChainOfCommand >> Sides
			size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
			type = "Cavalry"; // Unit type from CfgChainOfCommand >> Types
			text = "Golf 1 - Detached Asset"; // Custom text and short text, can still use some arguments when defined:
				// %1 - ID (e.g. "7th")
				// %2 - Type (e.g. "Infantry")
				// %3 - Size (e.g. "Division")
			textShort = "Golf 1";
			texture = "b_mech_inf";
			description = "";
		};

		class FNFOPFPLTG2 {
			id = "Golf";
			idType = 2;
			side = "East"; // Unit side from CfgChainOfCommand >> Sides
			size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
			type = "Cavalry"; // Unit type from CfgChainOfCommand >> Types
			text = "Golf 2 - Detached Asset"; // Custom text and short text, can still use some arguments when defined:
				// %1 - ID (e.g. "7th")
				// %2 - Type (e.g. "Infantry")
				// %3 - Size (e.g. "Division")
			textShort = "Golf 2";
			texture = "b_mech_inf";
			description = "";
		};

		class FNFOPFPLTH1 {
			id = "Hotel";
			idType = 2;
			side = "East"; // Unit side from CfgChainOfCommand >> Sides
			size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
			type = "AviationSupport"; // Unit type from CfgChainOfCommand >> Types
			text = "Hotel 1 - Aerial Support"; // Custom text and short text, can still use some arguments when defined:
				// %1 - ID (e.g. "7th")
				// %2 - Type (e.g. "Infantry")
				// %3 - Size (e.g. "Division")
			textShort = "Hotel 1";
			description = "";
		};

		class FNFOPFPLTH2 {
			id = "Hotel";
			idType = 2;
			side = "East"; // Unit side from CfgChainOfCommand >> Sides
			size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
			type = "AviationSupport"; // Unit type from CfgChainOfCommand >> Types
			text = "Hotel 2 - Aerial Support"; // Custom text and short text, can still use some arguments when defined:
				// %1 - ID (e.g. "7th")
				// %2 - Type (e.g. "Infantry")
				// %3 - Size (e.g. "Division")
			textShort = "Hotel 2";
			description = "";
		};
	};









	class FNFINDPLTHQ
	{
		id = "Green";
		idType = 3;
		side = "Resistance"; // Unit side from CfgChainOfCommand >> Sides
		size = "Platoon"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
		type = "HQ"; // Unit type from CfgChainOfCommand >> Types
		// insignia = "\ca\missions_f\data\orbat\7thInfantry_ca.paa"; // Unit insignia, displayed in ORBAT background and in tooltip
		// colorInsignia[] = {0,0,1,1}; // Insignia image color (white default), can be either RGBA array, or class from CfgMarkerColors
		// commander = "Armstrong"; // Name of unit commander. Can be either direct name, or class from CfgWorlds >> GenericNames (random name from the list is then selected)
		// commanderRank = "GENERAL"; // Rank of unit commander (by default selected based on unit size)
		tags[] = {}; // Group tags. When opening ORBAT viewer, user can define what tags will be accepted.
		text = "INDFOR Motorized Platoon"; // Custom text and short text, can still use some arguments when defined:
			// %1 - ID (e.g. "7th")
			// %2 - Type (e.g. "Infantry")
			// %3 - Size (e.g. "Division")
		textShort = "Platoon HQ";
		// texture = "\ca\missions_f\data\orbat\customTexture_ca.paa"; // Custom texture, will replace icon set by 'type' param.
		// color[] = {0,0,1,1}; // Custom color, will replace color set by 'side' param. Can be either RGBA array, or class from CfgMarkerColors (e.g. color = "ColorWEST";)
		// description= "All of your text would go here."; // A brief description of the group or unit.
		// assets[] = {{B_Heli_Transport_03_F,5},{B_Heli_Light_01_F,3},{B_Heli_Light_01_armed_F,4},B_Heli_Transport_01_camo_F}; // Will display pictures of all available assets to the unit commander:
	 	// Can be an array with format {classname, [int active icons], [int greyed out icons]}, or simply a classname
		subordinates[] = {}; // Subordinates, searched on the same level as this class.
		assets[] = {};

		class FNFINDPLTX
		{
			id = "X-Ray";
			idType = 2;
			side = "Resistance"; // Unit side from CfgChainOfCommand >> Sides
			size = "Squad"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
			type = "Recon"; // Unit type from CfgChainOfCommand >> Types
			text = "X-Ray Recon Team"; // Custom text and short text, can still use some arguments when defined:
				// %1 - ID (e.g. "7th")
				// %2 - Type (e.g. "Infantry")
				// %3 - Size (e.g. "Division")
			textShort = "X-Ray - Recon";
			description = "";
		};

		class FNFINDPLTA
		{
			id = "Alpha";
			idType = 2;
			side = "Resistance"; // Unit side from CfgChainOfCommand >> Sides
			size = "Squad"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
			type = "MotorizedInfantry"; // Unit type from CfgChainOfCommand >> Types
			text = "Alpha Squad - Assault"; // Custom text and short text, can still use some arguments when defined:
				// %1 - ID (e.g. "7th")
				// %2 - Type (e.g. "Infantry")
				// %3 - Size (e.g. "Division")
			textShort = "Alpha - Assault";
			description = "";

			class FNFINDPLTA1 {
				id = 1;
				idType = 0;
				side = "Resistance"; // Unit side from CfgChainOfCommand >> Sides
				size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
				type = "Infantry"; // Unit type from CfgChainOfCommand >> Types
				text = "Team 1 - Assault Team"; // Custom text and short text, can still use some arguments when defined:
					// %1 - ID (e.g. "7th")
					// %2 - Type (e.g. "Infantry")
					// %3 - Size (e.g. "Division")
				textShort = "Assault Team";
			};

			class FNFINDPLTA2 {
				id = 2;
				idType = 0;
				side = "Resistance"; // Unit side from CfgChainOfCommand >> Sides
				size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
				type = "Infantry"; // Unit type from CfgChainOfCommand >> Types
				text = "Team 2 - Support Team"; // Custom text and short text, can still use some arguments when defined:
					// %1 - ID (e.g. "7th")
					// %2 - Type (e.g. "Infantry")
					// %3 - Size (e.g. "Division")
				textShort = "Support Team";
			};

			class FNFINDPLTAC {
				id = 3;
				idType = 0;
				side = "Resistance"; // Unit side from CfgChainOfCommand >> Sides
				size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
				type = "MechanizedInfantry"; // Unit type from CfgChainOfCommand >> Types
				text = "Team 3 - Vehicle Crew"; // Custom text and short text, can still use some arguments when defined:
					// %1 - ID (e.g. "7th")
					// %2 - Type (e.g. "Infantry")
					// %3 - Size (e.g. "Division")
				textShort = "Vehicle Crew";
			};
		};

		class FNFINDPLTB
		{
			id = "Bravo";
			idType = 2;
			side = "Resistance"; // Unit side from CfgChainOfCommand >> Sides
			size = "Squad"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
			type = "MotorizedInfantry"; // Unit type from CfgChainOfCommand >> Types
			text = "Bravo Squad - Heavy Weapons"; // Custom text and short text, can still use some arguments when defined:
				// %1 - ID (e.g. "7th")
				// %2 - Type (e.g. "Infantry")
				// %3 - Size (e.g. "Division")
			textShort = "Bravo - Heavy Weapons";
			description = "";

			class FNFINDPLTB1 {
				id = 1;
				idType = 0;
				side = "Resistance"; // Unit side from CfgChainOfCommand >> Sides
				size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
				type = "Infantry"; // Unit type from CfgChainOfCommand >> Types
				text = "Team 1 - MAT Team"; // Custom text and short text, can still use some arguments when defined:
					// %1 - ID (e.g. "7th")
					// %2 - Type (e.g. "Infantry")
					// %3 - Size (e.g. "Division")
				textShort = "MAT Team";
			};

			class FNFINDPLTB2 {
				id = 2;
				idType = 0;
				side = "Resistance"; // Unit side from CfgChainOfCommand >> Sides
				size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
				type = "Infantry"; // Unit type from CfgChainOfCommand >> Types
				text = "Team 2 - MMG Team"; // Custom text and short text, can still use some arguments when defined:
					// %1 - ID (e.g. "7th")
					// %2 - Type (e.g. "Infantry")
					// %3 - Size (e.g. "Division")
				textShort = "MMG Team";
			};

			class FNFINDPLTBC {
				id = 3;
				idType = 0;
				side = "Resistance"; // Unit side from CfgChainOfCommand >> Sides
				size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
				type = "MechanizedInfantry"; // Unit type from CfgChainOfCommand >> Types
				text = "Team 3 - Vehicle Crew"; // Custom text and short text, can still use some arguments when defined:
					// %1 - ID (e.g. "7th")
					// %2 - Type (e.g. "Infantry")
					// %3 - Size (e.g. "Division")
				textShort = "Vehicle Crew";
			};
		};

		class FNFINDPLTC
		{
			id = "Charlie";
			idType = 2;
			side = "Resistance"; // Unit side from CfgChainOfCommand >> Sides
			size = "Squad"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
			type = "MotorizedInfantry"; // Unit type from CfgChainOfCommand >> Types
			text = "Charlie Squad - Assault"; // Custom text and short text, can still use some arguments when defined:
				// %1 - ID (e.g. "7th")
				// %2 - Type (e.g. "Infantry")
				// %3 - Size (e.g. "Division")
			textShort = "Charlie - Assault";
			description = "";

			class FNFINDPLTC1 {
				id = 1;
				idType = 0;
				side = "Resistance"; // Unit side from CfgChainOfCommand >> Sides
				size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
				type = "Infantry"; // Unit type from CfgChainOfCommand >> Types
				text = "Team 1 - Assault Team"; // Custom text and short text, can still use some arguments when defined:
					// %1 - ID (e.g. "7th")
					// %2 - Type (e.g. "Infantry")
					// %3 - Size (e.g. "Division")
				textShort = "Assault Team";
			};

			class FNFINDPLTC2 {
				id = 2;
				idType = 0;
				side = "Resistance"; // Unit side from CfgChainOfCommand >> Sides
				size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
				type = "Infantry"; // Unit type from CfgChainOfCommand >> Types
				text = "Team 2 - Support Team"; // Custom text and short text, can still use some arguments when defined:
					// %1 - ID (e.g. "7th")
					// %2 - Type (e.g. "Infantry")
					// %3 - Size (e.g. "Division")
				textShort = "Support Team";
			};

			class FNFINDPLTCC {
				id = 3;
				idType = 0;
				side = "Resistance"; // Unit side from CfgChainOfCommand >> Sides
				size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
				type = "MechanizedInfantry"; // Unit type from CfgChainOfCommand >> Types
				text = "Team 3 - Vehicle Crew"; // Custom text and short text, can still use some arguments when defined:
					// %1 - ID (e.g. "7th")
					// %2 - Type (e.g. "Infantry")
					// %3 - Size (e.g. "Division")
				textShort = "Vehicle Crew";
			};
		};

		class FNFINDPLTD
		{
			id = "Delta";
			idType = 2;
			side = "Resistance"; // Unit side from CfgChainOfCommand >> Sides
			size = "Squad"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
			type = "MotorizedInfantry"; // Unit type from CfgChainOfCommand >> Types
			text = "Delta Squad - Heavy Weapons"; // Custom text and short text, can still use some arguments when defined:
				// %1 - ID (e.g. "7th")
				// %2 - Type (e.g. "Infantry")
				// %3 - Size (e.g. "Division")
			textShort = "Delta - Heavy Weapons";
			description = "";

			class FNFINDPLTD1 {
				id = 1;
				idType = 0;
				side = "Resistance"; // Unit side from CfgChainOfCommand >> Sides
				size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
				type = "Infantry"; // Unit type from CfgChainOfCommand >> Types
				text = "Team 1 - MAT Team"; // Custom text and short text, can still use some arguments when defined:
					// %1 - ID (e.g. "7th")
					// %2 - Type (e.g. "Infantry")
					// %3 - Size (e.g. "Division")
				textShort = "MAT Team";
			};

			class FNFINDPLTD2 {
				id = 2;
				idType = 0;
				side = "Resistance"; // Unit side from CfgChainOfCommand >> Sides
				size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
				type = "Infantry"; // Unit type from CfgChainOfCommand >> Types
				text = "Team 2 - MMG Team"; // Custom text and short text, can still use some arguments when defined:
					// %1 - ID (e.g. "7th")
					// %2 - Type (e.g. "Infantry")
					// %3 - Size (e.g. "Division")
				textShort = "MMG Team";
			};

			class FNFINDPLTDC {
				id = 3;
				idType = 0;
				side = "Resistance"; // Unit side from CfgChainOfCommand >> Sides
				size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
				type = "MechanizedInfantry"; // Unit type from CfgChainOfCommand >> Types
				text = "Team 3 - Vehicle Crew"; // Custom text and short text, can still use some arguments when defined:
					// %1 - ID (e.g. "7th")
					// %2 - Type (e.g. "Infantry")
					// %3 - Size (e.g. "Division")
				textShort = "Vehicle Crew";
			};
		};

		class FNFINDPLTG1 {
			id = "Golf";
			idType = 2;
			side = "Resistance"; // Unit side from CfgChainOfCommand >> Sides
			size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
			type = "Cavalry"; // Unit type from CfgChainOfCommand >> Types
			text = "Golf 1 - Detached Asset"; // Custom text and short text, can still use some arguments when defined:
				// %1 - ID (e.g. "7th")
				// %2 - Type (e.g. "Infantry")
				// %3 - Size (e.g. "Division")
			textShort = "Golf 1";
			texture = "b_mech_inf";
			description = "";
		};

		class FNFINDPLTG2 {
			id = "Golf";
			idType = 2;
			side = "Resistance"; // Unit side from CfgChainOfCommand >> Sides
			size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
			type = "Cavalry"; // Unit type from CfgChainOfCommand >> Types
			text = "Golf 2 - Detached Asset"; // Custom text and short text, can still use some arguments when defined:
				// %1 - ID (e.g. "7th")
				// %2 - Type (e.g. "Infantry")
				// %3 - Size (e.g. "Division")
			textShort = "Golf 2";
			texture = "b_mech_inf";
			description = "";
		};

		class FNFINDPLTH1 {
			id = "Hotel";
			idType = 2;
			side = "Resistance"; // Unit side from CfgChainOfCommand >> Sides
			size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
			type = "AviationSupport"; // Unit type from CfgChainOfCommand >> Types
			text = "Hotel 1 - Aerial Support"; // Custom text and short text, can still use some arguments when defined:
				// %1 - ID (e.g. "7th")
				// %2 - Type (e.g. "Infantry")
				// %3 - Size (e.g. "Division")
			textShort = "Hotel 1";
			description = "";
		};

		class FNFINDPLTH2 {
			id = "Hotel";
			idType = 2;
			side = "Resistance"; // Unit side from CfgChainOfCommand >> Sides
			size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
			type = "AviationSupport"; // Unit type from CfgChainOfCommand >> Types
			text = "Hotel 2 - Aerial Support"; // Custom text and short text, can still use some arguments when defined:
				// %1 - ID (e.g. "7th")
				// %2 - Type (e.g. "Infantry")
				// %3 - Size (e.g. "Division")
			textShort = "Hotel 2";
			description = "";
		};
	};
};
