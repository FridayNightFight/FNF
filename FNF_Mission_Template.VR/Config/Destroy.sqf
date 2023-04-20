//What this side has to destroy
_bluforTargets = 		[destroy1];
_opforTargets = 		[];
_independentTargets = 	[destroy1];

//What this side has to protect
_bluforItemsToProtect = 		[];
_opforItemsToProtect = 			[destroy1];
_independentItemsToProtect = 	[];

//What Hiding Zones are available
_hidingZonePrefixes = ["hidingzone_"];

//Can players see what zone their objective is in
_seeWhichTargetIsInWhichHidingZone = true;

//What zones this side starts in
_bluforStartZonePrefixs = 		["testing_markers_"];
_opforStartZonePrefixs = 		[];
_independentStartZonePrefixs = 	[];

//will this side have to destroy their targets in order (NOT WORKING)
_bluforDestroyTargetsInOrder = 		false;
_opforDestroyTargetsInOrder = 		false;
_independentDestroyTargetsInOrder = false;

//************************************************************************
//DO NOT EDIT AFTER THIS UNLESS INSTRUCTED TO
//************************************************************************

[
	_bluforTargets,
	_opforTargets,
	_independentTargets,
	_bluforItemsToProtect,
	_opforItemsToProtect,
	_independentItemsToProtect,
	_hidingZonePrefixes,
	_seeWhichTargetIsInWhichHidingZone,
	_bluforStartZonePrefixs,
	_opforStartZonePrefixs,
	_independentStartZonePrefixs,
	_bluforDestroyTargetsInOrder,
	_opforDestroyTargetsInOrder,
	_independentDestroyTargetsInOrder
] call FNF_Gamemodes_fnc_destroy;
