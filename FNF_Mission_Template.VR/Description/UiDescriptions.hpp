class RscTitles {
	class timeleftStructText {
		idd = 9913;
		movingEnable = 0;
		enableSimulation = 1;
		enableDisplay = 1;
		duration = 9999;
		fadein = 0;
		fadeout = 0;
		name = "timeleftStructText";
		onLoad = "uiNamespace setVariable ['timeleftStructText', _this select 0];";
		onUnLoad = "uiNamespace setVariable ['timeleftStructText', nil]";
		class controls {
			class structuredText3 {
				access = 0;
				type = 13;
				idc = 1003;
				style = 0x00;
				lineSpacing = 1;
				x = 0 * safezoneW + safezoneX;
				y = 0.980 * safezoneH + safezoneY;
				h = 0.020 * safezoneH;
				w = 0.17 * safezoneW; //w == h
				size = 0.020;
				colorBackground[] = {0,0,0,0.85};
				colorText[] = {1,1,1,1};
				text = "";
				font = "TahomaB";
				class Attributes {
						font = "TahomaB";
						color = "#FFFFFF";
						align = "CENTER";
						valign = "bottom";
						shadow = true;
						shadowColor = "#000000";
						underline = false;
						size = "1.7";
				};
			};
		};
	};
};

import RscText;

class RscWebBrowser: RscText
{
	type = 106;
	idc = -1;
	deletable = 0;
	style = 0;
	x = 0;
	y = 0;
	w = 0.3;
	h = 0.3;
	allowExternalURL = 0;
	url = "";
};
