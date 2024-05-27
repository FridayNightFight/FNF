/*
	Author: Mallen

	Description:
		Clears all vehicles inventories if it has been set so they do be cleared

	Parameter(s):
		None

	Returns:
		None
*/

["All", "InitPost", {
	private _vic = (_this select 0);
	if (_vic isKindOf "Man" || typeOf _vic isEqualTo "WeaponHolderSimulated") exitWith {}; //Exit so the code below doesn't run for infantry units

	_objectType = _vic call BIS_fnc_objectType;
	_objectType = _objectType select 0;

	if (_vic getVariable ["fnf_clearInventory", true] && !(_objectType isEqualTo "Object")) then {
		clearBackpackCargoGlobal _vic;
		clearWeaponCargoGlobal _vic;
		clearItemCargoGlobal _vic;
		clearMagazineCargoGlobal _vic;
	};
}, true, ["CAManBase", "Static"], true] call CBA_fnc_addClassEventHandler;
