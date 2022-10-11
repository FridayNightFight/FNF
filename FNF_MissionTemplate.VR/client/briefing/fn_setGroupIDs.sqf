/*
* Author: ferstaberinde.com, modified by Martin, IndigoFox
*
* Description:
* Configures group variables used in ORBAT creation and TFAR radio setup.
*
* Arguments:
* /NONE/
*
* Return Value:
* true on success <BOOLEAN>
*
* Example:
* call fnf_briefing_fnc_createOrbat
*
* Public: No
*/

// F3 Set Group IDs
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// This script has been modified from it's original form.
//
// IF YOU GET A MESSAGE SIMILAR TO:
// [setGroupIDs] No radio freq found for group - '%1'
// SEE THE README.MD FILE IN THIS FILE'S FOLDER
// ====================================================================================

_groups = nil;
_groups = [
    // ====================================================================================
    // - format: [group,groupID,fnf_LongName,unitSize,radioSettings]
    // group: defined in initialization field of units in editor. Also used as the group's identifier in scripts ex: Red_HQ = group this;
    // groupID: ID given to group for use in things such as GPS, nametags, etc. (string)
    // fnf_LongName: Longer version of the groupID used in things such as the radios, etc. (string)
    // unitSize: Number telling what level the group is. Company = 3, Platoon = 2, Squad = 1, Fireteam = 0 (0-3)
    // radioSettings: Tells radio script which channels to set for group. [altChannel,mainChannel,[channelArray]] (array)
    //     mainChannel: Which channel the radio will start on. (1-8)
    //     altChannel: Which channel the radio will have as an alternate by default (1-8)
    //     [channelArray]: An array of channels to set on the radio. (float)
    //        channelArray is expressed as numbers which are added to playerBaseChannel (ch1) to determine which channel the radio will be on.
    //        Try to keep offsets single digit or the channel may not be set if playerBaseChannel is a high number.
    //        Frequencies can only have one decimal place.
    //     ex: [1,6,[1,2,3,4]] - mainChannel is ch1, altChannel is ch6, ch2 is 1 unit MHz higher than ch1, etc.

    // BLUFOR
    //Company
    ["Blue_CC","CMD","Company Command",2, [1, 2, [1, 1.1, 2, 3, 4, 5, 6, 7, 8]] ],
    ["Blue_E","E","Echo",1, [2, 1, [1, 1.2, 2, 3, 4, 5, 6, 7, 8]] ],

    //not used
    ["Blue_Pilot","P","Pilots",1, [1, 2, [1, 2, 3, 4, .1]] ],

    ["Blue_A","A","Alpha",1, [2, 1, [1, 2, 2.1, 2.2, 2.3]] ],
    ["Blue_A1","A1","Alpha One",0, [2, 1, [2, 2.1, 2.2, 2.3]] ],
    ["Blue_A2","A2","Alpha Two",0, [3, 1, [2, 2.1, 2.2, 2.3]] ],
    ["Blue_A3","A3","Alpha Three",0, [4, 1, [2, 2.1, 2.2, 2.3]] ],

    ["Blue_B","B","Bravo",1, [2, 1, [1, 3, 3.1, 3.2]] ],
    ["Blue_B1","B1","Bravo One",0, [2, 1, [3, 3.1, 3.2]] ],
    ["Blue_B2","B2","Bravo Two",0, [3, 1, [3, 3.1, 3.2]] ],
    ["Blue_B3","B3","Bravo Three",0, [4, 1, [3, 3.1, 3.2, 3.3]] ],

    ["Blue_C","C","Charlie",1, [2, 1, [1, 4, 4.1, 4.2, 4.3]] ],
    ["Blue_C1","C1","Charlie 1",0, [2, 1, [4, 4.1, 4.2, 4.3]] ],
    ["Blue_C2","C2","Charlie 2",0, [3, 1, [4, 4.1, 4.2, 4.3]] ],
    ["Blue_C3","C3","Charlie 3",0, [4, 1, [4, 4.1, 4.2, 4.3]] ],

    ["Blue_D","D","Delta",1, [2, 1, [1, 5, 5.1, 5.2, 5.3]] ],
    ["Blue_D1","D1","Delta 1",0, [2, 1, [5, 5.1, 5.2, 5.3]] ],
    ["Blue_D2","D2","Delta 2",0, [3, 1, [5, 5.1, 5.2, 5.3]] ],
    ["Blue_D3","D3","Delta 3",0, [4, 1, [5, 5.1, 5.2, 5.3]] ],

    // Vehicle teams - under Company
    ["Blue_G1","G1","Golf 1",1, [2, 1, [1, 9.1, 9.2, 9.3, 9.4]] ],
    ["Blue_G2","G2","Golf 2",1, [3, 1, [1, 9.1, 9.2, 9.3, 9.4]] ],
    ["Blue_G3","G3","Golf 3",1, [4, 1, [1, 9.1, 9.2, 9.3, 9.4]] ],
    ["Blue_G4","G4","Golf 4",1, [5, 1, [1, 9.1, 9.2, 9.3, 9.4]] ],

    //Pilot teams - under Company
    ["Blue_H1","H1","Hotel 1",1, [2, 1, [1, 10.1, 10.2, 10.3]] ],
    ["Blue_H2","H2","Hotel 2",1, [3, 1, [1, 10.1, 10.2, 10.3]] ],
    ["Blue_H3","H3","Hotel 3",1, [4, 1, [1, 10.1, 10.2, 10.3]] ],

    /////////////////////////////////////////////////////////////////////////////////

    //REDFOR
    //Company
    ["Red_CC","CMD","Company Command",2, [1, 2, [1, 1.1, 2, 3, 4, 5, 6, 7, 8]] ],
    ["Red_E","E","Echo",1, [2, 1, [1, 1.2, 2, 3, 4, 5, 6, 7, 8]] ],

    //not used
    ["Red_Pilot","P","Pilots",1, [1, 2, [1, 2, 3, 4, .1]] ],

    ["Red_A","A","Alpha",1, [2, 1, [1, 2, 2.1, 2.2, 2.3]] ],
    ["Red_A1","A1","Alpha One",0, [2, 1, [2, 2.1, 2.2, 2.3]] ],
    ["Red_A2","A2","Alpha Two",0, [3, 1, [2, 2.1, 2.2, 2.3]] ],
    ["Red_A3","A3","Alpha Three",0, [4, 1, [2, 2.1, 2.2, 2.3]] ],

    ["Red_B","B","Bravo",1, [2, 1, [1, 3, 3.1, 3.2]] ],
    ["Red_B1","B1","Bravo One",0, [2, 1, [3, 3.1, 3.2]] ],
    ["Red_B2","B2","Bravo Two",0, [3, 1, [3, 3.1, 3.2]] ],
    ["Red_B3","B3","Bravo Three",0, [4, 1, [3, 3.1, 3.2, 3.3]] ],

    ["Red_C","C","Charlie",1, [2, 1, [1, 4, 4.1, 4.2, 4.3]] ],
    ["Red_C1","C1","Charlie 1",0, [2, 1, [4, 4.1, 4.2, 4.3]] ],
    ["Red_C2","C2","Charlie 2",0, [3, 1, [4, 4.1, 4.2, 4.3]] ],
    ["Red_C3","C3","Charlie 3",0, [4, 1, [4, 4.1, 4.2, 4.3]] ],

    ["Red_D","D","Delta",1, [2, 1, [1, 5, 5.1, 5.2, 5.3]] ],
    ["Red_D1","D1","Delta 1",0, [2, 1, [5, 5.1, 5.2, 5.3]] ],
    ["Red_D2","D2","Delta 2",0, [3, 1, [5, 5.1, 5.2, 5.3]] ],
    ["Red_D3","D3","Delta 3",0, [4, 1, [5, 5.1, 5.2, 5.3]] ],

    // Vehicle teams - under Company
    ["Red_G1","G1","Golf 1",1, [2, 1, [1, 9.1, 9.2, 9.3, 9.4]] ],
    ["Red_G2","G2","Golf 2",1, [3, 1, [1, 9.1, 9.2, 9.3, 9.4]] ],
    ["Red_G3","G3","Golf 3",1, [4, 1, [1, 9.1, 9.2, 9.3, 9.4]] ],
    ["Red_G4","G4","Golf 4",1, [5, 1, [1, 9.1, 9.2, 9.3, 9.4]] ],

    //Pilot teams - under Company
    ["Red_H1","H1","Hotel 1",1, [2, 1, [1, 10.1, 10.2, 10.3]] ],
    ["Red_H2","H2","Hotel 2",1, [3, 1, [1, 10.1, 10.2, 10.3]] ],
    ["Red_H3","H3","Hotel 3",1, [4, 1, [1, 10.1, 10.2, 10.3]] ],

    /////////////////////////////////////////////////////////////////////////////////

    //INDFOR
    //Company
    ["Green_CC","CMD","Company Command",2, [1, 2, [1, 1.1, 2, 3, 4, 5, 6, 7, 8]] ],
    ["Green_E","E","Echo",1, [2, 1, [1, 1.2, 2, 3, 4, 5, 6, 7, 8]] ],

    //not used
    ["Green_Pilot","P","Pilots",1, [1, 2, [1, 2, 3, 4, .1]] ],

    ["Green_A","A","Alpha",1, [2, 1, [1, 2, 2.1, 2.2, 2.3]] ],
    ["Green_A1","A1","Alpha One",0, [2, 1, [2, 2.1, 2.2, 2.3]] ],
    ["Green_A2","A2","Alpha Two",0, [3, 1, [2, 2.1, 2.2, 2.3]] ],
    ["Green_A3","A3","Alpha Three",0, [4, 1, [2, 2.1, 2.2, 2.3]] ],

    ["Green_B","B","Bravo",1, [2, 1, [1, 3, 3.1, 3.2]] ],
    ["Green_B1","B1","Bravo One",0, [2, 1, [3, 3.1, 3.2]] ],
    ["Green_B2","B2","Bravo Two",0, [3, 1, [3, 3.1, 3.2]] ],
    ["Green_B3","B3","Bravo Three",0, [4, 1, [3, 3.1, 3.2, 3.3]] ],

    ["Green_C","C","Charlie",1, [2, 1, [1, 4, 4.1, 4.2, 4.3]] ],
    ["Green_C1","C1","Charlie 1",0, [2, 1, [4, 4.1, 4.2, 4.3]] ],
    ["Green_C2","C2","Charlie 2",0, [3, 1, [4, 4.1, 4.2, 4.3]] ],
    ["Green_C3","C3","Charlie 3",0, [4, 1, [4, 4.1, 4.2, 4.3]] ],

    ["Green_D","D","Delta",1, [2, 1, [1, 5, 5.1, 5.2, 5.3]] ],
    ["Green_D1","D1","Delta 1",0, [2, 1, [5, 5.1, 5.2, 5.3]] ],
    ["Green_D2","D2","Delta 2",0, [3, 1, [5, 5.1, 5.2, 5.3]] ],
    ["Green_D3","D3","Delta 3",0, [4, 1, [5, 5.1, 5.2, 5.3]] ],

    // Vehicle teams - under Company
    ["Green_G1","G1","Golf 1",1, [2, 1, [1, 9.1, 9.2, 9.3, 9.4]] ],
    ["Green_G2","G2","Golf 2",1, [3, 1, [1, 9.1, 9.2, 9.3, 9.4]] ],
    ["Green_G3","G3","Golf 3",1, [4, 1, [1, 9.1, 9.2, 9.3, 9.4]] ],
    ["Green_G4","G4","Golf 4",1, [5, 1, [1, 9.1, 9.2, 9.3, 9.4]] ],

    //Pilot teams - under Company
    ["Green_H1","H1","Hotel 1",1, [2, 1, [1, 10.1, 10.2, 10.3]] ],
    ["Green_H2","H2","Hotel 2",1, [3, 1, [1, 10.1, 10.2, 10.3]] ],
    ["Green_H3","H3","Hotel 3",1, [4, 1, [1, 10.1, 10.2, 10.3]] ]
];

missionNamespace setVariable ["fnf_templateGroupsList", _groups apply {_x select 0}, true];
missionNamespace setVariable ["fnf_templateGroupsListExtended", _groups, true];

private ["_grp"];
{
    // Check first if the group exists
    _x params ["_identifier", "_shortName", "_longName", "_groupSize", "_radioArray"];
    _grp = missionNamespace getVariable [_identifier,grpNull];
    if (!isNull _grp) then {
        if !((groupID _grp) isEqualTo _shortName) then {
            _grp setGroupIdGlobal [_shortName,"GroupColor0"];
            //_grp setVariable ["fnf_groupIDSet",true,true];
        };
        _grp setVariable ["fnf_groupIdentifier",_identifier,true];
        _grp setVariable ["fnf_LongName",_longName,true];
        _grp setVariable ["fnf_gps_groupSize",_groupSize,true];
        _grp setVariable ["fnf_radioSettings",_radioArray,true];

        // for AI testing
        // private _groupSide = [(side _grp) call BIS_fnc_sideID] call BIS_fnc_sideName;
        // {_x setVariable [
        //   "fnf_startGroup",
        //   format[
        //     "%1 [%2]",
        //     _shortName,
        //     toUpper(_groupSide select [0,3])
        //   ],
        //   true
        // ]} forEach (units _grp);
    };
} forEach _groups;

{
  player setVariable [
    "fnf_startGroup",
    (group player) getVariable ["fnf_groupIdentifier", groupID (group player)],
    true
  ];
} remoteExecCall ["call", 0, true];

{
  _x setVariable [
    "fnf_startGroup",
    (group _x) getVariable ["fnf_groupIdentifier", groupID (group _x)],
    true
  ];
} forEach (allUnits select {!isPlayer _x});

missionNamespace setVariable ["fnf_groupIDset", true, true];
true
