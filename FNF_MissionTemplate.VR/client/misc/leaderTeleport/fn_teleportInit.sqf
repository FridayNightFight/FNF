// PL
if (["Platoon Leader", roleDescription player] call BIS_fnc_inString) then {
	_action = [
		"PL_Teleport",
		"Teleport Subordinates",
		"",
		{},
		{missionNamespace getVariable ["fnf_safetyEnabled", false]}
	] call ace_interact_menu_fnc_createAction;
	[
		player,
		1,
		["ACE_SelfActions"],
		_action
	] call ace_interact_menu_fnc_addActionToObject;


	_action = [
		"PL_Teleport_leaders",
		"Teleport SL/X/Assets",
		"",
		{
			["Platoon Leader", "leaders"] spawn fnf_fnc_teleportExec;
		},
		{missionNamespace getVariable ["fnf_safetyEnabled", false]}
	] call ace_interact_menu_fnc_createAction;
	[
		player,
		1,
		["ACE_SelfActions", "PL_Teleport"],
		_action
	] call ace_interact_menu_fnc_addActionToObject;


	_action = [
		"PL_Teleport_SL",
		"Teleport SLs",
		"",
		{
			["Platoon Leader", "sl"] spawn fnf_fnc_teleportExec;
		},
		{missionNamespace getVariable ["fnf_safetyEnabled", false]}
	] call ace_interact_menu_fnc_createAction;
	[
		player,
		1,
		["ACE_SelfActions", "PL_Teleport"],
		_action
	] call ace_interact_menu_fnc_addActionToObject;


	_action = [
		"PL_Teleport_SLTL",
		"Teleport SLs + TLs",
		"",
		{
			["Platoon Leader", "sltl"] spawn fnf_fnc_teleportExec;
		},
		{missionNamespace getVariable ["fnf_safetyEnabled", false]}
	] call ace_interact_menu_fnc_createAction;
	[
		player,
		1,
		["ACE_SelfActions", "PL_Teleport"],
		_action
	] call ace_interact_menu_fnc_addActionToObject;


	_action = [
		"PL_Teleport_ALL",
		format["Teleport ALL %1", (playerSide call BIS_fnc_sideID) call BIS_fnc_sideName],
		"",
		{
			["Platoon Leader", "all"] spawn fnf_fnc_teleportExec;
		},
		{missionNamespace getVariable ["fnf_safetyEnabled", false]}
	] call ace_interact_menu_fnc_createAction;
	[
		player,
		1,
		["ACE_SelfActions", "PL_Teleport"],
		_action
	] call ace_interact_menu_fnc_addActionToObject;
};


// SL
if (["Squad Leader", roleDescription player] call BIS_fnc_inString) then {
	_action = [
		"SL_Teleport",
		"Teleport Subordinates",
		"",
		{},
		{missionNamespace getVariable ["fnf_safetyEnabled", false]}
	] call ace_interact_menu_fnc_createAction;
	[
		player,
		1,
		["ACE_SelfActions"],
		_action
	] call ace_interact_menu_fnc_addActionToObject;


	_action = [
		"PL_Teleport_Leads",
		"Teleport TLs",
		"",
		{
			["Squad Leader", "tl"] spawn fnf_fnc_teleportExec;
		},
		{missionNamespace getVariable ["fnf_safetyEnabled", false]}
	] call ace_interact_menu_fnc_createAction;
	[
		player,
		1,
		["ACE_SelfActions", "SL_Teleport"],
		_action
	] call ace_interact_menu_fnc_addActionToObject;


	_action = [
		"PL_Teleport_Leads",
		"Teleport All Squad Members",
		"",
		{
			["Squad Leader", "all"] spawn fnf_fnc_teleportExec;
		},
		{missionNamespace getVariable ["fnf_safetyEnabled", false]}
	] call ace_interact_menu_fnc_createAction;
	[
		player,
		1,
		["ACE_SelfActions", "SL_Teleport"],
		_action
	] call ace_interact_menu_fnc_addActionToObject;
};
