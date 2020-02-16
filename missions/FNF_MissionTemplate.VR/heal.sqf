waitUntil {!isNil "phx_safeStartEnabled"};
waitUntil {!phx_safeStartEnabled};

healAction = ["heal","Full Heal","",{
  params ["_target"];
  [_target] spawn {
    params ["_target"];
    player playMove "AinvPknlMstpSnonWnonDnon_medic1";
    sleep 8;
    [player, _target] call ace_medical_treatment_fnc_fullHeal;
  };
},{"ACE_personalAidKit" in (items player) && (alive _target)}] call ace_interact_menu_fnc_createAction;

["CAManBase", 0, ["ACE_MainActions"],healAction,true] call ace_interact_menu_fnc_addActionToClass;
