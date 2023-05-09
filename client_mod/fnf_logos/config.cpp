class CfgPatches
{
	class fnf_ammo
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_Data_F_Tank_Loadorder"};
	};
};

// Logos and server connect buttons

/*extern*/ class RscPictureKeepAspect;
/*extern*/ class RscStandardDisplay;
/*extern*/ class RscControlsGroup;

class RscDisplayStart: RscStandardDisplay {

	class controls {

		class LoadingStart: RscControlsGroup {

			class controls {

				class Logo: RscPictureKeepAspect {
					onLoad = "(_this select 0) ctrlsettext '\fnf_logos\data\fnflogo.paa';";
				};
			};
		};
	};
};

class RscDisplayLoadMission: RscStandardDisplay {

	class controls {

		class LoadingStart: RscControlsGroup {

			class controls {

				class Logo: RscPictureKeepAspect {
					onLoad = "(_this select 0) ctrlsettext '\fnf_logos\data\fnflogo.paa';";
				};
			};
		};
	};
};

class RscDisplayNotFreeze: RscStandardDisplay {

	class controls {

		class LoadingStart: RscControlsGroup {

			class controls {

				class Logo: RscPictureKeepAspect {
					onLoad = "(_this select 0) ctrlsettext '\fnf_logos\data\fnflogo.paa';";
				};
			};
		};
	};
};

/*extern*/ class RscActivePicture;
/*extern*/ class RscButton;

class RscDisplayMain: RscStandardDisplay {

	class Controls {

		class Logo: RscActivePicture {
			tooltip = "Friday Night Fights";
			text = "\fnf_logos\data\fnflogowide.paa";
		};

		class LogoApex: Logo {
			tooltip = "Friday Night Fights";
			text = "\fnf_logos\data\fnflogowide.paa";
		};

		class FnfServerEarly: RscButton {
			x = safezoneX + safezoneW * 0.415;
			y = safezoneY + safezoneH * 0.2;
			w = safezoneW * 0.08;
			h = safezoneH * 0.05;
			colorBackground[] = {0.051,0.325,0.9,1};
			colorActive[] = {0.051,0.325,0.9,0.75};
			style = 0x2;
			text = "EARLY SERVER";
			onButtonClick="connectToServer ['51.89.64.149', 2302, ''];";
		};

		class FnfServerLate: RscButton {
			x = safezoneX + safezoneW * 0.505;
			y = safezoneY + safezoneH * 0.2;
			w = safezoneW * 0.08;
			h = safezoneH * 0.05;
			colorBackground[] = {1,0,0,1};
			colorActive[] = {1,0,0,0.75};
			style = 0x2;
			text = "LATE SERVER";
			onButtonClick="connectToServer ['3.210.166.73', 2302, ''];";
		};
	};
};
