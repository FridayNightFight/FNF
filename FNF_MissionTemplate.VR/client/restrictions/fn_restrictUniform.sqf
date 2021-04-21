/*
Disables access to removing helmet and uniform. Ensures that the player has the helmet and uniform that they started the game with.
*/

if (isServer) exitWith {}; //Don't need to run this function for local testing

private _playerUniform = uniform player;
private _playerHead = headgear player;
private _playerVest = vest player;

//Handle player not having the right uniform, vest, or helmet on
[{
  params ["_args","_handle"];
  _args params ["_playerUniform","_playerHead","_playerVest"];

  if !(uniform player isEqualTo _playerUniform) then {
    player forceAddUniform _playerUniform;
  };

  if !(headgear player isEqualTo _playerHead) then {
    removeHeadgear player;
    player addHeadgear _playerHead;
  };
  /*
  if !(vest player isEqualTo _playerVest) then {
    _items = vestItems player;
    removeVest player;
    player addVest _playerVest;
    {player addItemToVest _x} forEach _items;
  };
  */
}, 5, [_playerUniform, _playerHead, _playerVest]] call CBA_fnc_addPerFrameHandler;

//Stop player from being able to take off gear
player addEventHandler ["InventoryOpened",{
  [{!(isNull (findDisplay 602))}, {
    //Uniform
    ((findDisplay 602) displayCtrl 6331) ctrlAddEventHandler ["mouseButtonDown", "ctrlEnable [6331, false];"];
    ((findDisplay 602) displayCtrl 6331) ctrlAddEventHandler ["mouseHolding", "ctrlEnable [6331, false];"];

    //Vest
    //((findDisplay 602) displayCtrl 6381) ctrlAddEventHandler ["mouseButtonDown", "ctrlEnable [6381, false];"];
    //((findDisplay 602) displayCtrl 6381) ctrlAddEventHandler ["mouseHolding", "ctrlEnable [6381, false];"];

    //Headgear
    ((findDisplay 602) displayCtrl 6240) ctrlAddEventHandler ["mouseButtonDown", "ctrlEnable [6240, false];"];
    ((findDisplay 602) displayCtrl 6240) ctrlAddEventHandler ["mouseHolding", "ctrlEnable [6240, false];"];
  }, [], 5] call CBA_fnc_waitUntilAndExecute;
}];
