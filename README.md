# Mission files for FNF

Note: If this is your first mission, or one of your first, it is recommended that you keep the mission fairly simple (light assets, uncomplicated terrain, daytime, etc.) until you get a good feel for how players tend to play the missions at FNF.

Steps:

1. Configure "config.sqf" in the root mission directory and the respective file for your chosen game mode in the "mode_config" directory.
2. Move the objectives to your wanted locations.
- Do not delete any objective objects in the editor. Unused ones will be deleted by the server.
3. Move your wanted sides to their starting location and configure their start zone marker.
4. Delete any unwanted sides and their start zone marker.
5. Place vehicles and other assets if you wish.
6. Set the role description for crewable vehicles in order to have those roles selectable from the game lobby. For example, if you place a BTR-80 for OPFOR, name one of the OPFOR Echo teams something like: BTR-80 Commander, BTR-80 Driver, BTR-80 Gunner, and delete the unused units. Humvees and UAZs are not crewed vehicles and should not have dedicated crews present.
7. Delete the crew/pilot units for roles not present in your mission.
8. Configure mission start time, weather, etc.
9. Configure the play boundary trigger (zoneTrigger).
10. Set the Lobby Summary (Attributes > Multiplayer > Lobby > Summary ) to include the attacking & defending sides, the player-count ratio for the mission, and the assets available to each side. You don't need to include transport vehicles. Example: ATK:DEF OPF:BLU - 25% OPF adv - OPF: 1x BTR-80, 1x UAZ DShKM - BLU: 1x M113 M2, 1x UH-60M
- Do not change any other Multiplayer settings
11. Do a quick play-through of your mission from all sides to make sure that there are no weird bugs or interactions not visible in 3den editor.
12. Export your mission to MP to create a mission .pbo and send that file over to FNF Staff (default export location is in MPMissions folder in root Arma directory).
