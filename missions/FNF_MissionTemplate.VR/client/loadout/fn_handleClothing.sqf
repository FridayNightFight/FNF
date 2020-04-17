/*
    Handle adding clothing to players. Ensures that if a unit already has a piece of clothing that it is not removed and then added again.
*/

// Add Uniform
if (!isNil "phx_loadout_uniform") then {
    if (uniform player isEqualTo phx_loadout_uniform) then {
        // Clear uniform's items
        private _uniform = uniformContainer player;
        clearItemCargoGlobal _uniform;
        clearMagazineCargoGlobal _uniform;
        clearWeaponCargoGlobal _uniform;
        clearBackpackCargoGlobal _uniform;
    } else {
        removeUniform player;
        player forceAddUniform phx_loadout_uniform;
    };
} else {
    removeUniform player;
};

// Add Vest
if (!isNil "phx_loadout_vest") then {
    if (vest player isEqualTo phx_loadout_vest) then {
        // Clear vest's items
        private _vest = vestContainer player;
        clearItemCargoGlobal _vest;
        clearMagazineCargoGlobal _vest;
        clearWeaponCargoGlobal _vest;
        clearBackpackCargoGlobal _vest;
    } else {
        removeVest player;
        player addVest phx_loadout_vest;
    };
} else {
    removeVest player;
};

// Add Backpack
if (!isNil "phx_loadout_backpack") then {
    if (backpack player isEqualTo phx_loadout_backpack) then {
        // Clear backpack's items
        private _backpack = backpackContainer player;
        clearItemCargoGlobal _backpack;
        clearMagazineCargoGlobal _backpack;
        clearWeaponCargoGlobal _backpack;
        clearBackpackCargoGlobal _backpack;
    } else {
        removeBackpack player;
        player addBackpack phx_loadout_backpack;
    };
} else {
    removeBackpack player;
};

// Add Helmet
if (!isNil "phx_loadout_headgear") then {
    if !(headgear player isEqualTo phx_loadout_headgear) then {
        removeHeadgear player;
        player addHeadgear phx_loadout_headgear;
    };
} else {
    removeHeadgear player;
};
