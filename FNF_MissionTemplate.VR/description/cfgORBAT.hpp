class CfgORBAT
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
		text = "BLUFOR Mechanized Platoon"; // Custom text and short text, can still use some arguments when defined:
			// %1 - ID (e.g. "7th")
			// %2 - Type (e.g. "Infantry")
			// %3 - Size (e.g. "Division")
		textShort = "BLU Platoon";
		// texture = "\ca\missions_f\data\orbat\customTexture_ca.paa"; // Custom texture, will replace icon set by 'type' param.
		// color[] = {0,0,1,1}; // Custom color, will replace color set by 'side' param. Can be either RGBA array, or class from CfgMarkerColors (e.g. color = "ColorWEST";)
		// description= "All of your text would go here."; // A brief description of the group or unit.
		// assets[] = {{B_Heli_Transport_03_F,5},{B_Heli_Light_01_F,3},{B_Heli_Light_01_armed_F,4},B_Heli_Transport_01_camo_F}; // Will display pictures of all available assets to the unit commander:
	 	// Can be an array with format {classname, [int active icons], [int greyed out icons]}, or simply a classname
		subordinates[] = {}; // Subordinates, searched on the same level as this class.

		class FNFBLUPLTX
		{
			id = "X-Ray";
			idType = 2;
			side = "West"; // Unit side from CfgChainOfCommand >> Sides
			size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
			type = "Recon"; // Unit type from CfgChainOfCommand >> Types
			text = "X-Ray Recon Team"; // Custom text and short text, can still use some arguments when defined:
				// %1 - ID (e.g. "7th")
				// %2 - Type (e.g. "Infantry")
				// %3 - Size (e.g. "Division")
			textShort = "X-Ray";
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
			textShort = "Alpha";

			class FNFBLUPLTA1 {
				id = 1;
				idType = 0;
				side = "West"; // Unit side from CfgChainOfCommand >> Sides
				size = "Fireteam"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
				type = "Assault"; // Unit type from CfgChainOfCommand >> Types
				text = "Team 1 - Assault Team"; // Custom text and short text, can still use some arguments when defined:
					// %1 - ID (e.g. "7th")
					// %2 - Type (e.g. "Infantry")
					// %3 - Size (e.g. "Division")
				textShort = "Team 1";
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
				textShort = "Team 2";
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
			textShort = "Bravo";
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
			textShort = "Charlie";
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
			textShort = "Delta";
		};
	};
};