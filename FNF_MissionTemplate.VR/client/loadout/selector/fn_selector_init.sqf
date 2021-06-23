/*
Creates a gear selector for the player allowing switching of optic, weapon and charge loadout for CEs

Format for adding weapons to the selector within weapon set file:
phx_selector_weapons = [["WEAPON_CLASS"]]
or phx_selector_weapons = [["WEAPON_CLASS", "MAG_CLASS:Num"]]
or phx_selector_weapons = [["WEAPON_CLASS", "MAG_CLASS:Num", "MAG_CLASS:Num"]]

*Num = number of magazines to add
**phx_selector_weapons must be a 2 dimensional array**

-If no magazine is specified, the selector will use the default of phx_loadout_rifle_mag and phx_loadout_rifle_mag_tracer for units that start with tracer mags
-The weapon selector only works with primary weapon slot weapons
*/

//Don't allow classes with non-rifleman weapon to switch weapons
if (phx_loadout_hasSpecial) then {phx_selector_weapons = []};

//Exit if there is nothing for the player to select
if (
count (missionNamespace getVariable ["phx_selector_optics",[]]) == 0
&&
count (missionNamespace getVariable ["phx_selector_weapons",[]]) == 0
&&
count (missionNamespace getVariable ["phx_selector_explosives",[]]) == 0
&&
count (missionNamespace getVariable ["phx_selector_grenades",[]]) == 0
) exitWith {};

//Create base actions
_action = ["Gear_Selector","Gear Selector","",{},{phx_safetyEnabled}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions"],_action] call ace_interact_menu_fnc_addActionToClass;

_action = ["Optic_Selector","Optic","",{},{true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "Gear_Selector"],_action] call ace_interact_menu_fnc_addActionToClass;

_action = ["Weapon_Selector","Weapon","",{},{true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "Gear_Selector"],_action] call ace_interact_menu_fnc_addActionToClass;

_action = ["Explosives_Selector","Explosives","",{},{true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "Gear_Selector"],_action] call ace_interact_menu_fnc_addActionToClass;

_action = ["Grenades_Selector","Grenades","",{},{true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "Gear_Selector"],_action] call ace_interact_menu_fnc_addActionToClass;

//Add actions if there are items to select from
if (count (missionNamespace getVariable ["phx_selector_optics",[]]) > 0) then {call phx_fnc_selector_optics};
if (count (missionNamespace getVariable ["phx_selector_weapons",[]]) > 0) then {call phx_fnc_selector_weapons};
if (count (missionNamespace getVariable ["phx_selector_explosives",[]]) > 0 && pRole == ROLE_CE) then {call phx_fnc_selector_charges};
if (count (missionNamespace getVariable ["phx_selector_grenades",[]]) > 0 && pRole == ROLE_CE) then {call phx_fnc_selector_grenades};

//Remove selector when safe start ends
[{!phx_safetyEnabled}, {
  [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector", "Optic_Selector"]] call ace_interact_menu_fnc_removeActionFromClass;
  [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector", "Weapon_Selector"]] call ace_interact_menu_fnc_removeActionFromClass;
  [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector", "Explosives_Selector"]] call ace_interact_menu_fnc_removeActionFromClass;
  [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector", "Grenades_Selector"]] call ace_interact_menu_fnc_removeActionFromClass;
  [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector"]] call ace_interact_menu_fnc_removeActionFromClass;
}] call CBA_fnc_waitUntilAndExecute;
