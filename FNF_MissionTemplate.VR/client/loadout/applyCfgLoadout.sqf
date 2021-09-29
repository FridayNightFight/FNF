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

player enableSimulation false;

uiSleep 5;
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

private _cfgPath = (missionConfigFile >> "CfgLoadouts" >> "west" >> (player getVariable "phxLoadout"));

private _cfgUniform = (_cfgPath >> "uniform") call BIS_fnc_getCfgDataArray;
private _cfgVest = (_cfgPath >> "vest") call BIS_fnc_getCfgDataArray;
private _cfgHeadgear = (_cfgPath >> "headgear") call BIS_fnc_getCfgDataArray;
private _cfgBackpack = (_cfgPath >> "backpack") call BIS_fnc_getCfgDataArray;
private _cfgBackpackItems = (_cfgPath >> "backpackItems") call BIS_fnc_getCfgDataArray;
private _cfgLaunchers = (_cfgPath >> "launchers") call BIS_fnc_getCfgDataArray;
private _cfgSidearms = (_cfgPath >> "sidearms") call BIS_fnc_getCfgDataArray;
private _cfgMagazines = (_cfgPath >> "magazines") call BIS_fnc_getCfgDataArray;
private _cfgItems = (_cfgPath >> "items") call BIS_fnc_getCfgDataArray;
private _cfgLinkedItems = (_cfgPath >> "linkedItems") call BIS_fnc_getCfgDataArray;
private _cfgWeaponChoices = (_cfgPath >> "weaponChoices") call BIS_fnc_getCfgDataArray;
private _cfgAttachments = (_cfgPath >> "attachments") call BIS_fnc_getCfgDataArray;
private _cfgOpticChoices = (_cfgPath >> "opticChoices") call BIS_fnc_getCfgDataArray;
private _cfgLauncherAttachments = (_cfgPath >> "launcherAttachments") call BIS_fnc_getCfgDataArray;
// private _cfgHandgunAttachments = getArray (_cfgPath >> "handgunAttachments");

private _headgear = if (_cfgHeadgear isEqualTo []) then { "" } else { selectRandom _cfgHeadgear };


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



player forceAddUniform selectRandom(_cfgUniform);
player addVest selectRandom(_cfgVest);
player addBackpack selectRandom(_cfgBackpack);
player addHeadgear selectRandom(_cfgHeadgear);

phx_loadout_weaponChosen = if (count _cfgWeaponChoices > 0) then {selectRandom(_cfgWeaponChoices)} else {[]};
phx_loadout_weaponChosen params ["_weapons", "_mags"];
phx_loadout_weapon = selectRandom(_weapons);
phx_loadout_weaponMagazines = [_mags, phx_loadout_weapon] call fnc_getWeaponMagazines;
player addWeapon phx_loadout_weapon;
{[_x, "vest"] call phx_fnc_addGear; nil} count phx_loadout_weaponMagazines;

phx_loadout_sidearmChosen = if (count _cfgSidearms > 0) then {selectRandom(_cfgSidearms)} else {""};
phx_loadout_sidearmChosen params ["_sidearms", "_mags"];
phx_loadout_sidearm = selectRandom(_sidearms);
phx_loadout_sidearmMagazines = [_mags, phx_loadout_sidearm] call fnc_getWeaponMagazines;
player addWeapon phx_loadout_sidearm;
{[_x, "vest"] call phx_fnc_addGear; nil} count phx_loadout_sidearmMagazines;

phx_loadout_launcher = if (count _cfgLaunchers > 0) then {selectRandom(_cfgLaunchers)} else {""};
player addWeapon phx_loadout_launcher;

{[_x, "vest"] call phx_fnc_addGear} forEach _cfgMagazines;
{[_x, "uniform"] call phx_fnc_addGear} forEach _cfgItems;
{[_x, "backpack"] call phx_fnc_addGear} forEach _cfgBackpackItems;
{player linkItem _x} forEach _cfgLinkedItems;

// NVGs/laser accessory
_giveNVG = {player linkItem phx_loadout_nvg};
_addLaser = {{player addPrimaryWeaponItem _x} forEach ["rhs_acc_perst1ik", "rhsusf_acc_anpeq15A"];};
switch (typeName phx_addNVG) do {
  case "BOOL": {if (phx_addNVG) then {call _giveNVG; call _addLaser};};
  case "SIDE": {if (playerSide == phx_addNVG) then {call _giveNVG; call _addLaser};};
  case "ARRAY": {if (playerSide in phx_addNVG) then {call _giveNVG; call _addLaser};};
};




// MAT
if (player getVariable "phxLoadout" == "MAT") then {player addWeapon phx_loadout_mediumantitank_weapon};
if (player getVariable "phxLoadout" in ["MAT", "MATA"]) then {phx_loadout_mediumantitank_mag call phx_fnc_addGear};
if (
	player getVariable "phxLoadout" in ["MAT", "MATA"] &&
	!isNil "phx_loadout_mediumantitank_mag_1"
) then {phx_loadout_mediumantitank_mag_1 call phx_fnc_addGear};

// Attributes
if (player getVariable "phxLoadout" == "MED") then {player setVariable ["ace_medical_medicClass", 1, true]};
if (player getVariable "phxLoadout" in ["CE","CR","PI"]) then {player setVariable ["ace_isEngineer", 1, true]};



// load weapons
[] spawn {
	waitUntil {
		!isNil "phx_loadout_weaponMagazines" &&
		!isNil "phx_loadout_sidearmMagazines"
	};
	{
		_x params ["_weaponClass", "_mags"];
		private _cfgWeapon = _weaponClass call CBA_fnc_getItemConfig;

		// check for multiple muzzles (eg: GL)
		private _muzzles = getArray (configFile >> "cfgWeapons" >> _weaponClass >> "muzzles") select {!(["SAFE", _x] call BIS_fnc_inString)};
		
		{
			private _thisMuzzle = _x;
			private "_compatMag";
			if (_thisMuzzle == "this") then {
				_compatMag = ([_mags, _cfgWeapon, false] call fnc_getWeaponMagazines) select 0;
			} else {
				_compatMag = ([_mags, _cfgWeapon >> _thisMuzzle, false] call fnc_getWeaponMagazines) select 0;
			};
			_compatMag = _compatMag splitString ':' select 0;
			"debug_console" callExtension str([_weaponClass, _thisMuzzle, _compatMag]);

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
	player enableSimulation true;
};



// show hint
_fnc_hintDetails = {
	private _thisCfg = _this call CBA_fnc_getItemConfig;
	private _dispName = [_thisCfg] call BIS_fnc_displayName;
	private _desc = getText(_thisCfg >> "descriptionShort");
	private _pic = getText(_thisCfg >> "picture");

	_textArr = [
		format["<t align='center'><img size='3' image='%1'/>", _pic],
		format["<t size='1'>%1</t>", _dispName],
		_desc,
		"</t>"
	];
	// [_textArr joinString '<br/>', "success", 5] call phx_ui_fnc_notify;
	_textArr joinString '<br/>'
};

#define LOADOUTROLE(_str) (player getVariable ["phxLoadout", ""] isEqualTo _str)

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

private _notifyString = [];
_notifyString pushBack ("<t align='center' size='1.4' color='#e1701a' face='PuristaBold'>ROLE</t>");
_notifyString pushBack ("<t align='center' face='PuristaLight'>You are a" + _strRole + "<br/>in " + (roleDescription player splitString '@' select 1) + "</t>");
_notifyString pushBack ("<br/>");
_notifyString pushBack ("<t align='center' size='1.4' color='#e1701a' face='PuristaBold'>Primary Weapon</t>");
_notifyString pushBack (primaryWeapon player call _fnc_hintDetails);
// _notifyString pushBack ("<br/>");
_notifyString pushBack ("<t align='center' size='1.4' color='#e1701a' face='PuristaBold'>Handgun Weapon</t>");
_notifyString pushBack (handgunWeapon player call _fnc_hintDetails);
// _notifyString pushBack ("<br/>");

if (secondaryWeapon player != "") then {
	_notifyString pushBack ("<t align='center' size='14' color='#e1701a' face='PuristaBold'>Launcher</t>");
	_notifyString pushBack (secondaryWeapon player call _fnc_hintDetails)
};
[_notifyString joinString '<br/>'] call phx_ui_fnc_notify;



missionNamespace setVariable ["phx_loadoutAssigned",true];






// configProperties [missionConfigFile >> "CfgLoadoutWeapons" >> "west" >> "PL"];
// (missionConfigFile >> "CfgLoadoutWeapons" >> "west") call BIS_fnc_getCfgSubClasses;
// (missionConfigFile >> "CfgLoadoutWeapons" >> "west" >> "PL" >> "vest") call BIS_fnc_getCfgData;