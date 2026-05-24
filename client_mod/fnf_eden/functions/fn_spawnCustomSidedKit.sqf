/*
	Author: Mallen

	Description:
		Gets a list of current kits, allows player to change the side of the kit to what is needed

	Parameter(s):
		None

	Returns:
		None
*/

fnf_customSidedKitDisplay = [((findDisplay 313) createDisplay "RscDisplayEmpty")];

_background = (fnf_customSidedKitDisplay select 0) ctrlCreate ["IGUIBack", -1];
_background ctrlSetPosition [0.25,0,0.5,0.8];
_background ctrlSetBackgroundColor [0,0,0,0.5];
_background ctrlCommit 0;

_kitSearch = (fnf_customSidedKitDisplay select 0) ctrlCreate[ "ctrlEdit", 10025 ];
_kitSearch ctrlSetPosition[ 0.2625, 0.0125, 0.48125, 0.05 ];
_kitSearch ctrlSetText "Search...";
_kitSearch ctrlCommit 0;

_kitList = (fnf_customSidedKitDisplay select 0) ctrlCreate[ "ctrlListbox", 10000 ];
_kitList ctrlSetPosition[ 0.2625, 0.0750, 0.48125, 0.41875 ];
_kitList ctrlCommit 0;

fnf_allFNFCompositions = "getText (_x >> 'editorCategory') == 'fnf_Kits'" configClasses (configfile >> "Cfg3DEN" >> "Compositions");
fnf_bluforComps = fnf_allFNFCompositions select {getText (_x >> 'editorSubcategory') == 'fnf_Blufor'};
fnf_opforComps = fnf_allFNFCompositions select {getText (_x >> 'editorSubcategory') == 'fnf_Opfor'};
fnf_indiComps = fnf_allFNFCompositions select {getText (_x >> 'editorSubcategory') == 'fnf_Indfor'};

_kitList lbAdd "===BLUFOR===";
{
	_name = getText (_x >> 'displayName');
	_index = _kitList lbAdd _name;
	_kitList lbSetData [_index, _name];
} forEach fnf_bluforComps;
_kitList lbAdd "===OPFOR===";
{
	_name = getText (_x >> 'displayName');
	_index = _kitList lbAdd _name;
	_kitList lbSetData [_index, _name];
} forEach fnf_opforComps;
_kitList lbAdd "===INDEPENDENT===";
{
	_name = getText (_x >> 'displayName');
	_index = _kitList lbAdd _name;
	_kitList lbSetData [_index, _name];
} forEach fnf_indiComps;
_kitList lbSetCurSel 0;

_createKitButton = (fnf_customSidedKitDisplay select 0) ctrlCreate[ "ctrlButton", 10008 ];
_createKitButton ctrlSetPosition[ 0.2625, 0.7375, 0.48125, 0.05 ];
_createKitButton ctrlCommit 0;
_createKitButton ctrlSetText "Create Kit";

_sideSelectionCombo = (fnf_customSidedKitDisplay select 0) ctrlCreate[ "ctrlCombo", 10007 ];
_sideSelectionCombo ctrlSetPosition[ 0.2625, 0.55, 0.48125, 0.05 ];
_sideSelectionCombo ctrlCommit 0;
_index = _sideSelectionCombo lbAdd "Blufor";
_sideSelectionCombo lbSetData [_index, "blufor"];
_index = _sideSelectionCombo lbAdd "Opfor";
_sideSelectionCombo lbSetData [_index, "opfor"];
_index = _sideSelectionCombo lbAdd "Indfor";
_sideSelectionCombo lbSetData [_index, "indfor"];

_createKitButton ctrlAddEventHandler[ "ButtonClick", {
	params[ "_createKitButton" ];

	_display = ctrlParent _createKitButton;

	_kitList = ctrlParent _createKitButton displayCtrl 10000;
	_selectedIndex = lbCurSel _kitList;
	_displayName = _kitList lbData _selectedIndex;

	_kitChosen = (fnf_allFNFCompositions select {getText (_x >> 'displayName') == _displayName}) select 0;

	_sideSelection = ctrlParent _createKitButton displayCtrl 10007;
	_selectedIndex = lbCurSel _sideSelection;
	_side = _sideSelection lbData _selectedIndex;

	_sideInternal = sideUnknown;
	switch (_side) do {
		case "blufor": {_sideInternal = west;};
		case "opfor": {_sideInternal = east;};
		case "indfor": {_sideInternal = independent;};
		default { };
	};

	[_kitChosen, _sideInternal] call fnf_createKit;

	_display closeDisplay 1;
}];

_kitSearch ctrlAddEventHandler[ "SetFocus", {
	_searchBox = (fnf_customSidedKitDisplay select 0) displayCtrl 10025;
	_searchTerm = ctrlText _searchBox;
	if (_searchTerm isEqualTo "Search...") then
	{
		_searchBox ctrlSetText "";
	};
}];

_kitSearch ctrlAddEventHandler[ "EditChanged", {
	_kitList = (fnf_customSidedKitDisplay select 0) displayCtrl 10000;
	_searchBox = (fnf_customSidedKitDisplay select 0) displayCtrl 10025;
	_searchTerm = ctrlText _searchBox;

	lbClear _kitList;

	if ((_searchTerm isEqualTo "") or (_searchTerm isEqualTo "Search...")) exitWith {
		_kitList lbAdd "===BLUFOR===";
		{
			_name = getText (_x >> 'displayName');
			_index = _kitList lbAdd _name;
			_kitList lbSetData [_index, _name];
		} forEach fnf_bluforComps;
		_kitList lbAdd "===OPFOR===";
		{
			_name = getText (_x >> 'displayName');
			_index = _kitList lbAdd _name;
			_kitList lbSetData [_index, _name];
		} forEach fnf_opforComps;
		_kitList lbAdd "===INDEPENDENT===";
		{
			_name = getText (_x >> 'displayName');
			_index = _kitList lbAdd _name;
			_kitList lbSetData [_index, _name];
		} forEach fnf_indiComps;
	};

	_kitList lbAdd "===BLUFOR===";
	{
		_name = getText (_x >> 'displayName');
		if ([_searchTerm, _name] call BIS_fnc_inString) then
		{
			_index = _kitList lbAdd _name;
			_kitList lbSetData [_index, _name];
		};
	} forEach fnf_bluforComps;
	_kitList lbAdd "===OPFOR===";
	{
		_name = getText (_x >> 'displayName');
		if ([_searchTerm, _name] call BIS_fnc_inString) then
		{
			_index = _kitList lbAdd _name;
			_kitList lbSetData [_index, _name];
		};
	} forEach fnf_opforComps;
	_kitList lbAdd "===INDEPENDENT===";
	{
		_name = getText (_x >> 'displayName');
		if ([_searchTerm, _name] call BIS_fnc_inString) then
		{
			_index = _kitList lbAdd _name;
			_kitList lbSetData [_index, _name];
		};
	} forEach fnf_indiComps;

}];

fnf_createKit = {
	params ["_kitToChange", "_sideToChangeTo"];

	//spawn Kit
	_kitToChangeCreated = create3DENComposition [_kitToChange, [0,0,0]];
	_kitObjects = _kitToChangeCreated select 0;
	_kitUnits = _kitObjects select {_x isKindOf "Man";};

	_kitComment =	_kitToChangeCreated select 7 select 0;
	_kitLayers = _kitToChangeCreated select 6;
	_kitModules = _kitToChangeCreated select 3;

	//get comment name to transfer
	_kitCommentName = ((_kitComment get3DENAttribute "Name") select 0);

	//get the layer name to transfer
	_kitLayerName = "";
	{
		_itemsInLayer = get3DENLayerEntities _x;
		_allLayers = true;
		{
			if (typeName _x isNotEqualTo "SCALAR") then
			{
				_allLayers = false;
				break;
			};
		} forEach _itemsInLayer;
		if (_allLayers) then
		{
			_kitLayerName = ((_x get3DENAttribute "Name") select 0);
		};
	} forEach _kitLayers;

	//get the kit info module
	_fnfInfoModule = objNull;
	{
		_classname = typeOf _x;
		if (_classname isEqualTo "fnf_module_kitInformation") then
		{
			_fnfInfoModule = _x;
			break;
		};
	} forEach _kitModules;

	//get all attributes from kit info module
	_kitInfoAttributes = _fnfInfoModule get3DENAttributes "fnf_module_kitInformation";

	//create a hashmap of all kits on sample kit side
	_allUnitsLoadouts = createHashMap;

	{
		//create unit UID based on position in group, squad name, and unit name
		_unitLeader = leader _x;
		_unitGroup = group _x;
		_leaderDescription = ((_unitLeader get3DENAttribute "description") select 0);
		_squad = (_leaderDescription splitString "@") select 1;

		_unitDescription = ((_x get3DENAttribute "description") select 0);

		_unitNumber = (units _unitGroup) find _x;

		_unitUID = _squad + "_" + str(_unitNumber) + "_" + _unitDescription;

		//get unit loadout and save to hashmap
		_loadout = getUnitLoadout _x;
		_allUnitsLoadouts set [_unitUID, _loadout];
	} forEach _kitUnits;

	//delete all things from sample kit
	{delete3DENEntities _x;} forEach _kitToChangeCreated;

	_sampleKit = objNull;
	_uavTerminal = "";
	_uavBackpack = "";

	switch (_sideToChangeTo) do {
		case west: {
			_sampleKit = (configfile >> "Cfg3DEN" >> "Compositions" >> "fnf_USMarinesWoodland2020");
			_uavTerminal = "B_UavTerminal";
			_uavBackpack = "B_UAV_01_backpack_F";
		};
		case east: {
			_sampleKit = (configfile >> "Cfg3DEN" >> "Compositions" >> "fnf_RussianRatnikWoodland2020");
			_uavTerminal = "O_UavTerminal";
			_uavBackpack = "O_UAV_01_backpack_F";
		};
		case independent: {
			_sampleKit = (configfile >> "Cfg3DEN" >> "Compositions" >> "fnf_AAF2020");
			_uavTerminal = "I_UavTerminal";
			_uavBackpack = "I_UAV_01_backpack_F";
		};
		default { };
	};

	//fix UAV Kits
	_kitToFix = _allUnitsLoadouts getOrDefault ["Sierra_1_Systems Specialist", "NOGO"];
	if (_kitToFix isNotEqualTo "NOGO") then
	{
		(_kitToFix select 9) set [1, _uavTerminal];
		(_kitToFix select 5) set [0, _uavBackpack];
		_allUnitsLoadouts set ["Sierra_1_Systems Specialist", _kitToFix];
	};

	_kitToFix = _allUnitsLoadouts getOrDefault ["Sierra_2_Systems Specialist", "NOGO"];
	if (_kitToFix isNotEqualTo "NOGO") then
	{
		(_kitToFix select 9) set [1, _uavTerminal];
		_allUnitsLoadouts set ["Sierra_2_Systems Specialist", _kitToFix];
	};

	_finalKit = create3DENComposition [_sampleKit, screenToWorld [0.5, 0.5]];
	_finalKitObjects = _finalKit select 0;
	_finalKitUnits = _finalKitObjects select {_x isKindOf "Man";};

	{
		_unitLeader = leader _x;
		_unitGroup = group _x;
		_leaderDescription = ((_unitLeader get3DENAttribute "description") select 0);
		_squad = (_leaderDescription splitString "@") select 1;

		_unitDescription = ((_x get3DENAttribute "description") select 0);

		_unitNumber = (units _unitGroup) find _x;

		_unitUID = _squad + "_" + str(_unitNumber) + "_" + _unitDescription;
		_loadout = _allUnitsLoadouts get _unitUID;

		_x setUnitLoadout _loadout;
	} forEach _finalKitUnits;

	_kitComment =	_finalKit select 7 select 0;
	_kitLayers = _finalKit select 6;
	_kitModules = _finalKit select 3;

	_kitComment set3DENAttribute ["Name", _kitCommentName];

	{
		_itemsInLayer = get3DENLayerEntities _x;
		_allLayers = true;
		{
			if (typeName _x isNotEqualTo "SCALAR") then
			{
				_allLayers = false;
				break;
			};
		} forEach _itemsInLayer;
		if (_allLayers) then
		{
			_x set3DENAttribute ["Name", _kitLayerName];
		};
	} forEach _kitLayers;

	_fnfInfoModule = objNull;
	{
		_classname = typeOf _x;
		if (_classname isEqualTo "fnf_module_kitInformation") then
		{
			_fnfInfoModule = _x;
			break;
		};
	} forEach _kitModules;

	{
		_x params ["_class", "_value"];
		_fnfInfoModule set3DENAttribute [_class, _value];
	} forEach _kitInfoAttributes;

	save3DENInventory _finalKitUnits;
};
