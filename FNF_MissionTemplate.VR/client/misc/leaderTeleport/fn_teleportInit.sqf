// CO
if (["Company Commander", roleDescription player] call BIS_fnc_inString) then {
	_action = [
		"CO_Teleport",
		"Teleport Subordinates",
		"",
		{},
		{phx_safetyEnabled && ["Company Commander", roleDescription player] call BIS_fnc_inString}
	] call ace_interact_menu_fnc_createAction;
	[
		player,
		1,
		["ACE_SelfActions"],
		_action
	] call ace_interact_menu_fnc_addActionToObject;


	_action = [
		"CO_Teleport_Leaders",
		"Teleport PL/X/Assets",
		"",
		{
			["Company Commander", "leaders"] spawn phx_fnc_teleportExec;
		},
		{phx_safetyEnabled && ["Company Commander", roleDescription player] call BIS_fnc_inString}
	] call ace_interact_menu_fnc_createAction;
	[
		player,
		1,
		["ACE_SelfActions", "CO_Teleport"],
		_action
	] call ace_interact_menu_fnc_addActionToObject;


	_action = [
		"CO_Teleport_LeadersSL",
		"Teleport PL/X/Assets + SLs",
		"",
		{
			["Company Commander", "sl"] spawn phx_fnc_teleportExec;
		},
		{phx_safetyEnabled && ["Company Commander", roleDescription player] call BIS_fnc_inString}
	] call ace_interact_menu_fnc_createAction;
	[
		player,
		1,
		["ACE_SelfActions", "CO_Teleport"],
		_action
	] call ace_interact_menu_fnc_addActionToObject;


	_action = [
		"CO_Teleport_All",
		format["Teleport ALL %1", str playerSide],
		"",
		{
			["Company Commander", "all"] spawn phx_fnc_teleportExec;
		},
		{phx_safetyEnabled && ["Company Commander", roleDescription player] call BIS_fnc_inString}
	] call ace_interact_menu_fnc_createAction;
	[
		player,
		1,
		["ACE_SelfActions", "CO_Teleport"],
		_action
	] call ace_interact_menu_fnc_addActionToObject;
};


// PL
if (["Platoon Leader", roleDescription player] call BIS_fnc_inString) then {
	_action = [
		"PL_Teleport",
		"Teleport Subordinates",
		"",
		{},
		{phx_safetyEnabled && ["Platoon Leader", roleDescription player] call BIS_fnc_inString}
	] call ace_interact_menu_fnc_createAction;
	[
		player,
		1,
		["ACE_SelfActions"],
		_action
	] call ace_interact_menu_fnc_addActionToObject;


	_action = [
		"PL_Teleport_SL",
		"Teleport SLs",
		"",
		{
			["Platoon Leader", "sl"] spawn phx_fnc_teleportExec;
		},
		{phx_safetyEnabled && ["Platoon Leader", roleDescription player] call BIS_fnc_inString}
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
			["Platoon Leader", "sltl"] spawn phx_fnc_teleportExec;
		},
		{phx_safetyEnabled}
	] call ace_interact_menu_fnc_createAction;
	[
		player,
		1,
		["ACE_SelfActions", "PL_Teleport"],
		_action
	] call ace_interact_menu_fnc_addActionToObject;

	_action = [
		"PL_Teleport_PLT",
		"Teleport ALL PLT",
		"",
		{
			["Platoon Leader", "plt"] spawn phx_fnc_teleportExec;
		},
		{phx_safetyEnabled}
	] call ace_interact_menu_fnc_createAction;
	[
		player,
		1,
		["ACE_SelfActions", "PL_Teleport"],
		_action
	] call ace_interact_menu_fnc_addActionToObject;


	_action = [
		"PL_Teleport_ALL",
		format["Teleport ALL %1", str playerSide],
		"",
		{
			["Platoon Leader", "all"] spawn phx_fnc_teleportExec;
		},
		{ // only allow if CO slot is not filled
			phx_safetyEnabled &&
			count (
				allPlayers select {["Company Commander", roleDescription _x] call BIS_fnc_inString}
			) isEqualTo 0 &&
			groupId (group player) isEqualTo "P1HQ" &&
			["Platoon Leader", roleDescription player] call BIS_fnc_inString
		}
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
		{phx_safetyEnabled && ["Squad Leader", roleDescription player] call BIS_fnc_inString}
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
			["Squad Leader", "tl"] spawn phx_fnc_teleportExec;
		},
		{phx_safetyEnabled && ["Squad Leader", roleDescription player] call BIS_fnc_inString}
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
			["Squad Leader", "all"] spawn phx_fnc_teleportExec;
		},
		{phx_safetyEnabled && ["Squad Leader", roleDescription player] call BIS_fnc_inString}
	] call ace_interact_menu_fnc_createAction;
	[
		player,
		1,
		["ACE_SelfActions", "SL_Teleport"],
		_action
	] call ace_interact_menu_fnc_addActionToObject;
};