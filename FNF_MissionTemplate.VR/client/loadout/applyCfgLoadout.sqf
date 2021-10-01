if (!hasInterface || isDedicated) exitWith {};
waitUntil {!isNull player};

[{
    params ["_args", "_handle"];
    _args params ["_addTime"];

    if !(missionNamespace getVariable ["phx_loadoutAssigned",false]) then {
        // After 30 seconds with no loadout being set, kick player back to the slotting screen
        if (diag_tickTime-30 > _addTime) then {
            diag_log format ["PHX [%1] checkLoadout - Waited 30 seconds and didn't get a loadout! Report this to the mission maker. - %2",diag_tickTime,_addTime];
            endMission "END1";
        };
    } else {
        // Loadout was set, stop PFH
        diag_log format ["PHX [%1] checkLoadout - Loadout set, took %2 seconds",diag_tickTime,(diag_tickTime - _addTime)];
        [_handle] call CBA_fnc_removePerFrameHandler;
    };
}, 0, [diag_tickTime]] call CBA_fnc_addPerFrameHandler;

player unlinkItem "ItemRadio";
{
player unassignItem _x;
player removeItem _x;
} forEach [
"NVGoggles",
"NVGoggles_OPFOR",
"NVGoggles_INDEP"
];
removeAllItems player;
removeAllWeapons player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
// removeGoggles player;


#define PLAYERLOADOUTVAR (player getVariable "phxLoadout")

private _sideStr = (playerSide call BIS_fnc_sideID) call BIS_fnc_sideName;
mySideWeaponSelection = missionNamespace getVariable ("phx_" + _sideStr + "Weapons");
#define CFGWEAPONS missionConfigFile >> "CfgLoadouts" >> mySideWeaponSelection >> PLAYERLOADOUTVAR
#define CFGOPTICS missionConfigFile >> "CfgLoadouts" >> "optics"

private _cfgUniform = (CFGWEAPONS >> "uniform") call BIS_fnc_getCfgDataArray;
private _cfgVest = (CFGWEAPONS >> "vest") call BIS_fnc_getCfgDataArray;
private _cfgHeadgear = (CFGWEAPONS >> "headgear") call BIS_fnc_getCfgDataArray;
private _cfgBackpack = (CFGWEAPONS >> "backpack") call BIS_fnc_getCfgDataArray;
private _cfgBackpackItems = (CFGWEAPONS >> "backpackItems") call BIS_fnc_getCfgDataArray;
private _cfgLaunchers = (CFGWEAPONS >> "launchers") call BIS_fnc_getCfgDataArray;
private _cfgSidearms = (CFGWEAPONS >> "sidearms") call BIS_fnc_getCfgDataArray;
private _cfgMagazines = (CFGWEAPONS >> "magazines") call BIS_fnc_getCfgDataArray;
private _cfgItems = (CFGWEAPONS >> "items") call BIS_fnc_getCfgDataArray;
private _cfgLinkedItems = (CFGWEAPONS >> "linkedItems") call BIS_fnc_getCfgDataArray;
private _cfgWeaponChoices = (CFGWEAPONS >> "weaponChoices") call BIS_fnc_getCfgDataArray;
private _cfgAttachments = (CFGWEAPONS >> "attachments") call BIS_fnc_getCfgDataArray;
private _cfgLauncherAttachments = (CFGWEAPONS >> "launcherAttachments") call BIS_fnc_getCfgDataArray;
private _cfgExplosiveChoices = (CFGWEAPONS >> "explosiveChoices") call BIS_fnc_getCfgDataArray;
private _cfgGiveSideKey = (CFGWEAPONS >> "giveSideKey") call BIS_fnc_getCfgData;
// private _cfgHandgunAttachments = getArray (_cfgPath >> "handgunAttachments");


fnc_getWeaponMagazines = {
	params ["_toSearch", "_weapon", ["_allMuzzles", true]];
	private _out = [];
	{
		if ((_x splitString ':' select 0) in ([_weapon, _allMuzzles] call CBA_fnc_compatibleMagazines)) then {
			_out pushBack _x;
		};
	} forEach _toSearch;
	_out
};


// Wearable
private _uniform = if (_cfgUniform isEqualTo []) then { "" } else { selectRandom _cfgUniform };
private _vest = if (_cfgVest isEqualTo []) then { "" } else { selectRandom _cfgVest };
private _backpack = if (_cfgBackpack isEqualTo []) then { "" } else { selectRandom _cfgBackpack };
private _headgear = if (_cfgHeadgear isEqualTo []) then { "" } else { selectRandom _cfgHeadgear };

player forceAddUniform selectRandom(_cfgUniform);
player addVest selectRandom(_cfgVest);
player addBackpack selectRandom(_cfgBackpack);
player addHeadgear selectRandom(_cfgHeadgear);


// Items, grenades
{[_x, "vest"] call phx_fnc_addGear} forEach _cfgMagazines;
{[_x, "uniform"] call phx_fnc_addGear} forEach _cfgItems;
{[_x, "backpack"] call phx_fnc_addGear} forEach _cfgBackpackItems;
{player linkItem _x} forEach _cfgLinkedItems;

// NVGs/laser accessory
_giveNVG = {player linkItem phx_loadout_nvg};
_addLaser = {{player addPrimaryWeaponItem _x} forEach ["rhs_acc_perst1ik", "rhsusf_acc_anpeq15A"];};
switch (typeName phx_addNVG) do {
  case "NUMBER": {if (phx_addNVG == 1) then {call _giveNVG; call _addLaser}};
  case "ARRAY": {if (playerSide in phx_addNVG) then {call _giveNVG; call _addLaser}};
};


// Primary weapon and appropriate magazines
phx_loadout_weaponChosen = if (count _cfgWeaponChoices > 0) then {selectRandom(_cfgWeaponChoices)} else {[]};
phx_loadout_weaponChosen params ["_weapons", "_mags"];
phx_loadout_weapon = selectRandom(_weapons);
phx_loadout_weaponMagazines = [_mags, phx_loadout_weapon] call fnc_getWeaponMagazines;
player addWeapon phx_loadout_weapon;
{[_x, "vest"] call phx_fnc_addGear; nil} count phx_loadout_weaponMagazines;

// iterate through _cfgWeaponChoices and add each weapon and appropriate mags to phx_selector_weapons so they can be chosen from
private _weaponChoices = [];
{
  _x params ["_weapons", "_mags"];
  {
    private _weapon = _x;
    private _compatMags = [_mags, _weapon] call fnc_getWeaponMagazines;
    _weaponChoices pushBack [_weapon, _compatMags];
  } forEach _weapons;
} forEach _cfgWeaponChoices;

// "debug_console" callExtension str(_weaponChoices);
missionNamespace setVariable ["phx_selector_weapons", _weaponChoices];


// Sidearm and appropriate magazines
phx_loadout_sidearmChosen = if (count _cfgSidearms > 0) then {selectRandom(_cfgSidearms)} else {""};
phx_loadout_sidearmChosen params ["_sidearms", "_mags"];
phx_loadout_sidearm = selectRandom(_sidearms);
phx_loadout_sidearmMagazines = [_mags, phx_loadout_sidearm] call fnc_getWeaponMagazines;
player addWeapon phx_loadout_sidearm;
{[_x, "uniform"] call phx_fnc_addGear; nil} count phx_loadout_sidearmMagazines;

phx_loadout_launcher = if (count _cfgLaunchers > 0) then {selectRandom(_cfgLaunchers)} else {""};
player addWeapon phx_loadout_launcher;


// Optic selections based on phx_magnifiedOptics setting
private "_cfgOpticChoices";
switch (phx_magnifiedOptics) do {
  // Nobody should have optics
  case -1: {_cfgOpticChoices = []};
  // All should have magnified
  case 1: {
    _cfgOpticChoices = (CFGOPTICS >> "standard") call BIS_fnc_getCfgDataArray;
    if !(PLAYERLOADOUTVAR in ["MG"]) then { // ensures MMGs never get magnified optics
      _cfgOpticChoices = (CFGOPTICS >> "magnified") call BIS_fnc_getCfgDataArray;
    };
    if (PLAYERLOADOUTVAR in ["SNP"]) then {
      _cfgOpticChoices = (CFGOPTICS >> "sniper") call BIS_fnc_getCfgDataArray;
    };
  };
    // 0 OR default: DM magnified, sniper special
  default {
    _cfgOpticChoices = (CFGOPTICS >> "standard") call BIS_fnc_getCfgDataArray;
    if (PLAYERLOADOUTVAR in ["DM"]) then {
      _cfgOpticChoices = (CFGOPTICS >> "magnified") call BIS_fnc_getCfgDataArray;
    };
    if (PLAYERLOADOUTVAR in ["SNP"]) then {
      _cfgOpticChoices = (CFGOPTICS >> "sniper") call BIS_fnc_getCfgDataArray;
    };
  };
};
// "debug_console" callExtension ("Optics choices: " + str(_cfgOpticChoices));
missionNamespace setVariable ["phx_selector_optics", _cfgOpticChoices];

// MAT
if (PLAYERLOADOUTVAR in ["MAT", "MATA"]) then {
  call phx_fnc_setMAT;
  if (PLAYERLOADOUTVAR == "MAT") then {
    // for gunner, add MAT weapon, then optic to it
    player addWeapon phx_loadout_mediumantitank_weapon;
    if (!isNil "phx_loadout_mediumantitank_optic") then {
      player addSecondaryWeaponItem phx_loadout_mediumantitank_optic;
    };
  };

  // add mags & load one
  [phx_loadout_mediumantitank_mag, "backpack"] call phx_fnc_addGear;
  private _compatMag = phx_loadout_mediumantitank_mag splitString ':' select 0;
  player removeMagazine _compatMag;
  player addSecondaryWeaponItem _compatMag;

  // if secondary MAT mag type (tandem, etc) then add
  if !(phx_loadout_mediumantitank_mag_1 == "") then {
    [phx_loadout_mediumantitank_mag_1, "backpack"] call phx_fnc_addGear;
  };
};


// CE Explosives
phx_loadout_explosives = if (count _cfgExplosiveChoices > 0) then {selectRandom(_cfgExplosiveChoices)} else {[]};
"debug_console" callExtension str(phx_loadout_explosives);
{
  [_x, "backpack"] call phx_fnc_addGear;
} forEach (phx_loadout_explosives select [1, 2]);
phx_selector_explosives = if (count _cfgExplosiveChoices > 0) then {_cfgExplosiveChoices} else {[]};

// Attributes
if (PLAYERLOADOUTVAR == "MED") then {player setVariable ["ace_medical_medicClass", 1, true]};
if (PLAYERLOADOUTVAR in ["CE","CR","PI"]) then {player setVariable ["ace_isEngineer", 1, true]};


// Side key
if (_cfgGiveSideKey > 0) then {
  switch (playerSide) do {
    case west: {
        player addItem "ACE_key_west";
    };
    case east: {
        player addItem "ACE_key_east";
    };
    case independent: {
        player addItem "ACE_key_indp";
    };
  };
};



// load weapons
{
    _x params ["_weaponClass", "_mags"];
    private _cfgWeapon = _weaponClass call CBA_fnc_getItemConfig;

    // check for multiple muzzles (eg: GL)
    private _muzzles = getArray (configFile >> "cfgWeapons" >> _weaponClass >> "muzzles") select {!(["SAFE", _x] call BIS_fnc_inString)};
    // "debug_console" callExtension str([_weaponClass, _muzzles]);

  {
    private _thisMuzzle = _x;
    private "_compatMag";
    // "debug_console" callExtension str([_weaponClass, _mags, configName(_cfgWeapon >> _thisMuzzle), [_mags, _cfgWeapon >> _thisMuzzle, false] call fnc_getWeaponMagazines]);

    if (_thisMuzzle == "this") then {
      _compatMag = ([_mags, _cfgWeapon, false] call fnc_getWeaponMagazines) select 0;
    } else {
      _compatMag = ([_mags, _cfgWeapon >> _thisMuzzle, false] call fnc_getWeaponMagazines) select 0;
    };
    _compatMag = _compatMag splitString ':' select 0;
    // "debug_console" callExtension str([_weaponClass, _thisMuzzle, _compatMag]);

    player removeMagazine _compatMag;
    switch (_weaponClass) do {
      case (primaryWeapon player): {
        player addPrimaryWeaponItem _compatMag;
      };
      case (handgunWeapon player): {
        player addHandgunItem _compatMag;
      };
    };
  } forEach _muzzles;
} forEach [
  [primaryWeapon player, phx_loadout_weaponMagazines],
  [handgunWeapon player, phx_loadout_sidearmMagazines]
];


// show hint
_fnc_hintDetails = {
  params ["_class", "_count"];
	private _thisCfg = _class call CBA_fnc_getItemConfig;
	private _dispName = [_thisCfg] call BIS_fnc_displayName;
	private _desc = getText(_thisCfg >> "descriptionShort");
	private _pic = getText(_thisCfg >> "picture");

  private "_textArr";
  if (!isNil "_count") then {
    _textArr = [
      format["<t align='center'><img size='2.5' image='%1'/><t valign='bottom'>x%2</t>", _pic, _count],
      format["<t size='0.7'>%1</t>", _dispName],
      format["<t size='0.7'>%1</t>", _desc],
      "</t>"
    ];
  } else {
    _textArr = [
      format["<t align='center'><img size='2.5' image='%1'/>", _pic],
      format["<t size='0.7'>%1</t>", _dispName],
      format["<t size='0.7'>%1</t>", _desc],
      "</t>"
    ];
  };
	// [_textArr joinString '<br/>', "success", 5] call phx_ui_fnc_notify;
	_textArr joinString '<br/>'
};

#define LOADOUTROLE(_str) (PLAYERLOADOUTVAR isEqualTo _str)

private _strRole = "";
if (LOADOUTROLE("PL")) then {_strRole = " Platoon Leader"};
if (LOADOUTROLE("SL") || LOADOUTROLE("SGT")) then {_strRole = " Squad Leader"};
if (LOADOUTROLE("TL")) then {_strRole = " Team Leader"};
if (LOADOUTROLE("AR")) then {_strRole = "n Automatic Rifleman"};
if (LOADOUTROLE("ARA")) then {_strRole = "n Asst. Automatic Rifleman"};
if (LOADOUTROLE("GR")) then {_strRole = " Grenadier"};
if (LOADOUTROLE("GRIR")) then {_strRole = " Grenadier w/ HuntIR"};
if (LOADOUTROLE("MG")) then {_strRole = " Machine Gunner"};
if (LOADOUTROLE("MGA")) then {_strRole = "n Asst. Machine Gunner"};
if (LOADOUTROLE("CE")) then {_strRole = " Combat Engineer"};
if (LOADOUTROLE("LAT")) then {_strRole = " Light Anti-Tank Rifleman"};
if (LOADOUTROLE("MAT")) then {_strRole = " Medium Anti-Tank Specialist"};
if (LOADOUTROLE("MATA")) then {_strRole = " Medium Anti-Tank Assistant"};
if (LOADOUTROLE("RI")) then {_strRole = " Rifleman"};
if (LOADOUTROLE("RIS")) then {_strRole = " Senior Rifleman"};
if (LOADOUTROLE("DM")) then {_strRole = " Designated Marksman"};
if (LOADOUTROLE("SNP")) then {_strRole = " Sniper"};
if (LOADOUTROLE("CR")) then {_strRole = " Crewman"};
if (LOADOUTROLE("PI")) then {_strRole = " Pilot"};
if (LOADOUTROLE("MED")) then {_strRole = " Medic"};


#define STYLE_HEADER "<t align='center' size='1.4' color='#e1701a' face='PuristaBold'>"
private _notifyString = [];
_notifyString pushBack (STYLE_HEADER + "ROLE</t>");
_notifyString pushBack ("<t align='center' face='PuristaLight'>You are a" + _strRole + "<br/>in " + (roleDescription player splitString '@' select 1) + "</t>");
// _notifyString pushBack ("<br/>");
_notifyString pushBack (STYLE_HEADER + "Primary Weapon</t>");
_notifyString pushBack ([primaryWeapon player] call _fnc_hintDetails);
// _notifyString pushBack ("<br/>");
_notifyString pushBack (STYLE_HEADER + "Handgun Weapon</t>");
_notifyString pushBack ([handgunWeapon player] call _fnc_hintDetails);
// _notifyString pushBack ("<br/>");

if (secondaryWeapon player != "") then {
	_notifyString pushBack (STYLE_HEADER + "Launcher</t>");
	_notifyString pushBack ([secondaryWeapon player] call _fnc_hintDetails)
};

if (LOADOUTROLE("CE")) then {
	_notifyString pushBack (STYLE_HEADER + "Explosives</t>");
	{
    (_x splitString ':') params ["_class", "_count"];
    _notifyString pushBack ([_class, _count] call _fnc_hintDetails);
  } forEach (phx_loadout_explosives select [1,2]);
};

[{
  [_this joinString '<br/>', "warning", 15] call phx_ui_fnc_notify;
}, _notifyString, 2] call CBA_fnc_waitAndExecute;




missionNamespace setVariable ["phx_loadoutAssigned",true];






// configProperties [missionConfigFile >> "CfgLoadoutWeapons" >> "west" >> "PL"];
// (missionConfigFile >> "CfgLoadoutWeapons" >> "west") call BIS_fnc_getCfgSubClasses;
// (missionConfigFile >> "CfgLoadoutWeapons" >> "west" >> "PL" >> "vest") call BIS_fnc_getCfgData;
