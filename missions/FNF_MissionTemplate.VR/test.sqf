configfile >> "CfgWeapons" >> "optic_Aco" >> "ItemInfo" >> "OpticsModes" >> "ACO"
configfile >> "CfgWeapons" >> "rhsusf_acc_ELCAN" >> "ItemInfo" >> "opticType"


_val = getNumber (configfile >> "CfgWeapons" >> "optic_Aco" >> "ItemInfo" >> "opticType");

_optics = [];
_useableOptics = [];
_configClasses = "true" configClasses (configfile >> "CfgWeapons") apply {configName _x};
_optics = _configClasses apply {
  if (((configName (configfile >> "CfgWeapons" >> _x) call BIS_fnc_itemType) select 1) isEqualTo "AccessorySights" && !isNull (configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "OpticsModes" >> "ACO")) then {
    _useableOptics pushBack _x;
  };
};

copyToClipboard str _useableOptics;

copyToClipboard str _configClasses;

[configfile >> "CfgWeapons" >> "optic_Aco" >> "ItemInfo" >> "opticType","idc"] call BIS_fnc_returnConfigEntry;
