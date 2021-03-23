//set current charges to default from laodout init
phx_selector_currentExplosives = phx_loadout_explosives;

phx_selector_fnc_explosives = {
  private _expArr = _this;

  if (_expArr isEqualTo phx_selector_currentExplosives) exitWith {};

  private _missing = false;

  {
    private ["_expClass","_expCount"];

    //make sure player has all old charges to be able to add new ones
    if (_forEachIndex != 0) then {
      if (_x find ":" != -1) then {
        _expClass = _x splitString ":" select 0;
        _expCount = parseNumber (_x splitString ":" select 1);
      } else {
        _expClass = _x;
        _expCount = 1;
      };

      if ({_x == _expClass} count magazines player < _expCount) then {
        _missing = true;
      };
    };
  } forEach phx_selector_currentExplosives;

  //removes old charges and adds new ones if player still has old ones
  if (!_missing) then {
    {
      player removeMagazines (_x splitString ":" select 0);
    } forEach phx_selector_currentExplosives;

    {
      if (_forEachIndex != 0) then {
        _x call phx_fnc_addGear;
      };
    } forEach _expArr;

    format ["Charge loadout changed to:\n %1", _expArr select 0] call phx_fnc_hintThenClear;

    phx_selector_currentExplosives = _expArr;
  } else {
    "Missing items" call phx_fnc_hintThenClear;
  };
};

//charges actions
{
  _action = ["Explosives_Selector",_x select 0,"",{
    (_this select 2) call phx_selector_fnc_explosives;
  },{true}, {}, _x] call ace_interact_menu_fnc_createAction;
  [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector","Explosives_Selector"], _action] call ace_interact_menu_fnc_addActionToClass;
} forEach phx_selector_explosives;
