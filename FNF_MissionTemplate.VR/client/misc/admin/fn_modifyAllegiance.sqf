/*
  Author: IndigoFox

  Description:
    Used to change Independent allegiance on the fly during FNF, in case they're improperly set by MM.

  Arguments:
    0: side that independent should be friendly to <SIDE>

  Returns:
    true on success <BOOLEAN>
*/

params [["_sideFriendly", sideEmpty, [sideEmpty]]];

// establish correct code based on _sideFriendly, and assume other sides should be hostile
phx_admin_FixedEncryptionCode = ""; // the side indfor should be able to talk to
switch (_sideFriendly) do {
  case west: {
    phx_admin_FixedEncryptionCode = "_bluefor";
  };
  case east: {
    phx_admin_FixedEncryptionCode = "_opfor"
  };
  case sideEmpty: {
    phx_admin_FixedEncryptionCode = "_indfor";
  };
};

// figure out the players whose radios need adjusting
private _playersToFix = (allPlayers select {alive _x && side _x == independent});

// send the code to the relevant clients
{
  (owner _x) publicVariableClient "phx_admin_FixedEncryptionCode";
} forEach _playersToFix;

// apply the radio changes clientside
{
  [{!isNil "phx_admin_FixedEncryptionCode"}, {
    if (call TFAR_fnc_haveSwRadio) then {
      [(call TFAR_fnc_activeSwRadio), phx_admin_FixedEncryptionCode] call TFAR_fnc_setSwRadioCode;
    };
    if (call TFAR_fnc_haveLRRadio) then {
      [(call TFAR_fnc_activeLrRadio), phx_admin_FixedEncryptionCode] call TFAR_fnc_setLrRadioCode;
    };
    phx_admin_FixedEncryptionCode = nil;
    diag_log formatText["[FNF] (admin) Fixed Independent side association."];
  }] call CBA_fnc_waitUntilAndExecute;
} remoteExecCall ["call", _playersToFix];

// apply friendlySides changes serverside
if (_sideFriendly isEqualTo sideEmpty) then {
  // if friendly to nobody, then everyone's an enemy
  {
    _x setFriend [independent, 0];
    independent setFriend [_x, 0];
  } forEach [west, east];
} else {
  // make enemy Side hostile to independent and vice versa
  {
    _x setFriend [independent, 0];
    independent setFriend [_x, 0];
  } forEach ([west, east] select {_x != _sideFriendly});

  // make independent friendly to _sideFriendly
  independent setFriend [_sideFriendly, 1];
  _sideFriendly setFriend [independent, 1];
};
phx_admin_FixedEncryptionCode = nil;
true
