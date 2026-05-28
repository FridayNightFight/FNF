/*
	Author: Mallen

	Description:
		Switches a selection from one option to another

	Parameter(s):
		0: OBJECT -	An array of items to switch to
		1: OBJECT -	The identifier of the selector

	Returns:
		None
*/

params["_hostModule", "_optionModule"];

_getOptionModuleItems = {
	params ["_optionModule"];
	_optionSyncedObjects = synchronizedObjects _optionModule;
	_result = [];

	{
		//check if object is not the host it should be attached to
		if (typeOf _x isEqualTo "fnf_module_selectorHost") then {continue;};

		_optionInventorySyncedObjects = synchronizedObjects _x;

		_partOfPersonalRearm = false;
		{
			if (typeOf _x isEqualTo "fnf_module_personalRearm") then
			{
				_partOfPersonalRearm = true;
				break;
			};
		} forEach _optionInventorySyncedObjects;

		if (_partOfPersonalRearm) then {continue;};


		//get the cargo etc in object and add it to the options player has for the selector
		_items = itemCargo _x;
		_magazines = magazineCargo _x;
		_weapons = weaponCargo _x;
		_backpacks = backpackCargo _x;
		_selectionItems = _items;
		_selectionItems append _magazines;
		_selectionItems append _weapons;
		_selectionItems append _backpacks;

		_result = _selectionItems;
	} forEach _optionSyncedObjects;
	_result;
};

_currentItems = "";

//if there is a selection made grab that info
_currentSelectionModule = _hostModule getVariable ["fnf_selection_" + (getPlayerUID player), "NONE"];
if (_currentSelectionModule isNotEqualTo "NONE") then
{
	_currentItems = [_currentSelectionModule] call _getOptionModuleItems;
};

_allItems = [_currentSelectionModule] call _getOptionModuleItems;

_selectorType = _hostModule getVariable ["fnf_selectorType", "FAILED"];
_displayName = _optionModule getVariable ["fnf_optionName", "Default Name"];

//if no selection has been made
if (_currentItems isEqualTo "") then
{
	_weaponAddAfter = "NONE";
	{
		//depending on item type do different things and add things
		switch (_selectorType) do {
			case "opt":
			{
				player addWeaponItem [primaryWeapon player, _x, true];
			};
			case "pri":
			{
				if (_x isKindOf ["Rifle", configFile >> "CfgWeapons"]) then
				{
					_weaponAddAfter = _x;
				} else {
					player addItem _x;
				};
			};
			case "sec":
			{
				if (_x isKindOf ["Launcher", configFile >> "CfgWeapons"]) then
				{
					_weaponAddAfter = _x;
				} else {
					if (_x isKindOf "Bag_Base") then
					{
						_loadout = getUnitLoadout player;
						_loadout select 5 select 1 pushBack [_x, true];
						player setUnitLoadout _loadout;
					} else {
						player addItem _x;
					};
				};
			};
			case "hnd":
			{
				if (_x isKindOf ["Pistol", configFile >> "CfgWeapons"]) then
				{
					_weaponAddAfter = _x;
				} else {
					player addItem _x;
				};
			};
			default
			{
				player addItem _x;
			};
		};
	} forEach _allitems;

	//add weapon after mags to ensure mag is put into weapon
	if (_weaponAddAfter isNotEqualTo "NONE") then
	{
		player addWeapon _weaponAddAfter
	};

	["<t size='1.5' align='center'>Switched to:<br/><br/>" + _displayName + "</t>", "info"] call FNF_ClientSide_fnc_notificationSystem;
	_hostModule setVariable ["fnf_selection_" + (getPlayerUID player), _optionModule, true];
} else {

	_hasRequiredItems = true;
	_itemsToAdd = [];
	_weaponToRemove = "NONE";
	_opticToRetain = "";
	//check if player can and has removed items needed
	{
		switch (_selectorType) do {
			case "opt":
			{
				if ((((primaryWeaponItems player) select 2) find _x) isNotEqualTo -1) then
				{
					player removePrimaryWeaponItem _x;
					//track which items have been removed so if things fail we can re-add them
					_itemsToAdd pushBack _x;
				} else {
					_hasRequiredItems = false;
				};
			};
			case "pri":
			{
				if (_x isKindOf ["Rifle", configFile >> "CfgWeapons"]) then
				{
					if ((primaryWeapon player isEqualTo _x) and (_weaponToRemove isEqualTo "NONE")) then
					{
						_weaponToRemove = _x;
						_opticToRetain = ((primaryWeaponItems player) select 2);
						_itemsToAdd pushBack _opticToRetain;
					} else {
						_hasRequiredItems = false;
					};
				} else {
					if ([player, _x] call BIS_fnc_hasItem) then
					{
						if (((primaryWeaponMagazine player) find _x) isNotEqualTo -1 or ((primaryWeaponItems player) find _x) isNotEqualTo -1) then
						{
							if (((primaryWeaponItems player) select 2) isEqualTo _x) then
							{
								_opticToRetain = "";
							};
							player removePrimaryWeaponItem _x;
						} else {
							player removeItem _x;
						};
						_itemsToAdd pushBack _x;
					} else {
						_hasRequiredItems = false;
					};
				};
			};
			case "sec":
			{
				if (_x isKindOf ["Launcher", configFile >> "CfgWeapons"]) then
				{
					if ((secondaryWeapon player isEqualTo _x) and (_weaponToRemove isEqualTo "NONE")) then
					{
						_weaponToRemove = _x;
					} else {
						_hasRequiredItems = false;
					};
				} else {
					if ([player, _x] call BIS_fnc_hasItem) then
					{
						if (((secondaryWeaponMagazine player) find _x) isNotEqualTo -1) then
						{
							player removeSecondaryWeaponItem _x;
						} else {
							player removeItem _x;
						};
						_itemsToAdd pushBack _x;
					} else {
						_hasRequiredItems = false;
					};
				};
			};
			case "hnd":
			{
				if (_x isKindOf ["Pistol", configFile >> "CfgWeapons"]) then
				{
					if ((handgunWeapon player isEqualTo _x) and (_weaponToRemove isEqualTo "NONE")) then
					{
						_weaponToRemove = _x;
					} else {
						_hasRequiredItems = false;
					};
				} else {
					if ([player, _x] call BIS_fnc_hasItem) then
					{
						if (((handgunMagazine player) find _x) isNotEqualTo -1) then
						{
							player removeHandgunItem _x;
						} else {
							player removeItem _x;
						};
						_itemsToAdd pushBack _x;
					} else {
						_hasRequiredItems = false;
					};
				};
			};
			default
			{
				if ([player, _x] call BIS_fnc_hasItem) then
				{
					if (binocular player isEqualTo _x) then
					{
						player removeWeapon _x;
					} else {
						player removeItem _x;
					};
					_itemsToAdd pushBack _x;
				} else {
					_hasRequiredItems = false;
				};
			};
		};
	} forEach _currentItems;

	if (_weaponToRemove isNotEqualTo "NONE") then
	{
		player removeWeapon _weaponToRemove;
		_itemsToAdd pushBack _weaponToRemove;
	};

	//check if player had all the items needed to switch, if so add new items to add
	if (_hasRequiredItems) then
	{
		_itemsToAdd = _allItems;
		if (_opticToRetain isNotEqualTo "") then
		{
			_itemsToAdd pushBack _opticToRetain;
		};
		_hostModule setVariable ["fnf_selection_" + (getPlayerUID player), _optionModule, true];
		["<t size='1.5' align='center'>Switched to:<br/><br/>" + _displayName + "</t>", "info"] call FNF_ClientSide_fnc_notificationSystem;
	} else {
		["<t size='1.5' align='center'>Failed to switch selection, you do not have the items to switch out</t>", "error"] call FNF_ClientSide_fnc_notificationSystem;
	};

	//add either current items or items previously removed to complete selection
	_weaponAddAfter = "NONE";
	_weaponOptionsAddAfter = [];
	{
		switch (_selectorType) do {
			case "opt":
			{
				player addPrimaryWeaponItem _x;
			};
			case "pri":
			{
				if (_x isKindOf ["Rifle", configFile >> "CfgWeapons"]) then
				{
					_weaponAddAfter = _x;
				} else {
					_itemType = getNumber(configFile >> "CfgWeapons" >> _x >> "itemInfo" >> "type");
					if (_itemType isEqualTo 201 or _itemType isEqualTo 101) then
					{
						_weaponOptionsAddAfter pushBack _x;
					} else {
						player addItem _x;
					};
				};
			};
			case "sec":
			{
				if (_x isKindOf ["Launcher", configFile >> "CfgWeapons"]) then
				{
					_weaponAddAfter = _x;
				} else {
					if (_x isKindOf "Bag_Base") then
					{
						_loadout = getUnitLoadout player;
						_loadout select 5 select 1 pushBack [_x, true];
						player setUnitLoadout _loadout;
					} else {
						player addItem _x;
					};
				};
			};
			case "hnd":
			{
				if (_x isKindOf ["Pistol", configFile >> "CfgWeapons"]) then
				{
					_weaponAddAfter = _x;
				} else {
					player addItem _x;
				};
			};
			default
			{
				player addItem _x;
			};
		};
	} forEach _itemsToAdd;

	if (_weaponAddAfter isNotEqualTo "NONE") then
	{
		player addWeapon _weaponAddAfter;
		if (_weaponOptionsAddAfter isNotEqualTo []) then
		{
			{
				player addPrimaryWeaponItem _x;
			} forEach _weaponOptionsAddAfter;
		};
	};
};
