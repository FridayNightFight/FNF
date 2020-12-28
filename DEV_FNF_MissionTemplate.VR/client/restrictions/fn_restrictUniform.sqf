/*
Disables access to removing helmet and uniform. Ensures that the player has the helmet and uniform that they started the game with.
*/

phx_playerUniform = uniform player;
phx_playerHead = headgear player;
phx_playerVest = vest player;

//Handle player not having the right uniform, vest, or helmet on
[{
  if !(uniform player isEqualTo phx_playerUniform) then {
    player forceAddUniform phx_playerUniform;
  };

  if !(headgear player isEqualTo phx_playerHead) then {
    removeHeadgear player;
    player addHeadgear phx_playerHead;
  };
  /*
  if !(vest player isEqualTo phx_playerVest) then {
    _items = vestItems player;
    removeVest player;
    player addVest phx_playerVest;
    {player addItemToVest _x} forEach _items;
  };
  */
} , 1] call CBA_fnc_addPerFrameHandler;

//Stop player from being able to take off gear
player addEventHandler ["inventoryOpened",{
  params ["_unit", "_container"];
  [] spawn {
    waitUntil {!(isNull (findDisplay 602))};

    //Uniform
    ((findDisplay 602) displayCtrl 6331) ctrlAddEventHandler ["mouseButtonDown", "ctrlEnable [6331, false];"];
    ((findDisplay 602) displayCtrl 6331) ctrlAddEventHandler ["mouseHolding", "ctrlEnable [6331, false];"];

    //Vest
    //((findDisplay 602) displayCtrl 6381) ctrlAddEventHandler ["mouseButtonDown", "ctrlEnable [6381, false];"];
    //((findDisplay 602) displayCtrl 6381) ctrlAddEventHandler ["mouseHolding", "ctrlEnable [6381, false];"];

    //Headgear
    ((findDisplay 602) displayCtrl 6240) ctrlAddEventHandler ["mouseButtonDown", "ctrlEnable [6240, false];"];
    ((findDisplay 602) displayCtrl 6240) ctrlAddEventHandler ["mouseHolding", "ctrlEnable [6240, false];"];
  };
}];
