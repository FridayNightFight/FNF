// F3 - ACRE2 Settings
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// RADIO STRUCTURE

// Whether any radios should be assigned at all, to any units
// TRUE = Disable radios for all units
f_radios_settings_acre2_disableRadios = FALSE;

// Whether or not the radio frequencies should be left as default, and not split per side
// TRUE = Disable frequency seperation across sides
f_radios_settings_acre2_disableFrequencySplit = FALSE;

// Set a list of units that get a short wave
// if its nil, that means all units get a radio
// empty array means that noone gets
f_radios_settings_acre2_shortRange = nil;

// Set the list of units that get a long range
f_radios_settings_acre2_longRange = [toLower "O_officer_F",
																	   toLower "O_Soldier_SL_F",
																		 toLower "O_pilot_F",
																		 toLower "B_officer_F",
																		 toLower "B_Soldier_SL_F",
																		 toLower "B_pilot_F",
																		 toLower "I_officer_F",
																		 toLower "I_Soldier_SL_F",
																		 toLower "I_pilot_F"];

// Unit types you want to give an extra long-range radio
// E.G: ["co", "m"] would give the CO and all medics an extra long-range radios
f_radios_settings_acre2_extraRadios = [];

// Standard Short
f_radios_settings_acre2_standardSHRadio = "ACRE_PRC343";
// Standard LongRange
f_radios_settings_acre2_standardLRRadio = "ACRE_PRC152";
// Extra radio
f_radios_settings_acre2_extraRadio = "ACRE_PRC117F";

// ====================================================================================
// BABEL API

// Defines the languages that exist in the mission.
// string id, displayname
f_radios_settings_acre2_languages = [
	["en", "English"],
	["ru", "Russian"]
];

// defines the language that a player can speak.
// can define multiple
f_radios_settings_acre2_language_blufor = ["en"];
f_radios_settings_acre2_language_opfor = ["en"];
f_radios_settings_acre2_language_indfor = ["en"];

// Channel names and group defaults
// first item in the array will correspond to the first channel
// item definition: ["CHANNEL NAME", ["GROUP1 NAME", "GROUP2 NAME"]]
// note that if using a 343 only the first 16 channels are available for the short-range array
// also note these only work if f_radios_settings_acre2_disableFrequencySplit is set to false
f_radios_settings_acre2_sr_groups_blufor = [
  ["HQ", 			 ["PltHQ"]],
	["Alpha",    ["A","A1","A2"]],
	["Bravo",    ["B","B1","B2"]],
	["Charlie",  ["C","C1","C2"]],
	["Delta",    ["D","D1","D2","D3","D4"]]
];

f_radios_settings_acre2_sr_groups_opfor = [
	["HQ",			 ["PltHQ"]],
	["Echo",     ["E","E1","E2"]],
	["Foxtrot",  ["F","F1","F2"]],
	["Golf",     ["G","G1","G2"]],
	["Hotel",    ["H","H1","H2","H3","H4"]]
];

f_radios_settings_acre2_sr_groups_indfor = [
	["HQ",			 ["PltHQ"]],
	["India",    ["I","I1","I2"]],
	["Juliet",   ["J","J1","J2"]],
	["Kilo",     ["K","K1","K2"]],
	["Lima",     ["L","L1","L2","L3","L4"]]
];

f_radios_settings_acre2_lr_groups_blufor = [
  ["HQ",       [
		"PltHQ",
		"A","B","C","D"
	]],
	["Alpha",    []],
	["Bravo",    []],
	["Charlie",  []],
	["Delta",    []]
];

f_radios_settings_acre2_lr_groups_opfor = [
  ["HQ",       [
		"PltHQ",
		"E","F","G","H"
	]],
	["Echo",     []],
	["Foxtrot",  []],
	["Golf",     []],
	["Hotel",    []]
];

f_radios_settings_acre2_lr_groups_indfor = [
  ["HQ",       [
		"PltHQ",
		"I","J","K","L"
	]],
	["India",   []],
	["Juliet",  []],
	["Kilo",    []],
	["Lima",    []]
];

// ====================================================================================
// MISC ACRE2 settings, these are all set the ACRE2 defaults

// ACRE Radio loss settings.
// Indiciates how much terrian loss should be modelled.
// Values: 0 no loss, 1 full terrian loss, default: 1
[1] call acre_api_fnc_setLossModelScale;

// ACRE full Duplex
// Sets the duplex of radio transmissions. If set to true, it means that you will receive transmissions even while talking and multiple people can speak at the same time.
[false] call acre_api_fnc_setFullDuplex;

// ACRE Interference
// Sets whether transmissions will interfere with eachother. This, by default, causes signal loss when multiple people are transmitting on the same frequency.
[true] call acre_api_fnc_setInterference;

// ACRE can AI hear players?
// False - AI not hear players, true - AI hear players.
[false] call acre_api_fnc_setRevealToAI;

phx_acre_setup = true;
