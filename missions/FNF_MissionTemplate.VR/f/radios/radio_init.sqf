// F3 - Radio Framework initialisation
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// RUN RELEVANT SCRIPTS, DEPENDING ON SYSTEM IN USE
// Each radio modification requires a different set of scripts to be used, and so we
// split into a seperate script file for initialisation of each mod, on both the
// server and client.

// If any radio system selected
f_param_radios = ["phx_param_radios",0] call BIS_fnc_getParamValue;
//if(f_param_radios != 0) then {
  switch (f_param_radios) do {
    case 1: { // TFR
      //[] execVM "f\radios\tfr\tfr_init.sqf";
    };
    case 2: { // acre2
      [] execVM "f\radios\acre2\acre2_init.sqf";
    };
    default {
      [] execVM "f\radios\acre2\acre2_init.sqf";
    };
  };
//};

// ====================================================================================
