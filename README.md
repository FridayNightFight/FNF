# FNF World War II Mission Template

Steps:

1. Configure "config.sqf" in the root mission directory and the respective file for your chosen game mode in the "mode_config" directory.
2. Move the objectives to your wanted locations.
##### Do not delete any objective objects in the editor. Unused ones will be deleted by the server. The only objects that should be deleted are unused sides and units.
3. Move each side to their starting location and configure their start zone marker.
4. Delete any unwanted sides and their start zone marker.
5. Place vehicles and other assets that you wish to use. Make sure vehicles are placed within their side's safe zone marker.
6. Set the role description for crewed vehicles in order to have those roles selectable from the game lobby. For example, if you place a BTR-80 for OPFOR, name one of the OPFOR Golf teams something like: BTR-80 Commander@Golf 1, BTR-80 Driver@Golf 1, BTR-80 Gunner@Golf 1.
7. Delete the crew/pilot units for roles not present in your mission.
8. Configure mission start time, weather, etc.
9. Configure the play boundary trigger (zoneTrigger). This trigger has to be rectangular; ellipses are not supported.
10. Go in game, hit Escape, and click the button on the left side to generate the mission summary text. This will be copied to your clipboard. Make sure you change the attacker's advantage percentage (10% is a standard advantage).
##### Do not change any other Multiplayer settings. Only the mission summary should be edited.
11. Do a play-through of your mission from all sides to ensure the mission plays correctly.

##### If you wish to add custom script or edit any template files other than the configuration files, let the FNF missions team know of your edits/additions.
