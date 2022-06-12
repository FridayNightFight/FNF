# FNF World War II Mission Template

Steps:

1. Configure "config.sqf" in the root mission directory and the respective file for your chosen game mode in the "mode_config" directory.
2. Move the objectives to your wanted locations.
#### Do not delete any objects used for game mode objectives in the editor. Unused ones will be deleted by the server. The only objects that should be deleted are unused sides and units.
3. Move each side to their starting location and configure their start zone marker. BLUFOR and INDFOR have 2 separate platoon compositions. BLUFOR is Germany and Japan. INDFOR is USA and the UK. OPFOR is the Soviet Union. If you're using BLUFOR or INDFOR, you must delete whichever platoon composition is not used for your faction. That is, if you're using Germany, you need to delete the six squads marked as Japan. If you're using the USA, you need to delete the six squads marked as British. Platoon, Recon, Hotel and Golf groups are shared between the different platoon compositions. You can create multiple safe zones that players can teleport between by copying the original safe zone marker.
#### If you use multiple safe zones, make sure all of the side's assets are placed within the original safe zone marker. Do not place assets in the new zones as they will not be counted.
4. Delete any unwanted sides and their start zone marker.
5. Place vehicles and other assets that you wish to use. Make sure vehicles are placed within their side's safe zone marker.
6. Set the role description for crewed vehicles in order to have those roles selectable from the game lobby. For example, if you place a BTR-80 for OPFOR, name one of the OPFOR Golf teams something like: BTR-80 Commander@Golf 1, BTR-80 Driver@Golf 1, BTR-80 Gunner@Golf 1.
7. Delete the crew/pilot units for roles not present in your mission.
8. Configure mission start time, weather, etc.
9. Configure the play boundary trigger (zoneTrigger). This trigger has to be rectangular; ellipses are not supported. You can also create a zone boundary from a custom polygon by copy/pasting the marker "phx_zonePoly_1" to create the boundary. The boundary lines will be created in the order of the marker names. That is, a line will be drawn between phx_zonePoly_1 and phx_zonePoly_2, then between phx_zonePoly_2 and phx_zonePoly_3, etc.
10. Go in game, hit Escape, and click the button on the left side to generate the mission summary text. This will be copied to your clipboard. Make sure you change the attacker's advantage percentage (10% is a standard advantage).
#### Do not change any other Multiplayer settings. Only the mission summary should be edited.
11. Do a play-through of your mission from all sides to ensure the mission plays correctly. Check vehicle loadouts, make sure they are as you intended.

#### Air vehicles automatically get an action that allows the pilot to takeoff from any location (available once safe start ends). A runway isn't needed.
#### If you wish to add custom script or edit any template files other than the configuration files, let the FNF missions team know of your edits/additions.
