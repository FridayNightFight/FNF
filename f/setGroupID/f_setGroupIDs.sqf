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
    // - format: [group,groupID,phx_LongName,unitSize,radioSettings]
    // group: defined in initialization field of units in editor. Also used as the group's identifier in scripts ex: Red_HQ = group this;
    // groupID: ID given to group for use in things such as GPS, nametags, etc. (string)
    // phx_LongName: Longer version of the groupID used in things such as the radios, etc. (string)
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
    ["Blue_CC","CMD","Company Command",3, [1, 6, [1, 2, 3, 4, .1]] ],

    ["Blue_P1HQ","P1HQ","1st Platoon",2, [1, 6, [1, 2, 3, 4, .1]] ],

    ["Blue_Pilot","P","Pilots",0, [1, 6, [1, 2, 3, 4, .1]] ],

    ["Blue_A","A","Alpha Squad",1, [2, 1, [1, 1.1, 1.2]] ],
    ["Blue_A1","A1","Alpha One",0, [3, 2, [1, 1.1, 1.2]] ],
    ["Blue_A2","A2","Alpha Two",0, [4, 2, [1, 1.1, 1.2]] ],

    ["Blue_B","B","Bravo Squad",1, [2, 1, [2, 2.1, 2.2]] ],
    ["Blue_B1","B1","Bravo One",0, [3, 2, [2, 2.1, 2.2]] ],
    ["Blue_B2","B2","Bravo Two",0, [4, 2, [2, 2.1, 2.2]] ],

    ["Blue_C","C","Charlie Squad",1, [2, 1, [3, 3.1, 3.2]] ],
    ["Blue_C1","C1","Charlie One",0, [3, 2, [3, 3.1, 3.2]] ],
    ["Blue_C2","C2","Charlie Two",0, [4, 2, [3, 3.1, 3.2]] ],

    ["Blue_D","D","Delta Squad",1, [2, 1, [4, 4.1, 4.2, 4.3, 4.4]] ],
    ["Blue_D1","D1","Delta One",0, [3, 2, [4, 4.1, 4.2, 4.3, 4.4]] ],
    ["Blue_D2","D2","Delta Two",0, [4, 2, [4, 4.1, 4.2, 4.3, 4.4]] ],
    ["Blue_D3","D3","Delta Three",0, [5, 2, [4, 4.1, 4.2, 4.3, 4.4]] ],
    ["Blue_D4","D4","Delta Four",0, [6, 2, [4, 4.1, 4.2, 4.3, 4.4]] ],

    ["Blue_P2HQ","P2HQ","2nd Platoon",2, [1, 5, [5, 6, 7, .1]] ],

    ["Blue_E","E","Echo Squad",1, [2, 1, [5, 5.1, 5.2]] ],
    ["Blue_E1","E1","Echo One",0, [3, 2, [5, 5.1, 5.2]] ],
    ["Blue_E2","E2","Echo Two",0, [4, 2, [5, 5.1, 5.2]] ],

    ["Blue_F","F","Foxtrot Squad",1, [2, 1, [6, 6.1, 6.2]] ],
    ["Blue_F1","F1","Foxtrot One",0, [3, 2, [6, 6.1, 6.2]] ],
    ["Blue_F2","F2","Foxtrot Two",0, [4, 2, [6, 6.1, 6.2]] ],

    ["Blue_G","G","Golf Squad",1, [2, 1, [7, 7.1, 7.2]] ],
    ["Blue_G1","G1","Golf One",0, [3, 2, [7, 7.1, 7.2]] ],
    ["Blue_G2","G2","Golf Two",0, [4, 2, [7, 7.1, 7.2]] ],

    // REDFOR
    ["Red_CC","CMD","Company Command",3, [1, 6, [1, 2, 3, 4, .1]] ],

    ["Red_P1HQ","P1HQ","1st Platoon",2, [1, 6, [1, 2, 3, 4, .1]] ],

    ["Red_Pilot","P","Pilots",0, [1, 6, [1, 2, 3, 4, .1]] ],

    ["Red_A","A","Alpha Squad",1, [2, 1, [1, 1.1, 1.2]] ],
    ["Red_A1","A1","Alpha One",0, [3, 2, [1, 1.1, 1.2]] ],
    ["Red_A2","A2","Alpha Two",0, [4, 2, [1, 1.1, 1.2]] ],

    ["Red_B","B","Bravo Squad",1, [2, 1, [2, 2.1, 2.2]] ],
    ["Red_B1","B1","Bravo One",0, [3, 2, [2, 2.1, 2.2]] ],
    ["Red_B2","B2","Bravo Two",0, [4, 2, [2, 2.1, 2.2]] ],

    ["Red_C","C","Charlie Squad",1, [2, 1, [3, 3.1, 3.2]] ],
    ["Red_C1","C1","Charlie One",0, [3, 2, [3, 3.1, 3.2]] ],
    ["Red_C2","C2","Charlie Two",0, [4, 2, [3, 3.1, 3.2]] ],

    ["Red_D","D","Delta Squad",1, [2, 1, [4, 4.1, 4.2, 4.3, 4.4]] ],
    ["Red_D1","D1","Delta One",0, [3, 2, [4, 4.1, 4.2, 4.3, 4.4]] ],
    ["Red_D2","D2","Delta Two",0, [4, 2, [4, 4.1, 4.2, 4.3, 4.4]] ],
    ["Red_D3","D3","Delta Three",0, [5, 2, [4, 4.1, 4.2, 4.3, 4.4]] ],
    ["Red_D4","D4","Delta Four",0, [6, 2, [4, 4.1, 4.2, 4.3, 4.4]] ],

    ["Red_P2HQ","P2HQ","2nd Platoon",2, [1, 5, [5, 6, 7, .1]] ],

    ["Red_E","E","Echo Squad",1, [2, 1, [5, 5.1, 5.2]] ],
    ["Red_E1","E1","Echo One",0, [3, 2, [5, 5.1, 5.2]] ],
    ["Red_E2","E2","Echo Two",0, [4, 2, [5, 5.1, 5.2]] ],

    ["Red_F","F","Foxtrot Squad",1, [2, 1, [6, 6.1, 6.2]] ],
    ["Red_F1","F1","Foxtrot One",0, [3, 2, [6, 6.1, 6.2]] ],
    ["Red_F2","F2","Foxtrot Two",0, [4, 2, [6, 6.1, 6.2]] ],

    ["Red_G","G","Golf Squad",1, [2, 1, [7, 7.1, 7.2]] ],
    ["Red_G1","G1","Golf One",0, [3, 2, [7, 7.1, 7.2]] ],
    ["Red_G2","G2","Golf Two",0, [4, 2, [7, 7.1, 7.2]] ],

    // INDFOR
    ["Green_CC","CMD","Company Command",3, [1, 6, [1, 2, 3, 4, .1]] ],

    ["Green_P1HQ","P1HQ","1st Platoon",2, [1, 6, [1, 2, 3, 4, .1]] ],

    ["Green_Pilot","P","Pilots",0, [1, 6, [1, 2, 3, 4, .1]] ],

    ["Green_I","I","India Squad",1, [2, 1, [1, 1.1, 1.2]] ],
    ["Green_I1","I1","India One",0, [3, 2, [1, 1.1, 1.2]] ],
    ["Green_I2","I2","India Two",0, [4, 2, [1, 1.1, 1.2]] ],

    ["Green_J","J","Juliet Squad",1, [2, 1, [2, 2.1, 2.2]] ],
    ["Green_J1","J1","Juliet One",0, [3, 2, [2, 2.1, 2.2]] ],
    ["Green_J2","J2","Juliet Two",0, [4, 2, [2, 2.1, 2.2]] ],

    ["Green_K","K","Kilo Squad",1, [2, 1, [3, 3.1, 3.2]] ],
    ["Green_K1","K1","Kilo One",0, [3, 2, [3, 3.1, 3.2]] ],
    ["Green_K2","K2","Kilo Two",0, [4, 2, [3, 3.1, 3.2]] ],

    ["Green_L","L","Lima Squad",1, [2, 1, [4, 4.1, 4.2, 4.3, 4.4]] ],
    ["Green_L1","L1","Lima One",0, [3, 2, [4, 4.1, 4.2, 4.3, 4.4]] ],
    ["Green_L2","L2","Lima Two",0, [4, 2, [4, 4.1, 4.2, 4.3, 4.4]] ],
    ["Green_L3","L3","Lima Three",0, [5, 2, [4, 4.1, 4.2, 4.3, 4.4]] ],
    ["Green_L4","L4","Lima Four",0, [6, 2, [4, 4.1, 4.2, 4.3, 4.4]] ],

    ["Green_P2HQ","P2HQ","2nd Platoon",2, [1, 5, [5, 6, 7, .1]] ],

    ["Green_M","M","Mike Squad",1, [2, 1, [5, 5.1, 5.2]] ],
    ["Green_M1","M1","Mike One",0, [3, 2, [5, 5.1, 5.2]] ],
    ["Green_M2","M2","Mike Two",0, [4, 2, [5, 5.1, 5.2]] ],

    ["Green_N","N","November Squad",1, [2, 1, [6, 6.1, 6.2]] ],
    ["Green_N1","N1","November One",0, [3, 2, [6, 6.1, 6.2]] ],
    ["Green_N2","N2","November Two",0, [4, 2, [6, 6.1, 6.2]] ],

    ["Green_O","O","Oscar Squad",1, [2, 1, [7, 7.1, 7.2]] ],
    ["Green_O1","O1","Oscar One",0, [3, 2, [7, 7.1, 7.2]] ],
    ["Green_O2","O2","Oscar Two",0, [4, 2, [7, 7.1, 7.2]] ]
];

private ["_grp"];
{
    // Check first if the group exists
    _x params ["_identifier", "_shortName", "_longName", "_groupSize", "_radioArray"];
    _grp = missionNamespace getVariable[_identifier,grpNull];
    if (!isNull _grp) then {
        if !((groupID _grp) isEqualTo _shortName) then {
            _grp setGroupIdGlobal [_shortName,"GroupColor0"];
            _grp setVariable ["phx_groupIDSet",true,true];
        };
        _grp setVariable ["phx_groupIdentifier",_identifier];
        _grp setVariable ["phx_LongName",_longName];
        _grp setVariable ["phx_gps_groupSize",_groupSize];
        _grp setVariable ["phx_radioSettings",_radioArray];
    };
} forEach _groups;

phx_groupIDset = true;
