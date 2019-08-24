#include "cfgLoadouts.hpp"

if (isNil "phx_loadout_unitLevel") then {
    phx_loadout_unitLevel = 0;
};

// Radio
if (phx_loadout_radio <= phx_loadout_unitLevel) then {
    if !("ItemRadio" in (assignedItems player)) then {
        player linkItem "ItemRadio";
    };
} else {
    player unlinkItem "ItemRadio";
};

// Map
if (phx_loadout_map <= phx_loadout_unitLevel) then {
    if !("ItemMap" in (assignedItems player)) then {
        player linkItem "ItemMap";
    };
} else {
    player unlinkItem "ItemMap";
    player unlinkItem "ItemGPS";
};

// GPS
if (phx_loadout_gps <= phx_loadout_unitLevel) then {
    if !("ItemGPS" in (assignedItems player)) then {
        player linkItem "ItemGPS";
    };
} else {
    player unlinkItem "ItemGPS";
};

// Watch
if (phx_loadout_watch <= phx_loadout_unitLevel) then {
    if !("ItemWatch" in (assignedItems player)) then {
        player linkItem "ItemWatch";
    };
} else {
    player unlinkItem "ItemWatch";
};

// Compass
if (phx_loadout_compass <= phx_loadout_unitLevel) then {
    if !("ItemCompass" in (assignedItems player)) then {
        player linkItem "ItemCompass";
    };
} else {
    player unlinkItem "ItemCompass";
};

// Binocular
phx_loadout_binocularArray = ["Binocular", "Laserdesignator_02", "Laserdesignator_03","Laserdesignator", "lerca_1200_black", "lerca_1200_tan", "Leupold_Mk4", "rhs_pdu4", "Rangefinder", "rhs_tr8_periscope", "rhs_tr8_periscope_pip"]; // An array of all binocular classnames in the modset
if ((missionNamespace getVariable ["phx_loadout_addBinocular",false]) isEqualType "") then {
    private _hasBinocular = false;
    {
        if (_x in (weapons player)) then {
            if (_x isEqualTo phx_loadout_addBinocular) then {
                _hasBinocular = true;
            } else {
                player removeWeapon _x;
            };
        };
    } forEach phx_loadout_binocularArray;
    if !(_hasBinocular) then {
        player addWeapon phx_loadout_addBinocular;
    };
} else {
    {
        if (_x in (weapons player)) then {
            player removeWeapon _x;
        };
    } forEach phx_loadout_binocularArray;
};

player unlinkItem "NVGoggles";
player unlinkItem "NVGoggles_OPFOR";
player unlinkItem "NVGoggles_INDEP";

_nightvision = "phx_loadout_nightvision" call BIS_fnc_getParamValue;
phx_loadout_nvgAttachment = "";

if !(_nightvision isEqualTo -1) then {
  switch (_nightvision) do {
    case 0: {
      _nvg = (assignedItems player) select 4;
      player unlinkItem _nvg;
    };
    case 1: {
      player linkItem "ACE_NVG_Gen4";
      switch (side player) do {
        case east: {
          phx_loadout_nvgAttachment = "rhs_acc_perst1ik";
          if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
            phx_loadout_nvgAttachment = "rhs_acc_perst1ik_ris";
          };
        };
        case west: {
          phx_loadout_nvgAttachment = "ACE_acc_pointer_green";
        };
        case independent: {
          phx_loadout_nvgAttachment =  "acc_pointer_IR";
        };
      };
    };
    case 2: {
      if (side player == east) then {
        player linkItem "ACE_NVG_Gen4";
        phx_loadout_nvgAttachment = "rhs_acc_perst1ik";
        if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
          phx_loadout_nvgAttachment = "rhs_acc_perst1ik_ris";
        };
      };
    };
    case 3: {
      if (side player == west) then {
        player linkItem "ACE_NVG_Gen4";
        phx_loadout_nvgAttachment = "ACE_acc_pointer_green";
      };
    };
    case 4: {
      if (side player == independent) then {
        player linkItem "ACE_NVG_Gen4";
        phx_loadout_nvgAttachment =  "acc_pointer_IR";
      };
    };
  };
};

player addPrimaryWeaponItem phx_loadout_nvgAttachment;

// Flashlight
if ((missionNamespace getVariable ["phx_loadout_addAttachment",false]) isEqualType "") then {
    player addPrimaryWeaponItem phx_loadout_addAttachment;
};
