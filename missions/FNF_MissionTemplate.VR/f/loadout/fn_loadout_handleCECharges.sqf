switch (side player) do {
  case west: {
    _explosives = "phx_loadout_BLUFORCharges" call BIS_fnc_getParamValue;
    if !(_explosives isEqualTo -1) then {
      switch (_explosives) do {
        case 0: {
          phx_loadout_explosives = "DemoCharge_Remote_Mag:4";
        };
        case 1: {
          phx_loadout_explosives = "DemoCharge_Remote_Mag:2";
          phx_loadout_explosives_1 = "APERSTripMine_Wire_Mag";
        };
        case 2: {
          phx_loadout_explosives = "APERSTripMine_Wire_Mag:2";
        };
        case 3: {
          phx_loadout_explosives = "SatchelCharge_Remote_Mag";
          phx_loadout_explosives_1 = "SLAMDirectionalMine_Wire_Mag:2";
          phx_loadout_explosives_2 = "ATMine_Range_Mag";
        };
      };
    };
  };
  case east: {
    _explosives = "phx_loadout_OPFORCharges" call BIS_fnc_getParamValue;
    if !(_explosives isEqualTo -1) then {
      switch (_explosives) do {
        case 0: {
          phx_loadout_explosives = "DemoCharge_Remote_Mag:4";
        };
        case 1: {
          phx_loadout_explosives = "DemoCharge_Remote_Mag:2";
          phx_loadout_explosives_1 = "APERSTripMine_Wire_Mag";
        };
        case 2: {
          phx_loadout_explosives = "APERSTripMine_Wire_Mag:2";
        };
        case 3: {
          phx_loadout_explosives = "SatchelCharge_Remote_Mag";
          phx_loadout_explosives_1 = "SLAMDirectionalMine_Wire_Mag:2";
          phx_loadout_explosives_2 = "ATMine_Range_Mag";
        };
      };
    };
  };
  case independent: {
    _explosives = "phx_loadout_INDFORCharges" call BIS_fnc_getParamValue;
    if !(_explosives isEqualTo -1) then {
      switch (_explosives) do {
        case 0: {
          phx_loadout_explosives = "DemoCharge_Remote_Mag:4";
        };
        case 1: {
          phx_loadout_explosives = "DemoCharge_Remote_Mag:2";
          phx_loadout_explosives_1 = "APERSTripMine_Wire_Mag";
        };
        case 2: {
          phx_loadout_explosives = "APERSTripMine_Wire_Mag:2";
        };
        case 3: {
          phx_loadout_explosives = "SatchelCharge_Remote_Mag";
          phx_loadout_explosives_1 = "SLAMDirectionalMine_Wire_Mag:2";
          phx_loadout_explosives_2 = "ATMine_Range_Mag";
        };
      };
    };
  };
};
