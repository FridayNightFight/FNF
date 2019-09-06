gearAction = player addaction ["<t size='1.5'><t color='#ff0a0a'>Gear Selector</t>",{createdialog "GearSelector";},nil,1.5,false,false,"","_this == _target"];

if (pRole == 7 && !("phx_loadout_allowCESelector" call BIS_fnc_getParamValue isEqualTo 1)) then {
  explosiveSelected = 0;
  explosiveFirstSel = false;
  explosivesClasses = ["SatchelCharge_Remote_Mag","DemoCharge_Remote_Mag","APERSTripMine_Wire_Mag","SLAMDirectionalMine_Wire_Mag","ATMine_Range_Mag"];
};

explosivesSelectorEnabled = true;
opticSelected = 0;
grenadeSelected = 0;
opticFirstSel = false;
grenadeFirstSel = false;

selectorEnabled = true;

while {selectorEnabled} do {
  waitUntil {!isNull findDisplay 2000};

  call phx_fnc_gearSelectorAdds;

  waitUntil {isNull findDisplay 2000};
};
