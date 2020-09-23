phx_playerUniform = uniform player;
phx_playerHead = headgear player;
//phx_playerVest = vest player;


//Handle player not having the right uniform or helmet on
[{
  if !(uniform player isEqualTo phx_playerUniform) then {
    player forceAddUniform phx_playerUniform;
  };

  if !(headgear player isEqualTo phx_playerHead) then {removeHeadgear player; player addHeadgear phx_playerHead};
  //if !(vest player isEqualTo phx_playerVest) then {removeVest player; player addVest phx_playerVest};
} , 1] call CBA_fnc_addPerFrameHandler;

//Delete uniform/helmet if removed by player, will be readded via above PFH
player addEventHandler ["Put", {
	params ["_unit", "_container", "_item"];
  _remove = false;

  if (_item isEqualTo phx_playerUniform) then {
    _remove = true;
  };
  /*if (_item isEqualTo phx_playerVest) then {
    _remove = true;
  };*/
  if (_item isEqualTo phx_playerHead) then {
    _remove = true;
  };

  if (_remove) then {
    [_container, _item] call CBA_fnc_removeItemCargo;
    "Soldier, how will the enemy know who to shoot?!" call phx_fnc_hintThenClear;
  };
}];
