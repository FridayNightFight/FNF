#define FNF_RSC_TEXT_1 	6001
#define FNF_RSC_TEXT_2 	6002
#define FNF_RSC_TEXT_3 	6003
#define FNF_RSC_TEXT_4 	6004

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

  // Start: ("FNF_spectatorUI" call BIS_fnc_rscLayer) cutRsc ["spectatorSideNumbers", "PLAIN"];
  // End:   ("FNF_spectatorUI" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
  class spectatorSideNumbers {
    idd = 696969;
    duration = 1e+011; 
	  movingenable = true;
    onLoad = "uiNamespace setVariable ['FNF_spectatorUI', _this #0]; FNF_spectator = true; call FNF_ClientSide_fnc_spectatorUIhandler;";
	  onUnload = "FNF_spectator = false; uiNamespace setVariable ['FNF_spectatorUI', nil];";

    class controls {
      class FNFalive1 {
        idc = FNF_RSC_TEXT_1;
        style = 2;
        sizeEx = 0.045;
        x = safeZoneX + safezoneW * 0.17;
        y = safeZoneY + safeZoneH * 0.95;
        w = 0.05 * safezoneW;
        h = 0.05 * safezoneH;
        colorBackground[] = {0,0,0,0};
        deletable = 0;
        fade = 0;
        access = 0;
        type = 0;
        colorText[] = {1,1,1,1};
        text = "";
        fixedWidth = 0;
        shadow = 1;
        colorShadow[] = {0,0,0,0.5};
        font = "RobotoCondensed";
        linespacing = 1;
        tooltipColorText[] = {1,1,1,1};
        tooltipColorBox[] = {1,1,1,1};
        tooltipColorShade[] = {0,0,0,0.65};
      };

      class FNFalive2: FNFalive1 {
        idc = FNF_RSC_TEXT_2;
        x = safeZoneX + safezoneW * 0.22;
      };

      class FNFalive3: FNFalive1 {
        idc = FNF_RSC_TEXT_3;
        x = safeZoneX + safezoneW * 0.27;
      };

      class FNFalive4: FNFalive1 {
        idc = FNF_RSC_TEXT_4;
        x = safeZoneX + safezoneW * 0.32;
      };
    };
  };
};
