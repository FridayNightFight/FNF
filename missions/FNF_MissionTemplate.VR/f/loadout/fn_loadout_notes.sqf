// F3 - Loadout Notes
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS
if (!hasInterface) exitWith {};

private ["_text","_weps","_items","_fnc_wepMags","_wepMags","_magArr","_s","_mags","_icon"];

// Local function to set the proper magazine count.
_fnc_wepMags = {
    private ["_magarr"];
    params["_w"];

    //Get possible magazines for weapon
    _wepMags = getArray (configFile >> "CfgWeapons" >> _w >> "magazines");

    // Compare weapon magazines with player magazines
    _magArr = [];
    {
        // findInPairs returns the first index that matches the checked for magazine
        _s = [_mags,_x] call BIS_fnc_findInPairs;

        //If we have a match
        if (_s != -1) then {
            // Add the number of magazines to the list
            _numMags = ([_mags,[_s, 1]] call BIS_fnc_returnNestedElement);
            _magArr pushBack _numMags;
            // Remove the entry
            _mags = [_mags, _s] call BIS_fnc_removeIndex;

        };
    } forEach _wepMags;

    if (count _magArr > 0) then {
        _text = _text + " [";

        {
            _text = _text + format ["%1",_x];
            if (count _magarr > (_forEachIndex + 1)) then {_text = _text + "+";}
        } forEach _magArr;

        _text = _text + "]";
    };
};

// ====================================================================================
// SET UP KEY VARIABLES

_text = "<br/>";

// All weapons minus the field glasses
_weps = weapons player - ["Rangefinder","Binocular","Laserdesignator"];

// Get a nested array containing all attached weapon items
_wepItems = weaponsItems player;

// Get a nested array containing all unique magazines and their count
_mags = (magazines player + primaryWeaponMagazine player + secondaryWeaponMagazine player + handgunMagazine player) call BIS_fnc_consolidateArray;

// Get a nested array containing all non-equipped items and their count
_items = (items player) call BIS_fnc_consolidateArray;

_visText = "";

// ====================================================================================
// Do this before _mags is deleted from.
_magVisText = "";
{
    _icon = getText(configFile >> "CfgMagazines" >> (_x select 0) >> "picture");
    if (_icon find ".paa" isEqualTo -1) then { _icon = _icon + ".paa"};
    _magVisText = _magVisText + "<img image='" + _icon + "' height=48 />";
    if ((_x select 1) > 1) then {
        _magVisText = _magVisText + format[" x%1",(_x select 1)];
    };

} forEach _mags;

// WEAPONS
// Add lines for all carried weapons and corresponding magazines

if (count _weps > 0) then {
    _text = _text + "<font size='18'>WEAPONS [#MAGAZINES]:</font>";
    {
        _text = _text + format["<br/>%1",getText (configFile >> "CfgWeapons" >> _x >> "displayname")];

        //Add magazines for weapon
          [_x] call _fnc_wepMags;

          // Check if weapon has an underslung grenade launcher
        if ({_x in ["GL_3GL_F","EGLM","UGL_F"]} count (getArray (configFile >> "CfgWeapons" >> _x >> "muzzles")) > 0) then {
            _text = _text + "<br/> |- UGL";
            ["UGL_F"] call _fnc_wepMags;
        };
        _icon = getText(configFile >> "CfgWeapons" >> _x >> "picture");
        if (_icon find ".paa" isEqualTo -1) then { _icon = _icon + ".paa"};
        _visText = _visText + "<img image='" + _icon + "' height=48 />";
        
        // List weapon attachments
        // Get attached items
        _attachments = _wepItems select (([_wepItems,_x] call BIS_fnc_findNestedElement) select 0);
        _attachments deleteAt 0; // Remove the first element as it points to the weapon itself

        {
            if (typeName _x != typeName [] && {_x != ""}) then {
                _icon = getText(configFile >> "CfgWeapons" >> _x >> "picture");
                if (_icon find ".paa" isEqualTo -1) then { _icon = _icon + ".paa"};
                _text = _text + format["<br/> |- %1",getText (configFile >> "CfgWeapons" >> _x >> "displayname")];
                _visText = _visText + "<img image='" + _icon + "' height=48 />";
            };
        } forEach _attachments;
        _visText = _visText;
    } forEach _weps;
    _text = _text + "<br/>";
};

// ====================================================================================
// OTHER MAGAZINES
// Add lines for all magazines not tied to any carried weapon (grenades etc.)

if (count _mags > 0) then {
    _text = _text + "<br/><font size='18'>OTHER [#]:</font><br/>";

    {
        _text = _text + format["%1 [%2]<br/>",getText (configFile >> "CfgMagazines" >> _x select 0 >> "displayname"),_x select 1];
    } forEach _mags;
};

_visText = _visText + _magVisText;

// ====================================================================================
// BACKPACK
// Add lines for all other items

if !(backpack player isEqualTo "") then {
    _text = _text + "<br/><font size='18'>BACKPACK [%FULL]:</font><br/>";
    _text = _text + format["%1 [%2",getText (configFile >> "CfgVehicles" >> (backpack player) >> "displayname"), 100*loadBackpack player]+"%]<br/>";
};

// ====================================================================================
// ITEMS
// Add lines for all other items

if (count _items > 0) then {
    _text = _text + "<br/><font size='18'>ITEMS [#]:</font><br/>";

    {
        _text = _text + format["%1 [%2]<br/>",getText (configFile >> "CfgWeapons" >> _x select 0 >> "displayname"),_x select 1];
        _visText = _visText + "<img image='" + getText(configFile >> "CfgWeapons" >> _x select 0  >> "picture") + "' height=48 />";
        if ((_x select 1) > 1) then {
            _visText = _visText + format[" x%1",(_x select 1)];
        };
    } forEach _items;

    {
        _text = _text + format["*%1<br/>",getText (configFile >> "CfgWeapons" >> _x >> "displayname")];
        _visText = _visText + "<img image='" + getText(configFile >> "CfgWeapons" >> _x >> "picture") + "' height=48 />";
    } forEach assignedItems player;

    _text = _text + "<br/>*Indicates an equipped item.";
};

// ====================================================================================
// ADD DIARY SECTION
// Wait for the briefing script to finish, then add the created text
[{
    params ["_args", "_handle"];
    _args params ["_visText", "_text"];
    
    if (!isNil "PHX_Diary") then {
        [_handle] call CBA_fnc_removePerFrameHandler;
    
        player createDiaryRecord ["PHX_Diary", ["Loadout", "NOTE: The loadout shown below is only accurate at mission start.<br/>"+ _visText + _text]];
    };
}, 0, [_visText, _text]] call CBA_fnc_addPerFrameHandler;
