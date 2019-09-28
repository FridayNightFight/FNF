#include "CustomControlClasses.h"
class GearSelector
{
	idd = 2000;

	class ControlsBackground
	{

	};
	class Controls
	{
		class HeaderTitle
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.29375;
			y = safeZoneY + safeZoneH * 0.22555556;
			w = safeZoneW * 0.411875;
			h = safeZoneH * 0.06;
			style = 2;
			text = "FNF Gear Selector";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,0,0,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2);
		};
		class FlashOrIncenCombo
		{
			type = 4;
			idc = 2002;
			x = safeZoneX + safeZoneW * 0.5455;
			y = safeZoneY + safeZoneH * 0.46527778;
			w = safeZoneW * 0.16;
			h = safeZoneH * 0.05333334;
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
			tooltip = "Choose between flash or incendiary grenades";
			class ComboScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";

			};

		};
		class OpticsTitle
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.29375;
			y = safeZoneY + safeZoneH * 0.30555556;
			w = safeZoneW * 0.16;
			h = safeZoneH * 0.05333334;
			style = 2;
			text = "Optic Selection";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.75);

		};
		class GrenadesTitle
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.5455;
			y = safeZoneY + safeZoneH * 0.30555556;
			w = safeZoneW * 0.16;
			h = safeZoneH * 0.05333334;
			style = 2;
			text = "Grenades";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.75);

		};
		class RedSmokeButton
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.5455;
			y = safeZoneY + safeZoneH * 0.41222224‬;
			w = safeZoneW * 0.08;
			h = safeZoneH * 0.05333334;
			style = 2;
			text = "+1 Red Smoke";
			borderSize = 0;
			colorBackground[] = {1,0,0,1};
			colorBackgroundActive[] = {0.502,0.502,0.502,1};
			colorBackgroundDisabled[] = {0.102,0.2,0.6,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,0};
			colorText[] = {0,0,0,1};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			onButtonClick = "if (player canAdd ""SmokeShellRed"") then {  player addItem ""SmokeShellRed"";  hintSilent ""Red smoke grenade added"";} else {  hintSilent ""Not enough space"";};";

		};
		class BlueSmokeButton
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.62557813;
			y = safeZoneY + safeZoneH * 0.41222223;
			w = safeZoneW * 0.08;
			h = safeZoneH * 0.05333334;
			style = 2;
			text = "+1 Blue Smoke";
			borderSize = 0;
			colorBackground[] = {0,0.459,1,1};
			colorBackgroundActive[] = {0.502,0.502,0.502,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,0};
			colorText[] = {0,0,0,1};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			onButtonClick = "if (player canAdd ""SmokeShellBlue"") then {  player addItem ""SmokeShellBlue"";  hintSilent ""Blue smoke grenade added"";} else {  hintSilent ""Not enough space"";};";

		};
		class WhiteSmokeButton
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.5455;
			y = safeZoneY + safeZoneH * 0.3588889‬;
			w = safeZoneW * 0.08007813;
			h = safeZoneH * 0.05333334;
			style = 2;
			text = "+1 White Smoke";
			borderSize = 0;
			colorBackground[] = {1,1,1,1};
			colorBackgroundActive[] = {0.502,0.502,0.502,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,0};
			colorText[] = {0,0,0,1};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			onButtonClick = "if (player canAdd ""SmokeShell"") then {  player addItem ""SmokeShell"";  hintSilent ""White smoke grenade added"";} else {  hintSilent ""Not enough space"";};";

		};
		class GreenSmokeButton
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.62557813;
			y = safeZoneY + safeZoneH * 0.3588889‬;
			w = safeZoneW * 0.08007813;
			h = safeZoneH * 0.05333334;
			style = 2;
			text = "+1 Green Smoke";
			borderSize = 0;
			colorBackground[] = {0,0.6189,0,1};
			colorBackgroundActive[] = {0.502,0.502,0.502,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,0};
			colorText[] = {0,0,0,1};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			onButtonClick = "if (player canAdd ""SmokeShellGreen"") then {  player addItem ""SmokeShellGreen"";  hintSilent ""Green smoke grenade added"";} else {  hintSilent ""Not enough space"";};";

		};
		class OpticsCombo
		{
			type = 4;
			idc = 2001;
			x = safeZoneX + safeZoneW * 0.29375;
			y = safeZoneY + safeZoneH * 0.35888889;
			w = safeZoneW * 0.16;
			h = safeZoneH * 0.05333334;
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
			tooltip = "Choose an optic";
			class ComboScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";

			};

		};
		class ExitButton
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.6255;
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
			onButtonClick = "_display = findDisplay 2000; _display closeDisplay 1;";
			shadow = 0;

		};
		class BugReportsBrowserLink
		{
			type = 9;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.29375;
			y = safeZoneY + safeZoneH * 0.72048612;
			w = safeZoneW * 0.10449219;
			h = safeZoneH * 0.05381945;
			style = 2;
			default = 0;
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			colorBold[] = {1,1,1,1};
			colorLink[] = {1,1,1,1};
			colorLinkActive[] = {1,0.5,0,1};
			colorPicture[] = {1,1,1,1};
			colorPictureBorder[] = {0,0,0,0};
			colorPictureLink[] = {1,1,1,1};
			colorPictureSelected[] = {1,1,1,1};

			prevPage = "\A3\ui_f\data\gui\rsccommon\rschtml\arrow_left_ca.paa";
			nextPage = "\A3\ui_f\data\gui\rsccommon\rschtml\arrow_right_ca.paa";

			filename = "f\ui\RscFeedback.html";

			class P
			{
				font = "PuristaMedium";
				fontBold = "PuristaBold";
				sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.75);
				align = "center";
			};
			class H1:P{};
			class H2:P{};
			class H3:P{};
			class H4:P{};
			class H5:P{};
			class H6:P{};
		};

		//CE Only
		class ExplosivesTitle
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.29375;
			y = safeZoneY + safeZoneH * 0.46555556;
			w = safeZoneW * 0.16;
			h = safeZoneH * 0.05333334;
			style = 2;
			text = "Explosives Selection";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.75);

		};
		class ExplosivesCombo
		{
			type = 4;
			idc = 2003;
			x = safeZoneX + safeZoneW * 0.29375;
			y = safeZoneY + safeZoneH * 0.51888889;
			w = safeZoneW * 0.16;
			h = safeZoneH * 0.05333334;
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
			tooltip = "Choose explosives (CE Only)";
			class ComboScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
			};
		};
	};
};
