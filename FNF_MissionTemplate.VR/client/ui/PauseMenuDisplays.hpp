class PauseMenuSendAdminMsg : RscShortcutButton
{
	deletable = 0;
	fade = 0;
	access = 0;

	textureNoShortcut = "description\images\fnfsmall.paa";
	text = "Contact Staff";
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	colorBackground[] = {0,0.5,0,1};
	colorBackgroundDisabled[] = {0,0,0,0.5};
	// colorBackgroundActive[] = {1,1,0.4,1};
	soundEnter[] =
	{
		"\A3\ui_f\data\sound\RscButton\soundEnter",
		0.09,
		1
	};
	soundPush[] =
	{
		"\A3\ui_f\data\sound\RscButton\soundPush",
		0.09,
		1
	};
	soundClick[] =
	{
		"\A3\ui_f\data\sound\RscButton\soundClick",
		0.09,
		1
	};
	soundEscape[] =
	{
		"\A3\ui_f\data\sound\RscButton\soundEscape",
		0.09,
		1
	};
	idc = -1;
	style = ST_CENTER;
	x = 0.025 * safeZoneW + safeZoneX;
	y = 0.26 * safeZoneH + safeZoneY;
	w = 0.075 * safeZoneW;
	h = 0.025 * safeZoneH;
	class TextPos
	{
		left = 0.0325;
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		right = 0.005;
		bottom = 0.0;
	};
	class ShortcutPos
	{
		left = 0.005;
		top = 0.007;
		w = 0.0225;
		h = 0.03;
	};

	class Attributes
	{
		font = "PuristaMedium";
		color = "#FFFFFF";
		align = "center";
		shadow = "true";
	};
	size = GUI_TEXT_SIZE_MEDIUM;
	sizeEx = GUI_TEXT_SIZE_MEDIUM;
};
class PauseMenuKickPlayer : RscShortcutButton
{
	deletable = 0;
	fade = 0;
	access = 0;

	textureNoShortcut = "description\images\fnfsmall.paa";
	text = "Admin Menu";
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	colorBackground[] = {0,0.5,0,1};
	colorBackgroundDisabled[] = {0,0,0,0.5};
	// colorBackgroundActive[] = {1,1,0.4,1};
	soundEnter[] =
	{
		"\A3\ui_f\data\sound\RscButton\soundEnter",
		0.09,
		1
	};
	soundPush[] =
	{
		"\A3\ui_f\data\sound\RscButton\soundPush",
		0.09,
		1
	};
	soundClick[] =
	{
		"\A3\ui_f\data\sound\RscButton\soundClick",
		0.09,
		1
	};
	soundEscape[] =
	{
		"\A3\ui_f\data\sound\RscButton\soundEscape",
		0.09,
		1
	};
	idc = -1;
	style = ST_CENTER;
	x = 0.025 * safeZoneW + safeZoneX;
	y = 0.20 * safeZoneH + safeZoneY;
	w = 0.075 * safeZoneW;
	h = 0.025 * safeZoneH;
	class TextPos
	{
		left = 0.0325;
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		right = 0.005;
		bottom = 0.0;
	};
	class ShortcutPos
	{
		left = 0.005;
		top = 0.007;
		w = 0.0225;
		h = 0.03;
	};

	class Attributes
	{
		font = "PuristaMedium";
		color = "#FFFFFF";
		align = "center";
		shadow = "true";
	};
	size = GUI_TEXT_SIZE_MEDIUM;
	sizeEx = GUI_TEXT_SIZE_MEDIUM;
};
