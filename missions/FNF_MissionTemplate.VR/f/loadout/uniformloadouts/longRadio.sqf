_lrRadio = "";
switch (side group player) do {
    case west: {
      _giveLR = ["phx_loadout_blufor_lr_radio",0] call BIS_fnc_getParamValue;
      if (_giveLR isEqualTo 1) then {
        _lrRadio = "tf_rt1523g_black";
      };
    };
    case east: {
      _giveLR = ["phx_loadout_opfor_lr_radio",0] call BIS_fnc_getParamValue;
      if (_giveLR isEqualTo 1) then {
        _lrRadio = "tf_mr3000_rhs";
      };
    };
    case independent: {
      _giveLR = ["phx_loadout_indfor_lr_radio",0] call BIS_fnc_getParamValue;
      if (_giveLR isEqualTo 1) then {
        _lrRadio = "tf_anprc155_coyote";
      };
    };
    case civilian: {
      _giveLR = ["phx_loadout_civ_lr_radio",0] call BIS_fnc_getParamValue;
      if (_giveLR isEqualTo 1) then {
        _lrRadio = "tf_anprc155_coyote";
      };
    };
    default {
      _lrRadio = "";
    };
};
