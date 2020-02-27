#include "CustomControlClasses.h"
class FNFAssetMenu
{
	idd = 6000;

	class ControlsBackground
	{

	};
	class Controls
	{
		class HeaderTitle
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.29394532;
			y = safeZoneY + safeZoneH * 0.22569445;
			w = safeZoneW * 0.41210938;
			h = safeZoneH * 0.06076389;
			style = 2;
			text = "FNF Asset Menu";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,0,0,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2.5);

		};
		class ExitButton
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.62597657;
			y = safeZoneY + safeZoneH * 0.72048612;
			w = safeZoneW * 0.08007813;
			h = safeZoneH * 0.05381945;
			style = 2;
			text = "Exit";
			borderSize = 0;
			colorBackground[] = {0,0,0,1};
			colorBackgroundActive[] = {0.302,0.302,0.302,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.75);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			onButtonClick = "_display = findDisplay 6000; _display closeDisplay 1;";
			shadow = 0;

		};
		class SpawnableAssetsTitle
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.29394532;
			y = safeZoneY + safeZoneH * 0.30555556;
			w = safeZoneW * 0.2578125;
			h = safeZoneH * 0.05381945;
			style = 2;
			text = "Spawnable Assets";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.75);

		};
		class SpawnableAssetsCombo
		{
			type = 4;
			idc = 6001;
			x = safeZoneX + safeZoneW * 0.29394532;
			y = safeZoneY + safeZoneH * 0.359375;
			w = safeZoneW * 0.2578125;
			h = safeZoneH * 0.05381945;
			style = 16;
			arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_ca.paa";
			arrowFull = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_active_ca.paa";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelect[] = {1,1,1,1};
			colorSelectBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			maxHistoryDelay = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5);
			soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1.0};
			soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1.0};
			soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1.0};
			wholeHeight = 0.3;
			tooltip = "";
			class ComboScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";

			};

		};
		class CurrentAssetsTitle
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.29394532;
			y = safeZoneY + safeZoneH * 0.45138889;
			w = safeZoneW * 0.2578125;
			h = safeZoneH * 0.05381945;
			style = 2;
			text = "Current Assets";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.75);

		};
		class CurrentAssetsCombo
		{
			type = 4;
			idc = 6002;
			x = safeZoneX + safeZoneW * 0.29394532;
			y = safeZoneY + safeZoneH * 0.50520834;
			w = safeZoneW * 0.2578125;
			h = safeZoneH * 0.05381945;
			style = 16;
			arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_ca.paa";
			arrowFull = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_active_ca.paa";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelect[] = {1,1,1,1};
			colorSelectBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			maxHistoryDelay = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5);
			soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1.0};
			soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1.0};
			soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1.0};
			wholeHeight = 0.3;
			tooltip = "";
			class ComboScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";

			};

		};
		class SpawnButton
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.61132813;
			y = safeZoneY + safeZoneH * 0.32291667;
			w = safeZoneW * 0.0703125;
			h = safeZoneH * 0.0625;
			style = 0+2;
			text = "Spawn";
			borderSize = 0;
			colorBackground[] = {0,0,0,1};
			colorBackgroundActive[] = {0.0289,0.8811,0,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.75);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			onButtonClick = "[assetSelected, position player] call phx_fnc_createAsset;";

		};
		class RemoveButton
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.61132813;
			y = safeZoneY + safeZoneH * 0.46875;
			w = safeZoneW * 0.0703125;
			h = safeZoneH * 0.0625;
			style = 0+2;
			text = "Remove";
			borderSize = 0;
			colorBackground[] = {0,0,0,1};
			colorBackgroundActive[] = {0.6,0,0,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.75);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			onButtonClick = "[removeAssetSelected, position player] call phx_fnc_removeAsset;";

		};
		class PointsText
		{
			type = 0;
			idc = 6100;
			x = safeZoneX + safeZoneW * 0.29394532;
			y = safeZoneY + safeZoneH * 0.59027778;
			w = safeZoneW * 0.16796875;
			h = safeZoneH * 0.0625;
			style = 0;
			text = "Points Remaining:";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.75);

		};

	};

};
