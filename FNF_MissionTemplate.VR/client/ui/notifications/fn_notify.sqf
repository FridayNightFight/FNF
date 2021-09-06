/*
 File: fn_notification_system.sqf
 Author: Aquaman
 Description: Notification System.
 Credit: Since i didn't know how to create my own notification system i used TanKode's and Lucian's Notification System as guidance.

 TanKode Github: https://github.com/TanKode (Also Used the Same Colours as he did as they looked nice)
 Lucian Notification System: https://native-network.net/forum/thread/3924-tutorial-de100-benachrichtigungssystem/
 My Github: https://github.com/DanyaalA

Params:
 0: Text <STRING> text to display in the notification. Default Value "".
 1: NotifType <STRING> Type of notification used to set the colour of the Title.  Default Value: success
 2: Speed <INTEGER> time in seconds to show a notification. Default Value: 5

 Example Uses:
 ["Welcome to CQC"] call Aquaman_fnc_notification_system;
 ["Tactical View is Disabled", "warning"] call Aquaman_fnc_notification_system;
 ["Cant Spawn Vehicle", "error", 50] call Aquaman_fnc_notification_system;
*/

params [
    ["_text", "",[""] ],
    ["_notiftype", "success", ["",[],{}]],
    ["_speed", 5, [5]]
];

if (isDedicated || !hasInterface) exitWith {};
if(isNil "current_notifications") then {
    current_notifications = [];
};

disableSerialization;
// _display = findDisplay 46;
private "_display";
if (ace_spectator_isSet) then {
	_display = findDisplay 60000;
} else {
	_display = findDisplay 46;
};
_TitleColour = "";
_alpha = 1;

//You can add more case statements for different things. Info is the default value
//This is used to get the colour of the notification
switch (_notiftype) do
{
    case "info": {
        _TitleColour = [0.129,0.588,0.953,_alpha]; //Blue
    };

    case "error": {
        _TitleColour = [0.957,0.263,0.212,_alpha]; //Red
    };

    case "warning": {
        _TitleColour = [1,0.757,0.027,_alpha]; //Amber (Looks Really Nice i used it for my stats notification)
    };

    case "success": {
        _TitleColour = [0.298,0.686,0.314,_alpha]; //Green (Default)
    };

    default {
        _TitleColour = [0.298,0.686,0.314,_alpha]; //Same as success. sets colour back to success if something random is entered.
    };
};


if (_text isEqualType "") then {
    _text = parseText _text;
};

playSound "HintExpand";

private _Title = _display ctrlCreate ["RscText", -1];
//Creating Title Control and Setting the Position, Width and Height.

//[0.8035 * safezoneW + safezoneX, 0.2 * safezoneH + safezoneY, 0.0015 * safezoneW, 0.015* safezoneH];

_Title ctrlSetPosition [0.8035 * safezoneW + safezoneX, 0.2 * safezoneH + safezoneY, 0.002 * safezoneW, 0.015* safezoneH];
_Title ctrlSetBackgroundColor _TitleColour;
_Title ctrlSetFade 1;
_Title ctrlCommit 0; //ctrlCommit Updates the Changes i made above
_Title ctrlSetFade 0;
_Title ctrlCommit 0.4;

private _Message = _display ctrlCreate ["RscStructuredText", -1];
//Creating Message Control And Setting Text, Height and width.
_Message ctrlSetStructuredText _text;
_Message ctrlSetPosition [0.805 * safezoneW + safezoneX, 0.2 * safezoneH + safezoneY, 0.185 * safezoneW,  0.015* safezoneH];
_Message ctrlCommit 0;
_Message ctrlSetPosition [0.805 * safezoneW + safezoneX, 0.2 * safezoneH + safezoneY, 0.185 * safezoneW, ((ctrlTextHeight _Message)+ (0.005 * safezoneH))];
_Message ctrlCommit 0;

//Setting Background Colour and Fade
_Message ctrlSetBackgroundColor [0.129,0.129,0.129, 0.9];
_Message ctrlSetFade 1;
_Message ctrlCommit 0;
_Message ctrlSetFade 0;
_Message ctrlCommit 0.4;

//Updating Title Height to Match The Text Height
_Title ctrlSetPosition [0.8035 * safezoneW + safezoneX, 0.2 * safezoneH + safezoneY, 0.002 * safezoneW, ((ctrlTextHeight _Message)+ (0.005 * safezoneH))];
_Title ctrlCommit 0;


//Visualising/Creating The Notification so player can see it on screen.
[_Message, _Title, _speed] spawn {
    disableSerialization;
    uiSleep (_this select 2); //How long the notification lasts for.
    private _Message = _this select 0;
    private _Title = _this select 1;
    _Message ctrlSetFade 1;
    _Message ctrlCommit 0.3;
    _Title ctrlSetFade 1;
    _Title ctrlCommit 0.3;
    uiSleep 0.35;
    ctrlDelete _Message;
    ctrlDelete _Title;
};

//Finding Position of Title and Text
private _posMessage = (ctrlPosition (_Message)) select 1;
private _posTitle = (ctrlPosition (_Title)) select 1;
private _messageHigh = (ctrlPosition (_Message)) select 3;

//Check if more than one notification is active.
//Ill be honest i didn't know how to do this at all so thanks to TaKonde and Lucian.
if (count current_notifications >= 1) then 
{
    private _activeNotifications = 0;
    {
        private _TitleCtrl = _x select 0;
        private _MessageCtrl = _x select 1;
        if (!isNull _TitleCtrl && !isNull _MessageCtrl) then
        {
            //Updating Position of Current Notification to be lower
            _TitleCtrl ctrlSetPosition [0.8035 * safezoneW + safezoneX, (_posTitle + _messageHigh + 1.5 * (0.011 * safezoneH))];
            _MessageCtrl ctrlSetPosition [0.805 * safezoneW + safezoneX, (_posMessage + _messageHigh + 1.5 * (0.011 * safezoneH))];
            _TitleCtrl ctrlCommit 0.3;
            _MessageCtrl ctrlCommit 0.3;

            //Updating Position Variables
            _posMessage = (_posMessage + _messageHigh + 1.5 * (0.011 * safezoneH));
            _posTitle = (_posTitle + _messageHigh + 1.5 * (0.011 * safezoneH));
            _messageHigh = (ctrlPosition (_MessageCtrl)) select 3;
            if (_activeNotifications > 3) then
            {
                _TitleCtrl ctrlSetFade 1;
                _MessageCtrl ctrlSetFade 1;
                _TitleCtrl ctrlCommit 0.25;
                _MessageCtrl ctrlCommit 0.25;
            };
        };
            _activeNotifications = _activeNotifications + 1;
    } forEach current_notifications;
};

current_notifications = ([[_Title, _Message]] + current_notifications) select {!isNull (_x select 0) && !isNull (_x select 1)};