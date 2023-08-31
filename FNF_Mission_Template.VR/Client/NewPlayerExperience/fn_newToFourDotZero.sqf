/*
	Author: Mallen

	Description:
		starts text box's and light info for players new to 4.0 ()

	Parameter(s):
		None

	Returns:
		None
*/
[{time > 1},{
  "Tutorial" hintC "Hi there! our systems show that you haven't played before on the new framework version 4.0.0 or higher, there are some major differences to the previous versions of FNF that we think it would be useful for you to know!";
  hintC_EH1 = findDisplay 72 displayAddEventHandler ["Unload", {
	  _this spawn {
		  hintSilent "";
      "Objectives" hintC "The first major change you may have noticed is that the original gamemode options are no longer a thing! now to know what objectives you have to complete you must check your tasks in your map, this will explain the objective and show roughly where it is on the map";
      hintC_EH2 = findDisplay 72 displayAddEventHandler ["Unload", {
	      _this spawn {
		      hintSilent "";
          "Radios" hintC "Another major change is how your radios are setup, from now on your left ear will be your squad or team radio that you can access on your short range radio (Usually CAPS), and command net or the higher level radio will always be in your right ear and exclusivly on your long range radio (Usually CTRL + CAPS)";
          hintC_EH3 = findDisplay 72 displayAddEventHandler ["Unload", {
	          _this spawn {
		          hintSilent "";
              "Safe Zones and Play Zones" hintC "The final Major change is that safe zones and play zones are now per player and may not be the same for everyone, make sure you check the breifing for any unique safe zones or play zones for your fellow team mates!";
              hintC_EH4 = findDisplay 72 displayAddEventHandler ["Unload", {
	              _this spawn {
		              hintSilent "";
                  "Thank you!" hintC "And that should be everything! if you have any further questions feel free to ask on the FNF Discord and if you think any thing has gone wrong in mission dont forget to press ESC and use the Contact Staff button!";
                  hintC_EH5 = findDisplay 72 displayAddEventHandler ["Unload", {
	                  _this spawn {
		                  hintSilent "";
                      _this select 0 displayRemoveEventHandler ["Unload", hintC_EH5];
	                  };
                  }];
                  _this select 0 displayRemoveEventHandler ["Unload", hintC_EH4];
	              };
              }];
              _this select 0 displayRemoveEventHandler ["Unload", hintC_EH3];
	          };
          }];
          _this select 0 displayRemoveEventHandler ["Unload", hintC_EH2];
	      };
      }];
      _this select 0 displayRemoveEventHandler ["Unload", hintC_EH1];
	  };
  }];
},[]] call CBA_fnc_waitUntilAndExecute;
