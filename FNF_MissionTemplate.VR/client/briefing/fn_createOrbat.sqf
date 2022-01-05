/*
* Author: ferstaberinde.com, modified by Martin, IndigoFox
* Generates ORBAT of roles & assigned frequencies by squad and team. Creates or updates diary record & sets UI reference array pair.
*
* Arguments:
* /NONE/
*
* Return Value:
* true on success <BOOLEAN>
*
* Example:
* call phx_briefing_fnc_createOrbat
*
* Public: No
*/

// F3 - ORBAT Notes (Heavily Modified)
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// This script has been modified from it's original form.
// ====================================================================================
// colors: https://imgur.com/a/AfimbU2
#define COLOR1 "#944509"
#define COLOR2 "#FF8E38"
#define COLOR3 "#E0701B"
#define COLOR4 "#008394"
#define COLOR5 "#1BCAE0"

_generateORBAT = {
    params ["_groups"];

    private _functionText = "";
    private _functionTextStruct = "";

    // Loop through the group, print out group ID, leader name and medics if present
    {
        // if !((count units _x) isEqualTo 0) then {
            // Don't apply leading line breaks to first group.
            private _groupSize = _x getVariable ["phx_gps_groupSize",0];
            private _identity = _x getVariable ["phx_groupIdentifier", groupID _x];
            private _name = groupID _x;
            private _longName = _x getVariable ["phx_LongName",groupID _x];
            private _shortName = groupID _x;
            private _groupSide = [(side _x) call BIS_fnc_sideID] call BIS_fnc_sideName;
            private _groupString = "";
            private _groupStringStruct = "";
            private _changeColor = true;

            if (_forEachIndex != 0) then {
                switch (_groupSize) do {
                    case 0: {
                      _groupString = _groupString + format["    "];
                      _groupStringStruct = _groupStringStruct + format["    "];
                      _changeColor = true;
                    };
                    // case 1: {_groupString = _groupString + format["<br />- %1<br />    ",_longName]; _changeColor = true;};
                    // case 2: {_groupString = _groupString + format["<br /><br /><font size='18'>%1</font><br />    ",_longName]; _changeColor = true;};
                    // case 3: {_groupString = _groupString + format["<br /><br /><br /><font size='20'>%1</font><br />    ",_longName]; _changeColor = true;};
                };
            } else {
                switch (_groupSize) do {
                    case 0: {
                      _groupString = _groupString + format["",_longName];
                      _groupStringStruct = _groupStringStruct + format["",_longName];
                      _changeColor = true;
                    };
                    // case 1: {_groupString = _groupString + format["- %1<br />    ",_longName]; _changeColor = true;};
                    // case 2: {_groupString = _groupString + format["<font size='18'>%1</font><br />    ",_longName]; _changeColor = true;};
                    // case 3: {_groupString = _groupString + format["<font size='20'>%1</font><br />    ",_longName]; _changeColor = true;};
                };
            };

            // Highlight the player's group with a different color (based on the player's side)
            private _highlightColor = "#2AA5A5";

            private _color = "#FFFFFF";
            if (_changeColor) then {
                if (isNil "phx_orbat_lastUsedColor") then {
                    phx_orbat_lastUsedColor = ["#FFFFFF"];
                };
                phx_colorArray = (phx_colorArrayBase - phx_colorArrayUsed);
                if (count phx_colorArray isEqualTo 0) then {
                    phx_colorArrayUsed = [];
                    phx_colorArray = phx_colorArrayBase;
                };
                _color = phx_colorArray select 0;
                phx_colorArrayUsed pushBack _color;
                phx_orbat_lastUsedColor = [_color];
            } else {
                if (isNil "phx_orbat_lastUsedColor") then {
                    phx_orbat_lastUsedColor = ["#FFFFFF"];
                };
                if (count phx_colorArray isEqualTo 0) then {
                    phx_colorArrayUsed = [];
                };
                _color = phx_orbat_lastUsedColor select 0;
            };
            // TFR
            // Get group's radio frequency
            private _freq = _x getVariable ["phx_radioSettings",nil];
            if (isNil "_freq") then {
                _freq = "UNK";
            } else {
                private _chNum = _freq select 0;
                _chNum = _chNum - 1; //Minus one since array starts at 0
                private _chArray = _freq select 2;
                if (_chNum < 0) then {
                    if (_chNum isEqualTo -1) then {
                        _freq = 0;
                    };
                } else {
                    _freq = _chArray select _chNum; //Get group's main channel from freq list
                    if (isNil "_freq") then { //Check if frequency is out of range.
                        _freq = "UNK";
                        _str = format["[setGroupIDs] No radio freq found for group - '%1'",groupID _x];
                        systemChat _str;
                    };
                };
                if (!(_freq isEqualTo "UNK")) then {
                    _freq = _freq + phx_playerBaseChannel;
                };
            };

            // Add group to the ORBAT
            if (isNil "_freq") then {
                _groupString = _groupString + format ["%1 --", _name];
                _groupStringStruct = _groupStringStruct + format ["%1 --", _name];
            } else {
              _groupString = _groupString + format ["<font size='12' face='EtelkaMonospacePro'><font color='%5'>%1 [%4]</font> - %2 MHz</font>  ",
                _name,
                _freq,
                (count units _x),
                toUpper(_groupSide select [0,3]),
                "#FF8E38"
              ];
              _groupStringStruct = _groupStringStruct + format ["<t size='1' font='EtelkaMonospacePro'><t color='%5'>%1 [%4]</t> - %2 MHz</t>  ",
                _name,
                _freq,
                (count units _x),
                toUpper(_groupSide select [0,3]),
                "#FF8E38"
              ];
            };

            // Add group members
            {
                private _leftPad = "      ";
                // if !(_forEachIndex isEqualTo 0) then{
                //     _leftPad = ", ";
                // };
                private _colorUsed = _color;
                if (player isEqualTo _x) then {_colorUsed = _highlightColor};
                _roleName = [phx_loadout_roles, _x getVariable ["phxLoadout","RI"], "RI"] call BIS_fnc_getFromPairs;
                if (typeName _roleName isEqualTo "ARRAY") then {_roleName = _roleName select 0};
                private _spacesCount = 21 - count (_roleName);
                private _thisSpaces = "";
                for "_i" from 1 to _spacesCount do {
                  _thisSpaces = _thisSpaces + ".";
                };
                _groupString = _groupString + format[
                  "<br/><font size='9' face='EtelkaMonospacePro'>%3[%2]%5<font color='%4'>%1</font></font>",
                  name _x,
                  _roleName,
                  _leftPad,
                  _colorUsed,
                  _thisSpaces
                ];
                _groupStringStruct = _groupStringStruct + format[
                  "<br/><t size='0.8' font='EtelkaMonospacePro'>%3[%2]%5<t color='%4'>%1</t></t>",
                  name _x,
                  _roleName,
                  _leftPad,
                  _colorUsed,
                  _thisSpaces
                ];
            } forEach (allUnits select {_x getVariable ["phx_startGroup","UNK"] == _identity});

            _groupString = _groupString + "<br/><br/>";
            _groupStringStruct = _groupStringStruct + "<br/><br/>";
            _functionText = _functionText + _groupString;
            _functionTextStruct = _functionTextStruct + _groupStringStruct;
        // };
    } forEach _groups;

    // Return functionText
    [_functionText, _functionTextStruct]
};

//----------------------------------------------------------------------------------------------------
private _side = player call BIS_fnc_friendlySides select {_x != sideFriendly};
// private _orbatText = "<br />NOTE: This ORBAT is only valid at mission start.<br /><br />";
private _orbatText = "";
private _orbatTextStruct = "";

phx_colorArrayBase = [
    "#8080FF", // light blue
    "#80FF80", // light green
    "#FF8080", // light red
    "#FFFF80", // light yellow
    "#FF80FF", // light pink
    "#00FFE5", //turquoise
    "#FFC080", // light orange
    "#00FF87", //aquamarine
    "#B960FF", //light purple
    "#FF8181" //beige red
];
phx_colorArray = [];
phx_colorArrayUsed = [];

private _groups = [];
private _templateGroups = [];


// if someone is in spectator, ORBAT will display attached units with gamelogic
// if players change groups, the old groups will not be shown. the players who moved will therefore not be listed directly in the new group, despite the manpower count of the destination group increasing.

{
  // Add to ORBAT if side matches, group isn't already listed, and group has players
  private _identity = _x getVariable ["phx_groupIdentifier",groupID _x];
  private _groupId = groupID _x;
  private _groupSide = side _x;
  if (
    (side _x in _side) &&
    {!(_x in _groups)} &&
    (
      ({_x in (switchableUnits + playableUnits) && !(_x in ([] call ace_spectator_fnc_players))} count units _x > 0) ||
      ((units _groupSide) findIf {_x getVariable ["phx_startGroup","UNK"] == _identity} > -1)
    )
  ) then {
    if (_identity in phx_templateGroupsList) then {
      _templateGroups pushBack _x;
    } else {
      _groups pushBack _x;
    };
  };
} forEach allGroups;


// Generate ORBAT text for template groups
private _tempRef = [_templateGroups] call _generateORBAT;
private _templateText = _tempRef # 0;
private _templateTextStruct = _tempRef # 1;

// Use next color in the chain when switching between template and non-template groups
if (isNil "phx_orbat_lastUsedColor") then {
  phx_orbat_lastUsedColor = ["#FFFFFF"];
};
phx_colorArray = (phx_colorArrayBase - phx_colorArrayUsed);
if (count phx_colorArray isEqualTo 0) then {
  phx_colorArrayUsed = [];
  phx_colorArray = phx_colorArrayBase;
};
private _color = phx_colorArray select 0;
phx_colorArrayUsed pushBack _color;
phx_orbat_lastUsedColor = [_color];

// Generate ORBAT text for non-template groups
_orbatText = _orbatText + _templateText;
_orbatTextStruct = _orbatTextStruct + _templateTextStruct;

private _groupText = "";
private _groupTextStruct = "";
if !(_groups isEqualTo []) then {
  private _groupTextRef = [_groups] call _generateORBAT;
  _groupText = _groupTextRef # 0;
  _groupTextStruct = _groupTextRef # 1;
};
if !(_groupText isEqualTo "") then {
  _orbatText = _orbatText + "<br/>Attached Units:<br/>" + _groupText;
  _orbatTextStruct = _orbatTextStruct + "<br/>Attached Units:<br/>" + _groupTextStruct;
};

// Insert final result into subsection ORBAT of section Notes

// Tucked under Briefing tab
// if (!isNil "playerORBATRecord") then {player removeDiaryRecord ["Diary", playerORBATRecord]};
// playerORBATRecord = player createDiaryRecord ["Diary", ["Allied ORBAT", _orbatText]];

// Standalone ORBAT section
if !(typeOf player == "ace_spectator_virtual") then {
  if (!isNil "playerORBATRecord") then {player removeDiaryRecord ["ORBAT_Diary", playerORBATRecord]};
  playerORBATRecord = player createDiaryRecord ["ORBAT_Diary", ["Allied ORBAT", _orbatText]];
};

[phx_ui_structTextRef, "ORBAT", _orbatTextStruct] call BIS_fnc_setToPairs;

phx_orbat_lastUsedColor = nil;
phx_writtenORBAT = true;
true
