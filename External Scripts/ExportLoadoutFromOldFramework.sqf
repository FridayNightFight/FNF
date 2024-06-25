final_loadouts = "[[";
_radioToUse = "TFAR_anprc152";
switch (playerSide) do {
	case east: {_radioToUse = "TFAR_fadak";};
	case independent: {_radioToUse = "TFAR_anprc148jem";};
};
{
	_br = toString [13,10];
	[_x select 0] call fnf_loadout_fnc_applyLoadout;
	_unitLoudout = getUnitLoadout player;
	(_unitLoudout select 9) set [2, _radioToUse];
	if (_x select 0 == "CE") then
	{
		(_unitLoudout select 5 select 1) pushBack ["ACE_M14",2,1];
		(_unitLoudout select 5 select 1) pushBack ["ACE_wirecutter",1];
	};
	if (_x select 0 == "CRL" or _x select 0 == "CR" or _x select 0 == "PI") then
	{
		(_unitLoudout select 5 select 1) pushBack ["ToolKit",1];
	};
	if (_x select 0 == "DM") then
	{
		if (_unitLoudout select 0 select 0 isEqualTo "rhs_weap_svdp_wd_npz") then
		{
			(_unitLoudout select 0) set [0, "rhs_weap_svdp_wd"];
			(_unitLoudout select 0) set [3, "rhs_acc_pso1m21"];
		};
	};
	final_loadouts = final_loadouts + "],[" + _br + str(_x select 0) + "," + _br + str(_unitLoudout);
} forEach fnf_loadout_roles;
final_loadouts = final_loadouts + "]]";
final_loadouts = [final_loadouts,4] call BIS_fnc_trimString;
final_loadouts = "[" + final_loadouts;
copyToClipboard final_loadouts;
