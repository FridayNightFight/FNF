/*
	Author: Mallen

	Description:
		Sets up the breifing for the mission

	Parameter(s):
		0: ARRAY -	An array of all breifing asset modules
		1: MODULE -	The init module for use with breifing notes etc

	Returns:
		None
*/

params["_assetModules", "_kitInfoModules", "_initModule"];

_bluforPresent = false;
_opforPresent = false;
_indforPresent = false;

_objectsToAddToDiary = [];

//for each breifing asset modules
{
	_syncedObjects = synchronizedObjects _x;
	_objectsToDisplay = [];

	_moduleSide = sideEmpty;

	//for each object synced to the module
	{
		//check if object is a side object, if it is set the module's side
		//TODO: add check for multiple side objects per module
		_objectType = typeOf _x;
		switch (_objectType) do
		{
			case "SideBLUFOR_F":
			{
				_moduleSide = west;
			};
			case "SideOPFOR_F":
			{
				_moduleSide = east;
			};
			case "SideResistance_F":
			{
				_moduleSide = independent;
			};
			default
			{
				//if not a side object its hopefully an object to show in the breifing assets
				//TODO: check if object is a vehicle and should be shown or if its just a random object
				_objectsToDisplay pushBack _x;
			};
		};
	} forEach _syncedObjects;

	//TODO: comment rest of this / redo it as some things not working
	_alreadyAdding = -1;
	{
		if (_x select 0 isEqualTo _moduleSide) then
		{
			_alreadyAdding = _forEachIndex;
		}
	} forEach _objectsToAddToDiary;

	if (_alreadyAdding isEqualTo -1) then
	{
		_toAdd = [_moduleSide, []];
		{
			(_toAdd select 1) pushBack _x;
		} forEach _objectsToDisplay;
		_objectsToAddToDiary pushBack _toAdd;
	} else {
		{
			(_objectsToAddToDiary select _alreadyAdding select 1) pushBack _x;
		} forEach _objectsToDisplay;
	};
} forEach _assetModules;

_loadoutCreation = {
	params["_side", "_kitInfoModules"];
	_helmets = [];
	_uniforms = [];
	_vests = [];
	_kitName = "Unknown Kit";
	_kitAuthor = "Unknown Author";

	{
		_module = _x;
		_syncedObjects = synchronizedObjects _x;
		_modSide = sideEmpty;
		_sideCounter = 0;
		{
			_objectType = typeOf _x;
			_modSide = sideEmpty;

			switch (_objectType) do
			{
				case "SideBLUFOR_F":
				{
					_modSide = west;
				};
				case "SideOPFOR_F":
				{
					_modSide = east;
				};
				case "SideResistance_F":
				{
					_modSide = independent;
				};
				default
				{
					continue;
				};
			};

			_sideCounter = _sideCounter + 1;

			if (_modSide isEqualTo _side) then
			{
				_kitName = _module getVariable ["fnf_kitName", "Unknown Kit"];
				_kitAuthor = _module getVariable ["fnf_kitAuthor", "Unknown Author"];
			};
		} forEach _syncedObjects;

		if (_sideCounter isEqualTo 0) then
		{
			if (fnf_debug) then
			{
				systemChat "WARNING: Kit information has no valid side synced to it, Kit information will not be displayed";
			};
			continue;
		};
		if (_sideCounter > 1) then
		{
			if (fnf_debug) then
			{
				systemChat "WARNING: Kit information has more than one side synced to it, Kit information may be inaccurate on all kits";
			};
			continue;
		};

	} forEach _kitInfoModules;

	_playersToRead = [];

	_sidePlayerCount = _side countSide (call BIS_fnc_listPlayers);

	if (_sidePlayerCount > 2) then
	{
		_ran1 = round (random (_sidePlayerCount - 1));
		_ran2 = round (random (_sidePlayerCount - 1));
		_ran3 = round (random (_sidePlayerCount - 1));
		_playersToRead pushBack (((call BIS_fnc_listPlayers) select {(side _x isEqualTo _side)}) select _ran1);
		_playersToRead pushBack (((call BIS_fnc_listPlayers) select {(side _x isEqualTo _side)}) select _ran2);
		_playersToRead pushBack (((call BIS_fnc_listPlayers) select {(side _x isEqualTo _side)}) select _ran3);
	} else {
		_ran1 = round (random (_sidePlayerCount - 1));
		_playersToRead pushBack (((call BIS_fnc_listPlayers) select {(side _x isEqualTo _side)}) select _ran1);
	};

	{
		if (headgear _x isNotEqualTo "") then
		{
			_helmetCfg = (headgear _x) call CBA_fnc_getItemConfig;
			_helmetpic = (_helmetCfg >> "picture") call BIS_fnc_getCfgData;
			_helmets pushBack _helmetpic;
		} else {
			_helmets pushBack "";
		};

		if (uniform _x isNotEqualTo "") then
		{
			_uniformCfg = (uniform _x) call CBA_fnc_getItemConfig;
			_uniformpic = (_uniformCfg >> "picture") call BIS_fnc_getCfgData;
			_uniforms pushBack _uniformpic;
		} else {
			_uniforms pushBack "";
		};

		if (vest _x isNotEqualTo "") then
		{
			_vestCfg = (vest _x) call CBA_fnc_getItemConfig;
			_vestpic = (_vestCfg >> "picture") call BIS_fnc_getCfgData;
			_vests pushBack _vestpic;
		} else {
			_vests pushBack "";
		};
	} forEach _playersToRead;

	_weaponsFound = [];
	{
		_primary = primaryWeapon _x;
		_launcher = secondaryWeapon _x;
		_primaryWeaponFound = false;
		_launcherWeaponFound = false;
		{
			if (_x isEqualTo _primary) then
			{
				_primaryWeaponFound = true;
				continue;
			};
			if (_x isEqualTo _launcher) then
			{
				_launcherWeaponFound = true;
			};
		} foreach _weaponsFound;

		if (not _primaryWeaponFound) then
		{
			_weaponsFound pushBack _primary;
		};
		if (not _launcherWeaponFound) then
		{
			_weaponsFound pushBack _launcher;
		};
	} forEach ((call BIS_fnc_listPlayers) select {(side _x isEqualTo _side)});

	_weaponPics = [];
	{
		_weaponCfg = _x call CBA_fnc_getItemConfig;
		_weaponPic = (_weaponCfg >> "picture") call BIS_fnc_getCfgData;
		_weaponPics pushBack _weaponPic
	} forEach _weaponsFound;

	_string = [format["<font size='20' shadow='1' face='PuristaBold'>%1</font><br/><font size='18' shadow='1' face='PuristaBold'>%2</font><br/><font size='18' shadow='1' color='#FF8E38' face='PuristaBold'>Uniform:</font><br/>", _kitName, _kitAuthor]];
	{
		_string pushBack ("<img width='110' image='" + _x + "'/>");
	} forEach _helmets;
	_string pushBack "<br/>";
	{
		_string pushBack ("<img width='110' image='" + _x + "'/>");
	} forEach _vests;
	_string pushBack "<br/>";
	{
		_string pushBack ("<img width='110' image='" + _x + "'/>");
	} forEach _uniforms;
	_string pushBack "<br/>";

	_string pushBack "<font size='18' shadow='1' color='#FF8E38' face='PuristaBold'>Weapons:</font><br/>";
	{
		_string pushBack ("<img width='220' image='" + _x + "'/><br/>");
	} forEach _weaponPics;

	_stringJoined = _string joinString "";

	switch (_side) do {
		case west:
		{
			player createDiaryRecord ["blufor", ["Loadout",_stringJoined], taskNull, "", True];
		};
		case east:
		{
			player createDiaryRecord ["opfor", ["Loadout",_stringJoined], taskNull, "", True];
		};
		case independent:
		{
			player createDiaryRecord ["indfor", ["Loadout",_stringJoined], taskNull, "", True];
		};
		default { };
	};
};

_assetString = {
	//amount, object type, object itself
	params["_objectToBaseOffOf"];
	_objType = typeOf _objectToBaseOffOf;

	_thisCfg = _objType call CBA_fnc_getObjectConfig;
	_dispName = [_thisCfg] call BIS_fnc_displayName;
	_desc = getText(_thisCfg >> "descriptionShort");
	_pic = [_thisCfg >> "editorPreview", "STRING", "\A3\EditorPreviews_F\Data\CfgVehicles\Box_FIA_Ammo_F.jpg"] call CBA_fnc_getConfigEntry;

	_string = [(format["<font size='20' shadow='1' color='#FF8E38' face='PuristaBold'>%1</font><br/><img width='330' image='%2'/><br/><br/>", _dispName, _pic])];

	_totalSeats = [_objType, true] call BIS_fnc_crewCount; // Number of total seats: crew + non-FFV cargo/passengers + FFV cargo/passengers
	_crewSeats = [_objType, false] call BIS_fnc_crewCount; // Number of crew seats only
	_canFloat = (_thisCfg >> "canFloat") call BIS_fnc_getCfgDataBool;
	if (_totalSeats isNotEqualTo 0) then
	{
		_string pushBack "<font size='18' shadow='1' color='#FF8E38' face='PuristaBold'>Stats</font><br/>";
		_string pushBack ("	Capacity: " + str(_totalSeats) + "<br/>");
		_string pushBack ("	Crew: " + str(_crewSeats) + "<br/>");
		_string pushBack ("	Can it float: " + str(_canFloat) + "<br/><br/>");
	};

	_allTurrets = allTurrets _objectToBaseOffOf;

	if (_allTurrets isNotEqualTo []) then
	{
		_turretNameAndPaths = [[[-1], "Driver"]];
		{
			_currentConfig = (_thisCfg);
			{
				_currentConfig = (_currentConfig >> "Turrets") select _x;
			} forEach _x;
			_name = getText(_currentConfig >> "gunnerName");
			_turretNameAndPaths pushBack [_x, _name];
		} forEach _allTurrets;

		_string pushBack "<font size='18' shadow='1' color='#FF8E38' face='PuristaBold'>Weapons</font>";
		_cfgMagazineWells = configFile >> "CfgMagazineWells";

		{
			_turretPath = _x select 0;
			_currentTurretWeaponTurrets = _objectToBaseOffOf weaponsTurret _turretPath;
			_magNames = _objectToBaseOffOf magazinesTurret [_turretPath, false];
			_magNamesAndAmounts = [];


			{
				_mag = _x;
				_index = _magNamesAndAmounts findIf {_x select 0 isEqualTo _mag;};
				if (_index isNotEqualTo -1) then
				{
					(_magNamesAndAmounts select _index) set [1, (_magNamesAndAmounts select _index select 1) + 1];
				} else {
					_magNamesAndAmounts pushBack [_x, 1];
				};
			} forEach _magNames;



			if (count _currentTurretWeaponTurrets isNotEqualTo 0) then
			{
				_string pushBack ("<br/><font size='14' shadow='1' color='#E0701B' face='PuristaBold'>" + (_x select 1) + "</font><br/>");
				{
					_weaponConfig = [_x] call CBA_fnc_getItemConfig;
					_string pushBack ("	" + ([_weaponConfig] call BIS_fnc_displayName) + "<br/>");
					_possibleMagazines = [_weaponConfig] call CBA_fnc_compatibleMagazines;

					{
						_magName = _x select 0;
						_amount = _x select 1;
						if (_magName in _possibleMagazines) then{
							_magConfig = [_magName] call CBA_fnc_getItemConfig;
							_string pushBack (format["		%1 (%2x %3 Rounds )<br/>", [_magConfig] call BIS_fnc_displayName, _amount, _objectToBaseOffOf magazineTurretAmmo [_magName, _turretPath]]);
						};
					} forEach _magNamesAndAmounts;

					_string pushBack "<br/>";
				} forEach _currentTurretWeaponTurrets;
			};
		} forEach _turretNameAndPaths;
	};

	_items = itemCargo _objectToBaseOffOf;
	_magazines = magazineCargo _objectToBaseOffOf;
	_weapons = weaponCargo _objectToBaseOffOf;
	_backpacks = backpackCargo _objectToBaseOffOf;
	_cargo = _items;
	_cargo append _magazines;
	_cargo append _weapons;
	_cargo append _backpacks;

	if (_objectToBaseOffOf isKindOf "AllVehicles" and _objectToBaseOffOf getVariable ["fnf_clearInventory", true]) then
	{
		_cargo = [];
	};

	if (_cargo isNotEqualTo []) then
	{
		//["",0]
		_shortenedCargo = [];
		{
			_itemToFind = _x;
			_index = _shortenedCargo findif {_x select 1 isEqualTo _itemToFind};
			if (_index isNotEqualTo -1) then
			{
				(_shortenedCargo select _index) set [0, (_shortenedCargo select _index select 0) + 1]
			} else {
				_shortenedCargo pushBack [1, _x];
			};
		} forEach _cargo;

		_shortenedCargo sort true;

		_string pushBack "<font size='18' shadow='1' color='#FF8E38' face='PuristaBold'>Inventory</font><br/>";
		_justBreaked = false;
		{
			_justBreaked = false;
			_displayName = getText (configFile >> "CfgMagazines" >> (_x select 1) >> "displayName");
			_tempPic = getText (configFile >> "CfgMagazines" >> (_x select 1) >> "picture");
			if (_tempPic isEqualTo "") then
			{
				_displayName = getText (configFile >> "CfgWeapons" >> (_x select 1) >> "displayName");
				_tempPic = getText (configFile >> "CfgWeapons" >> (_x select 1) >> "picture");
				if (_tempPic isEqualTo "") then
				{
					_displayName = getText (configFile >> "CfgVehicles" >> (_x select 1) >> "displayName");
					_tempPic = getText (configFile >> "CfgVehicles" >> (_x select 1) >> "picture");
					if (_tempPic isEqualTo "") then
					{
						_displayName = getText (configFile >> "CfgAmmo" >> (_x select 1) >> "displayName");
						_tempPic = getText (configFile >> "CfgAmmo" >> (_x select 1) >> "picture");
					};
				};
			};

			_string pushBack (format["<font size='32'>[</font>%1x<img src='%2' width='32' height='32' title='%3' /><font size='32'>]</font>", _x select 0, _tempPic, _displayName]);

			if (((_forEachIndex + 1) % 5) isEqualTo 0) then
			{
				_string pushBack "<br/>";
				_justBreaked = true;
			};
		} forEach _shortenedCargo;
		if (_justBreaked) then
		{
			_string pushBack "<br/>";
		} else {
			_string pushBack "<br/><br/>";
		};
	};

	_string joinString "";
};

_assetCreation = {
	params["_side","_objectsToAdd","_index","_assetString"];
	_itemsToAdd = _objectsToAdd select _index select 1;

	_compactedObjects = [];
	{
		_objectType = typeOf _x;
		_alreadyAdded = -1;
		{
			if (_x select 1 isEqualTo _objectType) then
			{
				_alreadyAdded = _forEachIndex;
				break;
			};
		} forEach _compactedObjects;

		if (_alreadyAdded isEqualTo -1) then
		{
			_compactedObjects pushBack [1, _objectType, _x];
		} else {
			_currentAmount = _compactedObjects select _alreadyAdded select 0;
			_compactedObjects select _alreadyAdded set [0, _currentAmount + 1];
		};
	} forEach _itemsToAdd;

	{
		_string = [_x select 2] call _assetString;
		_thisCfg = (_x select 1) call CBA_fnc_getObjectConfig;
		_dispName = [_thisCfg] call BIS_fnc_displayName;

		switch (_side) do {
			case west:
			{
				player createDiaryRecord ["blufor", [str(_x select 0) + "x " + _dispName,_string], taskNull, "", True];
			};
			case east:
			{
				player createDiaryRecord ["opfor", [str(_x select 0) + "x " + _dispName,_string], taskNull, "", True];
			};
			case independent:
			{
				player createDiaryRecord ["indfor", [str(_x select 0) + "x " + _dispName,_string], taskNull, "", True];
			};
			default { };
		};
	} forEach _compactedObjects;
};

if (playableSlotsNumber blufor > 0) then
{
	_objectsToAdd = -1;
	{
		if (_x select 0 isEqualTo west) then
		{
			_objectsToAdd = _forEachIndex;
		}
	} forEach _objectsToAddToDiary;

	if (_objectsToAdd isNotEqualTo -1) then
	{
		player createDiarySubject ["blufor", "Blufor", "\A3\Data_F\Flags\flag_blue_CO.paa"];
		[west, _objectsToAddToDiary, _objectsToAdd, _assetString] call _assetCreation;
		[{blufor countSide (call BIS_fnc_listPlayers) > ((playersNumber blufor) / 2)},{
			[west, (_this select 1)] call (_this select 0);
		}, [_loadoutCreation, _kitInfoModules]] call CBA_fnc_waitUntilAndExecute
	} else {
		[{blufor countSide (call BIS_fnc_listPlayers) > ((playersNumber blufor) / 2)},{
			player createDiarySubject ["blufor", "Blufor", "\A3\Data_F\Flags\flag_blue_CO.paa"];
			[west, (_this select 1)] call (_this select 0);
		}, [_loadoutCreation, _kitInfoModules]] call CBA_fnc_waitUntilAndExecute
	};
};

if (playableSlotsNumber opfor > 0) then
{
	_objectsToAdd = -1;
	{
		if (_x select 0 isEqualTo east) then
		{
			_objectsToAdd = _forEachIndex;
		}
	} forEach _objectsToAddToDiary;

	if (_objectsToAdd isNotEqualTo -1) then
	{
		player createDiarySubject ["opfor", "Opfor", "\A3\Data_F\Flags\flag_red_CO.paa"];
		[east, _objectsToAddToDiary, _objectsToAdd, _assetString] call _assetCreation;
		[{east countSide (call BIS_fnc_listPlayers) > ((playersNumber opfor) / 2)},{
			[east, (_this select 1)] call (_this select 0);
		}, [_loadoutCreation, _kitInfoModules]] call CBA_fnc_waitUntilAndExecute
	} else {
		[{east countSide (call BIS_fnc_listPlayers) > ((playersNumber opfor) / 2)},{
			player createDiarySubject ["opfor", "Opfor", "\A3\Data_F\Flags\flag_red_CO.paa"];
			[east, (_this select 1)] call (_this select 0);
		}, [_loadoutCreation, _kitInfoModules]] call CBA_fnc_waitUntilAndExecute
	};
};

if (playableSlotsNumber independent > 0) then
{
	_objectsToAdd = -1;
	{
		if (_x select 0 isEqualTo independent) then
		{
			_objectsToAdd = _forEachIndex;
		}
	} forEach _objectsToAddToDiary;

	if (_objectsToAdd isNotEqualTo -1) then
	{
		player createDiarySubject ["indfor", "Independent", "\A3\Data_F\Flags\flag_green_CO.paa"];
		[independent, _objectsToAddToDiary, _objectsToAdd, _assetString] call _assetCreation;
		[{independent countSide (call BIS_fnc_listPlayers) > ((playersNumber independent) / 2)},{
			[independent, (_this select 1)] call (_this select 0);
		}, [_loadoutCreation, _kitInfoModules]] call CBA_fnc_waitUntilAndExecute
	} else {
		[{independent countSide (call BIS_fnc_listPlayers) > ((playersNumber independent) / 2)},{
			player createDiarySubject ["indfor", "Independent", "\A3\Data_F\Flags\flag_green_CO.paa"];
			[independent, (_this select 1)] call (_this select 0);
		}, [_loadoutCreation, _kitInfoModules]] call CBA_fnc_waitUntilAndExecute
	};
};

_rules = _initModule getVariable ["fnf_breifingRules", ""];
_ao = _initModule getVariable ["fnf_breifingAO", ""];
_background = _initModule getVariable ["fnf_breifingBackground", ""];
_notes = _initModule getVariable ["fnf_breifingNotes", ""];

_viewDistance = _initModule getVariable ["fnf_viewDistance", 800];
_fortifyPoints = _initModule getVariable ["fnf_fortifyPoints", 0];
_fortifyColour = _initModule getVariable ["fnf_fortifyColour", "Green"];
_timeLimit = _initModule getVariable ["fnf_gameTime", 65];

if (_rules isNotEqualTo "") then
{
	player createDiaryRecord ["Diary", ["Mission Rules",_rules], taskNull, "", True];
};
if (_ao isNotEqualTo "") then
{
	player createDiaryRecord ["Diary", ["Area of Operations",_ao], taskNull, "", True];
};
if (_background isNotEqualTo "") then
{
	player createDiaryRecord ["Diary", ["Background",_background], taskNull, "", True];
};
if (_notes isNotEqualTo "") then
{
	player createDiaryRecord ["Diary", ["Notes",_notes], taskNull, "", True];
};
player createDiaryRecord ["Diary", ["Mission Details","View Distance: " + str(_viewDistance) + "m<br/>Fortify Points: " + str(_fortifyPoints) + "<br/>Fortify Colour: " + _fortifyColour + "<br/>Time Limit: " + str(_timeLimit) + " Minutes"], taskNull, "", True];

player createDiarySubject ["rules", "FNF Info", "\A3\ui_f\data\igui\cfg\simpleTasks\types\documents_ca.paa"];

_allMods = call FNF_ClientSide_fnc_findFNFModules;
_initModule = [_allMods, "init"] call FNF_ClientSide_fnc_findSpecificModules;
_initModule = _initModule select 0;
_reinsertTotal = (_initModule getVariable ["fnf_timeToDisableReinsertsAfterSafeStart", 20]);
_szMods = [_allMods, "safeZone"] call FNF_ClientSide_fnc_findSpecificModules;
_maxSafeStart = 0;
{
	_t = _x getVariable ["fnf_timeZoneIsDeleted", 0];
	if (_t > _maxSafeStart) then { _maxSafeStart = _t; };
} forEach _szMods;
_actualReinsertWindow = _reinsertTotal - _maxSafeStart;

player createDiaryRecord ["rules", ["Contacting Staff",
	"If you have an issue that needs to be addressed, whether you've been arma'd, flipped a vehicle, something broke, someone is breaking the rules, or need a rule clarification, Staff are here to help you.<br/><br/>" +
	"<font face='PuristaBold'>How It Works</font><br/>" +
	"When you press escape you will see a button which allows you to contact staff, a pop-up box will come up allowing you to write a message for staff to see, please explain your issue as well as you can for a swift response.<br/><br/>" +
	"Sometimes the staff member on duty may be addressing another issue when you put in your request, please have some patience and we will get to you when we are able to.<br/><br/>" +
	"If the issue is urgent you can press the Zues button to get our attention quicker, even though there is no notification on your end the staff member on duty has been alerted, however if this is abused for non-urgent issues repeatedly you may be kicked from the current mission, by default this button is bound to 'Y'."
], taskNull, "", True];

player createDiaryRecord ["rules", ["Reinsert",
	"The Reinsert mechanic allows dead squad members to return to the fight via helicopter fast-rope.<br/><br/>" +
	"<font face='PuristaBold'>How It Works</font><br/>" +
	"The Squad Leader spawns with a reinsert flare in their backpack. To call a reinsert, equip it in your pistol slot and fire it. The flare's landing position (tracked 2 seconds after firing) is where the squad will be inserted - aim carefully. A helicopter will fly in, fast-rope up to 4 dead squad mates to the ground, then depart.<br/><br/>" +
	"<font face='PuristaBold'>Rules</font><br/>" +
	"- Anyone in the squad may use it.<br/>" +
	"- Each squad gets ONE reinsert - use it wisely.<br/>" +
	"- Up to 4 players are reinserted in the order they died.<br/>" +
	"- The reinsert window is open for " + str(_actualReinsertWindow) + " minutes after safe zones drop. Once it closes, reinsertion is no longer available for the rest of the mission.<br/>" +
	"- The reinsert flare must be equipped in the pistol slot before firing.<br/><br/>" +
	"<font face='PuristaBold'>When You Die</font><br/>" +
	"You will enter limited spectator mode. Stay alert - your SL may call a reinsert at any time. If the window expires or the reinsert has already been called and you were not among the first 4, you will be moved to full spectator for the rest of the mission."
], taskNull, "", True];

player createDiaryRecord ["rules", ["Selectors",
	"Selectors allow you to customise your loadout before the mission.<br/><br/>" +
	"<font face='PuristaBold'>How It Works</font><br/>" +
	"if you have a selector in your current role ACE self-interacting will show an option named FNF Selectors, when hovered over this will show all the selectors assigned to you that you can pick between. You can switch between options as much as you like as long as you are still in safe start, once safe start has ended you will no longer be able to chaqnge your selection.<br/><br/>" +
	"Importantly, to switch your selection you must still have the item you previously selected in your inventory, if you drop the item or give it away your will not be able to change your selection until you get the required items back."
], taskNull, "", True];

player createDiaryRecord ["rules", ["Teleporters",
	"During safe start, or throughout the mission, teleporters can help move you between safe zones or around the map.<br/><br/>" +
	"<font face='PuristaBold'>How It Works</font><br/>" +
	"Teleporters are generally the bright blue arrows often found during safe start, they are marked on the map so you know where all of them are and can teleport between them as much as you want.<br/><br/>" +
	"To teleport, approach the teleporter and ACE interact with it, this will show every teleporter this one is connected to, when you have decided which one you want to go to release your interact key while hovering over the option you want and you will be teleported to that teleporter.<br/><br/>" +
	"Teleporters are only available for a limited time, usually the duration of safe start, once that timer has run out they will dissappear and can no longer be teleported between."
], taskNull, "", True];

player createDiaryRecord ["rules", ["Backpack Locking",
	"Backpack locking stops pesky teammates from stealing items in your backpack against your will.<br/><br/>" +
	"<font face='PuristaBold'>How It Works</font><br/>" +
	"By default your backpack is automatically locked when you spawn meaning no one can open it, to unlock your backpack ACE self-interact and choose the option named Unlock Backpack, to lock it again choose the Lock Backpack option instead.<br/><br/>" +
	"Your Backpack is automatically unloacked when safe start ends with no option to lock it again"
], taskNull, "", True];

player createDiaryRecord ["rules", ["Play Zone",
	"The play zone restricts where players can move during the mission.<br/><br/>" +
	"<font face='PuristaBold'>How It Works</font><br/>" +
	"The play zone is the unshaded area surrounded by the shaded limit of the play zone, players and ground vehicles are not able to exit the play zone and are teleported back in if you try to leave.<br/><br/>" +
	"The only exception to this is aircraft who are excempt from this and are able to fly outside the play zone at will. However, if players exit the aircraft while outside the play zone they will automatically be teleported to the last point when they were inside the play zone, which may be very far from where the aircraft landed, and will likely be in mid-air."
], taskNull, "", True];

player createDiaryRecord ["rules", ["Safe Start",
	"Safe start allows players to create a plan of attack, choose their loadout, and get into position before the game starts.<br/><br/>" +
	"<font face='PuristaBold'>How It Works</font><br/>" +
	"At the start of each FNF mission there is a safe start, this usually lasts for 15 minutes but can be lower or higher, you can check the remaining safe start by opening your map and looking at the timer in the bottom left corner.<br/><br/>" +
	"During safe start you are automatically limited to Safe Zones which are marked on the map, if you try to exit the safe zone you will be teleported back inside whether you are on foot or in a vehicle.<br/><br/>" +
	"While in safe start you, or any vehicle assigned to your side, are not able to be damaged in any way, cannot fire your gun, and cannot throw grenades. dispite this laid mines or explosive charges can still be set off allowing for tactical building destruction.<br/><br/>" +
	"A warning is given when there is only 5 minutes left in safe start. once safe start has ended all protections and limitations are lifted and the mission can commence."
], taskNull, "", True];

player createDiaryRecord ["rules", ["In-Game Rules",
	"<font face='PuristaBold'>In-Game Rules</font><br/><br/>" +
	"A. Avoid roles you are not comfortable or familiar with.<br/>" +
	"B. Ensure your squad has a leader with a long range radio on company frequency.<br/>" +
	"C. Follow the chain of command - lone-wolfing is prohibited.<br/>" +
	"D. Using any vehicle as a weapon to ram other vehicles is prohibited.<br/>" +
	"E. Using any vehicle to ram infantry (except as last resort) is prohibited.<br/>" +
	"F. VBIEDs and suicide-bombing are prohibited.<br/>" +
	"G. Intentional team killing is prohibited.<br/>" +
	"H. Do not pick up enemy Helmets, Vests, Backpacks, or Uniforms.<br/>" +
	"I. Using fortify/entrenchment to block entrances or paths is prohibited.<br/>" +
	"J. Using enhanced movement to climb on plant life taller than a person is prohibited.<br/>" +
	"K. Using any out-of-game platform to send/receive game-related information is prohibited.<br/>" +
	"L. Use of in-game text chat is prohibited.<br/>" +
	"M. Hacking or abuse of glitches is prohibited."
], taskNull, "", True];

player createDiaryRecord ["rules", ["General Rules",
	"<font face='PuristaBold'>General Rules</font><br/><br/>" +
	"A. Be respectful to everyone.<br/>" +
	"B. Topics on politics and religion are prohibited.<br/>" +
	"C. Racial slurs and hate speech are prohibited.<br/>" +
	"D. Any form of NSFW or risqué content is prohibited.<br/>" +
	"E. English is required for all public communication.<br/>" +
	"F. Any form of spam is prohibited (microphone, text, image, soundboard).<br/>" +
	"G. Use common sense - don't be a jerk, if asked to stop then stop."
], taskNull, "", True];
