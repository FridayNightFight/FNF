/*
 File: fn_notification_system.sqf
 Author: TanKode
 Author-URI: https://github.com/TanKode
 License: MIT
 Version: v1.1-dev
 Parameter:
 0: Text <STRING> text to display in the notification
 1: Type <STRING> type of this notification or the colorname or the color as array/object
 2: Speed <INTEGER> time in seconds to show this notification
*/
params [
    ["_text","",[""]],
    ["_type","default",["",[],{}]],
    ["_speed",10,[10]],
    ["_leadingSpace",8,[10]]
];
if (isDedicated || !hasInterface) exitWith {};
if(isNil "open_notifications") then {
    open_notifications = [];
};
disableSerialization;
_display = findDisplay 46;

_alpha = 1;
_colorName = "";
_color = [];
if(typeName _type == "ARRAY" || typeName _type == "OBJECT") then {
    _color = _type;
} else {
    switch (_type) do {
        case "failure": {
            _colorName = "red";
        };
        case "error": {
            _colorName = "amber";
        };
        case "success": {
            _colorName = "green";
        };
        case "info": {
            _colorName = "teal";
        };
        default {
            _colorName = _type;
        };
    };
    // https://material.io/guidelines/style/color.html
    switch (_colorName) do {
        case "red": {
            _color = [0.957,0.263,0.212,_alpha];
        };
        case "pink": {
            _color = [0.914,0.118,0.388,_alpha];
        };
        case "purple": {
            _color = [0.612,0.153,0.69,_alpha];
        };
        case "deep-purple": {
            _color = [0.404,0.227,0.718,_alpha];
        };
        case "indigo": {
            _color = [0.247,0.318,0.71,_alpha];
        };
        case "blue": {
            _color = [0.129,0.588,0.953,_alpha];
        };
        case "light-blue": {
            _color = [0.012,0.663,0.957,_alpha];
        };
        case "cyan": {
            _color = [0,0.737,0.831,_alpha];
        };
        case "teal": {
            _color = [0,0.588,0.533,_alpha];
        };
        case "green": {
            _color = [0.298,0.686,0.314,_alpha];
        };
        case "light-green": {
            _color = [0.545,0.765,0.29,_alpha];
        };
        case "lime": {
            _color = [0.804,0.863,0.224,_alpha];
        };
        case "yellow": {
            _color = [1,0.922,0.231,_alpha];
        };
        case "amber": {
            _color = [1,0.757,0.027,_alpha];
        };
        case "orange": {
            _color = [1,0.596,0,_alpha];
        };
        case "deep-orange": {
            _color = [1,0.341,0.133,_alpha];
        };
        case "brown": {
            _color = [0.475,0.333,0.282,_alpha];
        };
        case "grey": {
            _color = [0.62,0.62,0.62,_alpha];
        };
        case "blue-grey": {
            _color = [0.376,0.49,0.545,_alpha];
        };
        default {
            _color = [(profileNamespace getvariable ['GUI_BCG_RGB_R',0.3843]),(profileNamespace getvariable ['GUI_BCG_RGB_G',0.7019]),(profileNamespace getvariable ['GUI_BCG_RGB_B',0.8862]),_alpha];
        };
    };
};

if (_text isEqualType "") then {
    _text = parseText _text;
};
playSound "HintExpand";

_margin = 0.01;
_width = 400 * pixelW;
_borderWidth = 10 * pixelW;
_textWidth = _width - _borderWidth;
_height = 0.01;
_posX = safeZoneW + safeZoneX - _margin - _width;
_posY = 0;

private _BorderCtrl = _display ctrlCreate ["RscText", -1];
_BorderCtrl ctrlSetPosition [_posX, _posY, _borderWidth, _height];
_BorderCtrl ctrlSetBackgroundColor _color;
_BorderCtrl ctrlSetFade 1;
_BorderCtrl ctrlCommit 0;
_BorderCtrl ctrlSetFade 0;
_BorderCtrl ctrlCommit 0.4;

private _TextCtrl = _display ctrlCreate ["RscStructuredText", -1];
_TextCtrl ctrlSetStructuredText _text;
_TextCtrl ctrlSetPosition [(_posX + _borderWidth), _posY, _textWidth, _height];
_TextCtrl ctrlCommit 0;
_adjustedHeight = (ctrlTextHeight _TextCtrl) + (_leadingSpace * pixelH);
_TextCtrl ctrlSetPosition [(_posX + _borderWidth), _posY, _textWidth, _adjustedHeight];
_TextCtrl ctrlCommit 0;
_BorderCtrl ctrlSetPosition [_posX, _posY, _borderWidth, _adjustedHeight];
_BorderCtrl ctrlCommit 0;
_TextCtrl ctrlSetBackgroundColor [0.129,0.129,0.129,_alpha];
_TextCtrl ctrlSetFade 1;
_TextCtrl ctrlCommit 0;
_TextCtrl ctrlSetFade 0;
_TextCtrl ctrlCommit 0.4;

[_TextCtrl,_BorderCtrl,_speed] spawn {
    disableSerialization;
    uiSleep (_this select 2);
    private _TextCtrl = _this select 0;
    private _BorderCtrl = _this select 1;
    _TextCtrl ctrlSetFade 1;
    _TextCtrl ctrlCommit 0.3;
    _BorderCtrl ctrlSetFade 1;
    _BorderCtrl ctrlCommit 0.3;
    uiSleep 0.3;
    ctrlDelete _BorderCtrl;
    ctrlDelete _TextCtrl;
};

_offsetY = 0;
if (count open_notifications > 0) then {
    private _activeNotifications = 0;
    {
        private _ctrlBorder = _x select 0;
        private _ctrlText = _x select 1;
        if (!isNull _ctrlBorder && !isNull _ctrlText) then {
            _ctrlBorder ctrlSetPosition [_posX, (_posY + _offsetY)];
            _ctrlText ctrlSetPosition [(_posX + _borderWidth), (_posY + _offsetY)];
            _ctrlBorder ctrlCommit 0.25;
            _ctrlText ctrlCommit 0.25;
            _offsetY = _offsetY + _margin + ((ctrlPosition _ctrlText) select 3);
            if (_activeNotifications > 3) then {
                _ctrlText ctrlSetFade 1;
                _ctrlText ctrlCommit 0.2;
                _ctrlBorder ctrlSetFade 1;
                _ctrlBorder ctrlCommit 0.2;
            };
        };
        _activeNotifications = _activeNotifications + 1;
    } forEach open_notifications;
};
open_notifications = ([[_BorderCtrl,_TextCtrl]] + open_notifications) select {!isNull (_x select 0) && !isNull (_x select 1)};
