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

        class FnfServerEarly : RscActivePicture {
            idc = 12000;
            text="\fnf_logos\data\early.paa";
            tooltip="Connect to early segment server";
			color[]={0.89999998,0.89999998,0.89999998,1};
			colorActive[]={1,1,1,1};
            shadow=1;
			onSetFocus="(_this select 0) ctrlsettextcolor [1,1,1,1];";
			onKillFocus="(_this select 0) ctrlsettextcolor [0.9,0.9,0.9,1];";
			onButtonClick="connectToServer ['51.89.64.149', 2302, ''];";
			url="";
			x="0.418625 * safezoneW + safezoneX";
			y="0.1556 * safezoneH + safezoneY";
			w="0.07875 * safezoneW";
			h="0.042 * safezoneH";
        };

        class FnfServerLate : RscActivePicture {
            idc = 12001;
            text = "\fnf_logos\data\late.paa";
            tooltip="Connect to late segment server";
			color[] = {0.89999998,0.89999998,0.89999998,1};
			colorActive[] = {1,1,1,1};
            shadow = 1;
			onSetFocus = "(_this select 0) ctrlsettextcolor [1,1,1,1];";
			onKillFocus = "(_this select 0) ctrlsettextcolor [0.9,0.9,0.9,1];";
			onButtonClick = "connectToServer ['51.81.56.169', 2302, ''];";
			url = "";
			x = "0.501969 * safezoneW + safezoneX";
			y = "0.1556 * safezoneH + safezoneY";
			w = "0.07875 * safezoneW";
			h = "0.042 * safezoneH";
        };
	};
};
