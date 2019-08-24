// F3 - ORBAT Notes (Heavily Modified)
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// This script has been modified from it's original form.
// ====================================================================================

_generateORBAT = {
    params ["_groups"];

    private _functionText = "";
    f_param_radios = ["phx_param_radios",0] call BIS_fnc_getParamValue;

    // Loop through the group, print out group ID, leader name and medics if present
    {
        if !((count units _x) isEqualTo 0) then {
            // Don't apply leading line breaks to first group.
            private _groupSize = _x getVariable ["phx_gps_groupSize",0];
            private _name = groupID _x;
            private _longName = _x getVariable ["phx_LongName",groupID _x];
            private _groupString = "";
            private _changeColor = false;

            if (_forEachIndex != 0) then {
                switch (_groupSize) do {
                    case 0: {_groupString = _groupString + format["    "]; _changeColor = false;};
                    case 1: {_groupString = _groupString + format["<br />- %1<br />    ",_longName]; _changeColor = true;};
                    case 2: {_groupString = _groupString + format["<br /><br /><font size='18'>%1</font><br />    ",_longName]; _changeColor = true;};
                    case 3: {_groupString = _groupString + format["<br /><br /><br /><font size='20'>%1</font><br />    ",_longName]; _changeColor = true;};
                };
            } else {
                switch (_groupSize) do {
                    case 0: {_groupString = _groupString + format["    ",_longName]; _changeColor = false;};
                    case 1: {_groupString = _groupString + format["- %1<br />    ",_longName]; _changeColor = true;};
                    case 2: {_groupString = _groupString + format["<font size='18'>%1</font><br />    ",_longName]; _changeColor = true;};
                    case 3: {_groupString = _groupString + format["<font size='20'>%1</font><br />    ",_longName]; _changeColor = true;};
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

            switch (f_param_radios) do {
              case 1: { // TFR
                // Get group's radio frequency
                private _freq = _x getVariable ["phx_radioSettings",nil];
                if (isNil "_freq") then {
                    _freq = "UNK";
                } else {
                    private _chNum = _freq select 0;
                    _chNum = _chNum - 2; //Minus one since array starts at 0
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
                } else {
                    _groupString = _groupString + format ["<font size='16'>%1</font><font size='14'> - %2 MHz </font><font size='12'>- %3 men</font>:  ", _name, _freq, (count units _x)];
                };
              };
              case 2: { // acre2
                waitUntil { !isNil "phx_acre_setup"; };

                // Get group's radio frequency
                private _radioFreqs = nil;
                switch (side player) do {
                  case west: {
                    _radioFreqs = f_radios_settings_acre2_sr_groups_blufor;
                  };
                  case east: {
                    _radioFreqs = f_radios_settings_acre2_sr_groups_opfor;
                  };
                  case independent: {
                    _radioFreqs = f_radios_settings_acre2_sr_groups_indfor;
                  };
                };
                private _freq = nil;
                {
                  if (_name in (_x select 1)) exitWith {
                    _freq = _forEachIndex;
                  };
                } forEach _radioFreqs;
                if (isNil "_freq") then {
                    _freq = "UNK";
                } else {
                    _freq = _freq + 1;
                };

                // Add group to the ORBAT
                if (isNil "_freq") then {
                    _groupString = _groupString + format ["%1 --", _name];
                } else {
                    _groupString = _groupString + format ["<font size='16'>%1</font><font size='14'> - Ch. %2 </font><font size='12'>- %3 men</font>:  ", _name, _freq, (count units _x)];
                };
              };
            };

            // Add group members
            {
                private _leftPad = " ";
                if !(_forEachIndex isEqualTo 0) then{
                    _leftPad = ", ";
                };
                if (getNumber (configFile >> "CfgVehicles" >> typeOf _x >> "attendant") isEqualTo 1) then {
                    private _colorUsed = _color;
                    if (player isEqualTo _x) then {_colorUsed = _highlightColor};
                    _groupString = _groupString + format["<font size='12'>%2<font color='%3'>%1</font> [M]</font>",name _x,_leftPad,_colorUsed];
                } else {
                    private _colorUsed = _color;
                    if (player isEqualTo _x) then {_colorUsed = _highlightColor};
                    _groupString = _groupString + format["<font size='12'>%2<font color='%3'>%1</font></font>",name _x,_leftPad,_colorUsed];
                };
            } forEach units _x;

            _groupString = _groupString + "<br/>";
            _functionText = _functionText + _groupString;
        };
    } forEach _groups;

    // Return functionText
    _functionText
};

//----------------------------------------------------------------------------------------------------
private _side = side group player;
private _orbatText = "<br />NOTE: The ORBAT below is only accurate at mission start.<br />
<br />";

waitUntil { !isNil "phx_groupIDset" };
switch (f_param_radios) do {
  case 1: { // TFR
    waitUntil { !isNil "phx_playerBaseChannel" };
  };
  case 2: { // acre2
    waitUntil { !isNil "phx_acre_setup"; };
  };
};

phx_colorArrayBase = [
    "#8080FF", // light blue
    "#80FF80", // light green
    "#FF8080", // light red
    "#FFFF80", // light yellow
    "#FF80FF", // light pink
    "#FFC080" // light orange
];
phx_colorArray = [];
phx_colorArrayUsed = [];

private _groups = [];
private _templateGroups = [];
private _templateGroupList = [
    "Blue_CC", "Blue_P1HQ", "Blue_P2HQ", "Blue_P", "Blue_A", "Blue_A1", "Blue_A2", "Blue_B", "Blue_B1", "Blue_B2", "Blue_C", "Blue_C1", "Blue_C2", "Blue_D", "Blue_D1", "Blue_D2", "Blue_D3", "Blue_D4", "Blue_E", "Blue_E1", "Blue_E2", "Blue_F", "Blue_F1", "Blue_F2", "Blue_G", "Blue_G1", "Blue_G2",
    "Red_CC", "Red_P1HQ", "Red_P2HQ", "Red_P", "Red_A", "Red_A1", "Red_A2", "Red_B", "Red_B1", "Red_B2", "Red_C", "Red_C1", "Red_C2", "Red_D", "Red_D1", "Red_D2", "Red_D3", "Red_D4", "Red_E", "Red_E1", "Red_E2", "Red_F", "Red_F1", "Red_F2", "Red_G", "Red_G1", "Red_G2",
    "Green_CC", "Green_P1HQ", "Green_P2HQ", "Green_P", "Green_I", "Green_I1", "Green_I2", "Green_J", "Green_J1", "Green_J2", "Green_K", "Green_K1", "Green_K2", "Green_L", "Green_L1", "Green_L2", "Green_L3", "Green_L4", "Green_M", "Green_M1", "Green_M2", "Green_N", "Green_N1", "Green_N2", "Green_O", "Green_O1", "Green_O2"
];

{
    // Add to ORBAT if side matches, group isn't already listed, and group has players
    private _identity = _x getVariable ["phx_groupIdentifier",groupID _x];
    if ((side _x isEqualTo _side) && {!(_x in _groups)} && {({_x in (switchableUnits + playableUnits)} count units _x) > 0}) then {
        if (_identity in _templateGroupList) then {
            _templateGroups pushBack _x;
        } else {
            _groups pushBack _x;
        };
    };
} forEach allGroups;

// Generate ORBAT text for template groups
private _templateText = [_templateGroups] call _generateORBAT;

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
private _groupText = "";
if !(_groups isEqualTo []) then {
    _groupText = [_groups] call _generateORBAT;
};
if !(_groupText isEqualTo "") then {
    _orbatText = _orbatText + "<br/>Attached Units:<br/>" + _groupText;
};

waitUntil {!isNil "ORBAT_Diary"};
// Insert final result into subsection ORBAT of section Notes
player createDiaryRecord ["ORBAT_Diary", ["Team ORBAT", _orbatText]];
phx_writtenORBAT = true;
