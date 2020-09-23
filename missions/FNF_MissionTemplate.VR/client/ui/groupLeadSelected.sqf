switch (actionSelected) do {
  case 0: {
    if !(playerSelected isEqualTo 0) then {
      [[name player,getPosATL player,player],{
        cutText [format["Teleporting to %1", _this select 0],"BLACK OUT"];
        sleep 3;
        player setPos ((_this select 1) findEmptyPosition [2,25,typeOf player]);
        player setDir (player getDir (_this select 2));
        sleep 0.5;
        cutText ["","BLACK IN"];
      }] remoteExec ["BIS_fnc_spawn", playerSelected, false];
    };
  };//Teleport to you
  case 1: {
    if !(playerSelected isEqualTo 0) then {
      _display = findDisplay 5000;
      if (!isNull _display) then {
        _display closeDisplay 1;
      };

      cutText [format["Teleporting to %1", name playerSelected],"BLACK OUT"];
      sleep 3;
      player setPos ((getPosATL playerSelected) findEmptyPosition [2,30,typeOf player]);
      player setDir (player getDir playerSelected);
      sleep 0.5;
      cutText ["","BLACK IN"];
    };
  };//Teleport to
  case 2: {
    [[name player,getPosATL player,player],{
      if (pRole == 0 || !(player == leader (group player)) || (player distance (_this select 1) <= 10)) exitWith {};
      cutText [format["Teleporting all group leaders to %1", _this select 0],"BLACK OUT"];
      sleep 3;
      player setPos ((_this select 1) findEmptyPosition [2,30,typeOf player]);
      player setDir (player getDir (_this select 2));
      sleep 0.5;
      cutText ["","BLACK IN"];
    }] remoteExec ["BIS_fnc_spawn", playerSide, false];
  };//Teleport group leaders to you
  case 3: {
    [[name player,getPosATL player,player],{
      if (pRole == 0 || (player distance (_this select 1) <= 10)) exitWith {
        if !(pRole == 0) then {
          5 call TFAR_fnc_setVoiceVolume;
          TF_speak_volume_level = "whispering";
          "Voice volume set to whisper" call phx_fnc_hintThenClear;
        }
      };
      cutText [format["Teleporting all players to %1 for briefing", _this select 0],"BLACK OUT"];
      sleep 5;
      5 call TFAR_fnc_setVoiceVolume;
      TF_speak_volume_level = "whispering";
      "Voice volume set to whisper" call phx_fnc_hintThenClear;
      player setPos ((_this select 1) findEmptyPosition [5,100,typeOf player]);
      player setDir (player getDir (_this select 2));
      sleep 0.5;
      cutText ["","BLACK IN"];
    }] remoteExec ["BIS_fnc_spawn", playerSide, false];
  };//Teleport all players to you
};
