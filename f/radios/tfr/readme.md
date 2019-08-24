#radios
This module sets up player's radios for them.

`fn_radio_genFreqs` - First the server generates random numbers for each team and broadcasts them to clients. These random numbers are used as the base frequency upon which all other frequencies are generated for the teams. 

`fn_radio_waitGear` - As the frequencies are being broadcast the players will have scripts checking to see if they have received their gear as well as the base frequencies from the server. When they get their gear they will check to see if any items in their gear will be changed into TFAR radios once the mission actually starts. If any are present their type is saved for later and then the next script is started.

`fn_radio_getChannels` - This script checks the player's side and then uses that sides base frequency for the rest of the operations. The player's group is checked for a variable, which is set up by the `setGroupID` module, that contains it's frequency settings. These settings are read from a variable and extracted to a few different variables. These variables are then checked and if they exist a note is created in the player's briefing containing the default channel setup of the player's radio. Then the next script is started.

`fn_radio_waitRadios` - This script waits until the player's gear turns into TFAR radios. It uses TFAR functions to see if any TFAR radios have been assigned and uses the earlier variables from `fn_radio_waitGear` to check to see if everything was setup as expected. Once it's set up and the mission progresses past the briefing screen it starts the next script.

`fn_radio_setRadios` - This script uses the settings determined earlier to set up the player's TFAR radio and then broadcasts a message that it has been completed. Once it's done, it runs the final script.

`fn_radio_cleanup` - This script cleans up all global variables that were set because why not? Nothing happens after that.
***
###Configure
All radio settings are determined by the definitions in the `setGroupIDs` module.

###Disable
In `'/f/init/fn_init_client.sqf'` remove the line :
```phx_radHandle1 = [phx_fnc_radio_waitGear, 0.1, []] call CBA_fnc_addPerFrameHandler;```

and in `'/f/init/fn_init_server.sqf'` remove the line:
```call phx_fnc_radio_genFreqs;```
You will also need to edit a line in the `'f\briefing'` folder. See the readme file in that folder for more information.
