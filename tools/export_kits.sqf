/*

  This system exports loadouts to setUnitLoadout format for easy reapplication outside of the primary framework.

  The game might freeze up for a bit while processing. Just be patient and it'll complete.

  A serialized CBA Hash will be returned.

  Friday Night Fight
  Contact: Indigo#6290
*/


// [] spawn {
	_sets = [
		["RHS_UNI_NATO_GER_BUNDESWEHR_2010","RHS_GEAR_NATO_BUNDESWEHR_2010_G36"],
		["RHS_UNI_NATO_GREEKFORCES_2010","RHS_GEAR_NATO_GREEKFORCES_2010_L1A1"],
		["RHS_UNI_NATO_NL_DUTCH_ARMY_2010","RHS_GEAR_NATO_DUTCH_ARMY_2010_M4"],
		["RHS_UNI_NATO_UKRAINIAN_2010","RHS_GEAR_NATO_UKRAINIAN_2010_AK74UUK"],
		["RHS_UNI_NATO_US_ARMY_2020","RHS_GEAR_US_ARMY_2010_M16A4"],
		["RHS_UNI_NATO_US_MARINES_DESERT_2010","RHS_GEAR_US_MARINES_2020_M27"],
		["RHS_UNI_NATO_US_MARINES_WOODLAND_2010","RHS_GEAR_US_MARINES_2020_M27"],
		["RHS_UNI_NATO_US_NAVY_2010","RHS_GEAR_US_NAVY_2010_MK18"],
		["RHS_UNI_NATO_US_RANGERS_2020","RHS_GEAR_US_RANGERS_2010_SCAR"],
		["RHS_UNI_NATO_FRANCE_2010","RHS_GEAR_NATO_FRANCE_2010_FAMAS"],
		["RHS_UNI_ANY_CROATIAN_2010","RHS_GEAR_ANY_CROATIAN_2010_VHS"],
		["RHS_UNI_ANY_CZECHFORCES_2010","RHS_GEAR_ANY_CZECHFORCES_2010_VZ58"],
		["RHS_UNI_ANY_SERBIANFORCES_2010","RHS_GEAR_ANY_SERBIAN_ARMY_2010_M21"],
		["RHS_UNI_ANY_YUGOSLAVIA_2000","RHS_GEAR_ANY_YUGOSLAVIA_2000_M70"],
		["APEX_UNI_ANY_AFRICAN_POLICE_2010","RHS_GEAR_ANY_AFRICAN_POLICE_2010_FAMAS"],
		["RHS_UNI_RU_COSSACKS_2010","RHS_GEAR_RU_ARMY_2010_AK74M"],
		["RHS_UNI_RU_RATNIK_2020","RHS_GEAR_RU_ARMY_2010_AK74M"],
		["RHS_UNI_RU_RATNIK_D_2020","RHS_GEAR_RU_ARMY_2010_AK74M"],
		["RHS_UNI_RU_SPETSNAZ_2010","RHS_GEAR_RU_ARMY_2010_AK74M"],
		["RHS_UNI_ID_INSURGENTS_2000","RHS_GEAR_ID_INSURGENTS_2000_AK74N"],
		["RHS_UNI_ID_IRAQI_ARMY_2000","RHS_GEAR_ID_IRAQI_ARMY_2000_AKMN"],
		["RHS_UNI_ID_MEC_2010","RHS_GEAR_ID_MEC_2010_AK103"],
		["RHS_UNI_ID_NAVSOG_2010","RHS_GEAR_ID_NAVSOG_2010_M16A4"],
		["RHS_UNI_ID_REBELS_2010","RHS_GEAR_ID_REBELS_2010_AKMN"],
		["RHS_UNI_ID_TRIBAL_2010","RHS_GEAR_ID_TRIBAL_2010_AKMN"],
		["RHS_UNI_ID_TURKISH_ARMY_2010","RHS_GEAR_ID_TURKISH_2010_HK33A2"],
		["RHS_UNI_ID_AFRICAN_MILITIA_2010","RHS_GEAR_ID_AFRICAN_MILITIA_2010_AKMN"],
		["RHS_UNI_NATO_US_ARMY_1980","RHS_GEAR_US_ARMY_1980_M16A1"],
		["RHS_UNI_NATO_DE_WESTGERMAN_1980","RHS_GEAR_NATO_WESTGERMAN_1980_G3"],
		["RHS_UNI_RU_ARMY_1980","RHS_GEAR_RU_ARMY_1980_AK74"]
	];


	KITS = false call CBA_fnc_createNamespace;
	{
		fnf_bluforUniform = _x # 0;
		fnf_bluforGear = _x # 1;
		KITS setVariable [(format["%1 | %2", fnf_bluforUniform, fnf_bluforGear]), createHashMap];
		{
			[_x] call fnf_loadout_fnc_applyLoadout;
			// sleep 0.1;
			(KITS getVariable (format["%1 | %2", fnf_bluforUniform, fnf_bluforGear])) set [_x, getUnitLoadout player];
			// _out pushBack (getUnitLoadout player);
		} forEach (fnf_loadout_roles apply {_x # 0});
// 		"debug_console" callExtension ((_out joinString "
// ") + "~0000");
// 		diag_log text (_out joinString "
// ");
	} forEach _sets;
	[KITS, []] call CBA_fnc_serializeNamespace;
// };
