# 2.4.2

- #123 allows mission makers to set Bravo & Delta MATs separately per side, as well as missile/rocket counts
- #123 adds pictures of MAT weaponry
- #123 adds MM-chosen loadout info page to diary >> Mission Details >> Mission Variables
- #123 renames diary >> Mission Details >> Vars to Mission Variables
- #123 adds configured game mode-specific victory conditions/info to Mission Variables
- #123 adds ability for MMs to add detailed briefing information to their missions
- #126 adds the ability for NVG goggles to remain active when looking down primary sniper optic

# 2.4.1-hotfix.1

- fixes radio ORBAT issue

# 2.4.1

- adds vehicle locking system
- fixes 2 medic inits
- cba settings update
- rpk config fix
- fixes to webhooks

# v2.4.0

#98 Implements major ORBAT change
#97 Adds Discord embeds in general channel of Discord to report round status
#95 Adds the ability for players to contact staff (connected via notification and other via Discord) using in-game GUI from pause menu
#108 Adds the ability to choose a CBA fleximenu instead of ACE Self-Interact for loadout selection during SafeStart (CBA Settings)
#108 Adds a customizable (default Ctrl-F12) CBA Keybind to hide UI elements for gameplay / spectator
#100 Adds chance to kill or randomize damage & eject players in a vehicle upon its destruction

# v2.3.2

## Changes

#85 Formal deployment of ScavHunt game mode
Adds the ability to hide HUD items while playing (Map > Utilities > Screenshots/UI)
Cargo containers now auto-marked
INDFOR weapons now have Ball_89 AP ammo to be more competitive with other factions -- tracers to be updated via config
Kill counter UI box removed -- OCAP2 is primary source of kill tracking, please use that if interested
Tweaks to ACE Spectator: now delays 3 seconds after death before entering Spectator, and starts focused on your killer
CTF defenders can now pick up the flag, but only if it has been dropped inside of the capture zone they're trying to defend

## Fixes

#87 Issue with player's side changing // seeing enemies marked on map after they had surrendered at least once
#88 ScavHunt cap zones not hidden at game start
Unit level ACE Performance Factor settings overriding CBA configured stamina settings removed
Fixes issue with flag in CTF not being kept at ground level after being destroyed
Fixes issue with CTF overtime condition not triggering properly

# v2.3.0-beta-1

Fixed:

- Fixed wrong unflip action icon path

Added:

- Template version to admin briefing
- New uniform sets: UNIFORM_BUNDESWEHR, UNIFORM_HELLENIC_ARMY, UNIFORM_RUSSIAN_SPETSNAZ, UNIFORM_RUSSIAN_RATNIK, UNIFORM_SOVIET_AFGHAN, UNIFORM_SOVIET_WINTER, UNIFORM_RUSSIAN_SPRING, UNIFORM_M88, UNIFORM_JUNGLE, UNIFORM_RANGER, UNIFORM_PARAMILITARY, UNIFORM_WEST_POLICE, UNIFORM_EAST_POLICE, UNIFORM_IND_POLICE
- New weapon sets: WEAPONS_FAL_COLDWAR, WEAPONS_M14, WEAPONS_SOVIET
- Added black base uniform sets
- CEs can choose between thermite and frag grenades
- FNF mod was updated with 2 Eden object attributes for use with this template update. Auto-clear vehicle inventory (default enabled) and exclude object from auto-mark script (default disabled)
- Added CUP plants to blacklist for automatic objects marking script
- Added a few new variables that you can use to prevent the uniform base sets from overwriting a uniform set. Details in "client\loadout\uniforms\README.MD"
- Added player FNF Staff icons
- Added player commander icons
- Added player squad leader icons
- Added side assets lists to game briefing
- Added a beta version of a sat-style preview of the game objectives (admin-triggered only for now)
- Admin GUI to choose a winner and end the game

Changed:

- Changed color of objective markers to match the defending side and to no longer conflict with the object auto-mark script marker color
- Disabled the Commanding Menu
- Fortify objects (besides sandbags and planks) can no longer be placed in buildings or above terrain level. Now needs to be touching the terrain
- Slight increase of default fortify budget to 125
- CTF defenders can no longer pick up the flag

# v2.2.2

1. Fixed UNIFORM_OEF_CP and UNIFORM_M93_WOODLAND uniform sets not having a vest
2. Added READMEs for the uniform and weapon sets
3. Added 2 uniform sets, SOVIET_CSAT and ALTIS_LIZARD
4. Added defender fortify points to the briefing vars
5. Increased the cost of most fortify objects
6. Set ACE role specialty attributes via template script rather than unit attributes
7. Fixed spectating units spawning in sector area being counted towards the sector defense
8. Fixed medic slot error. Wrong variable type for ACE medic class
9. Fixed hidden spectating units appearing on BFT

# v2.2.1

1. Fixed recon team rifleman role not being defined, causing the role to be unplayable
2. Kill counter display moved to not block point display
3. Mission-placed objects marking system won't mark objects within the attacker's start zone or any start zone if game mode is neutral

# v2.2.0

1. Cleaned up some loadout fncs and loadout sets.
2. Weapon sets can now be freely assigned as there is not a forced base set anymore.

# v2.2.0-rc2

Added:

1. Support for custom civilian units. Using the class "C_man_1". The loadout of the civilian role will remain whatever it is in the editor. If the unit has a radio, the frequency will be preset to one used by all civilians.
2. Kill counter that will be displayed when you die or the game ends. Uses the last damage source of a unit to figure out the killer.
3. Config variable for adding NVGs to units. Also adds laser to player's weapon if compatible.
4. Config variable for allowing players to select magnified optics.
5. Combat engineers can now select between different charge loadouts. Currently 2x satchels or 4x m112 demo blocks or 2 AP mines and 2 flare mines or 2 M15 AT mines.
6. Added a system to automatically mark mission-placed objects if they are large enough.

Changed:

1. Staggered load (black screen loadout stagger) won't run if fewer than 60 players on server.
2. Player loadout roles are now accessible via global variables.
3. Combat engineers are given thermite grenades instead of frags
4. Rewrite of gear selector system. Allows player to choose between different weapons with different compatible magazines if defined in the used weapons loadout.
5. Streamlined the uniform and weapon sets. Each uniform set has a base where backpacks, pilot and crew helmets are defined, so very few things need to be defined when creating a new uniform set. Player now has a base weapon set that is always called depending on their side. Other weapon sets overwrite the base, so very few things need to be defined when creating a new weapon set.
6. Mission time remaining now accounts for admin changes in the safe start time.
7. Function for restricting uniform changes won't run when testing the mission locally.
8. Time allowed outside of the start boundary towards the end of safestart is now maximum 1 second.
9. Renamed the default weapon sets in the mission config.
10. Accounted for CTF flag being dropped over water. Will now sit at water surface at location it was dropped.
11. Added new terrains to automatic fortification color function.
12. Automatic selection of UGL ammo type so it doesn't need to be defined in the weapons loadouts.
13. MAT classes in the briefing tab will show the display name of the class, rather than the classname.
14. Increased default fortify currency to 100.
15. Misc small changes.

Fixed:

1. Misc small fixes.

Removed:

1. Old weapon and uniform sets from mods no longer used.
2. USMC weapon set with M27 for the AR as it was never used.
3. Automatic invincibility of objective buildings. Mission maker will have to set the building invincible if they want it to be or account for the different damage states of the building to make sure access to the objective is still possible.

# v2.1.0c-hotfix.1

1. Fixes mission timer on all display sizes
2. Custom objects placed by mission makers are now automatically marked.

# v2.1.0c

Fixed Army OCP uniform set having raven backpacks.

# v2.1.0b

Removed old uniform and weapons sets.

# v2.1.0a

Fixed missing '('

# v2.1.0

Added:

1. Added rangecard to marksman
2. Added road restriction for ACEX fortify placements
3. Added tasks to CTF game mode, task lists flag capture time

Changed:

1. Changed medic blood loadout to 12x 500ml & 4x 250ml
2. Reduced neutral sector mode overtime condition point lead from 25 to 20

Fixed:

1. Fixed staggered load function running too quickly causing all players to get gear at same time
2. Fix TFAR speak volume UI not updating to whisper at mission start
3. Fix server nil var, unimportant

# v2.1.0_rc2

1. Fixed remove respawn button function

# v2.1.0_rc1

Added:

1. Added view distance cap to vars diary record
2. Readded staggered load, new function
3. Added the mission time remaining to the map UI. Opening the map after safe start ends will show the mission time left display. Time left display still forced on at 15 mins left.
4. Added a HandleChatMessage event handler to stop displaying player connect, disconnect, time out, etc. messages. Will add option to enable/disable this feature soon.
5. Added a 5 minute timer for the neutral sector mode until points will be added after the first sector is captured. Will help prevent sector rushing.
6. Added 12 new uniform sets
7. Added an M27-based USCM weapon set

Changed:

1. Renamed client init function
2. Renamed client game setup function
3. Separated main loadout function into two, fnf_initLoadout sets vars, fnf_setLoadout adds gear
4. Rewrote client time left UI function to use CBA PFH rather than spawn
5. Better method for figuring out if the auto-gamma restriction should run
6. Changed view distance restriction back to view distance, rather than object view distance
7. Changed almost all server and client code to run unscheduled
8. CTF flag capture zone will now be shown to spectators
9. Changed the rush game mode terminal timers to pause, rather than restart
10. Terminal times will now only be updated every 5 seconds, rather than 1 second to reduce net traffic. Will update every second once timer is less than 10
11. Increased time you have to get back into the starting zone if you exit
12. Made sure that there is space for the player vehicle before teleporting back into the start zone

Removed:

1. Removed bandolier vest from Guerilla uniform set
2. Removed cover map and area modules from mission.sqm that were used for the mission boundary. Handled via server script now
3. Removed extra INDFOR marksmen

Fixed:

1. Fix MGTL not having ETool
2. Fix TLs not having smoke and flare GLs

# v2.0.0

1. Rewrite/restructure of backend
2. Many other small tweaks and changes, too many to list here

# v1.1.2a

1. small tweaks

# v1.1.2

1. Added cable ties to loadouts
2. Added PLA uniform sets and 1 weapon set
3. Fix spectator not seeing destroy obj 3d icons
4. Few tweaks

# v1.1.1e

1. Changed 1 server-side public variable that was an array to client-side. Per BI Feedback Tracker discussion this may cause network issues.

# v1.1.1d

1. Allow for tabbed-out load in
2. Fix bug with destroy overtime end message
3. Started work on a backpack-on-chest feature
4. Tweakz

# v1.1.1c

1. Fix Guerilla weapon set forcing MAT assistant to have RPG rounds regardless of config setting
2. Make custom weapons sets a bit easier to make

# v1.1.1b

1. Few bug fixes and tweaks

# v1.1.1a

1. Fix uniforms not showing in diary
2. Fix clients being able to sometimes destroy the building an obj is inside of
3. adSector sector markers will rotate with the trigger

# v1.1.1

1. Fix briefing uniforms not showing
2. Restrict trench placement when near objectives and near roads (20m from objs)
3. Make it clear in ORBAT that Golf squad is a vehicle squad
4. Show mission status to spectators - i.e., sector control score
5. Slightly raised allowed number of character corpses to 50
6. Allow destroy game mode to automatically end to overtime condition
7. Don't move destroy objective markers at mission start if objectives are already inside markers

# v1.1.0a

1. Fix repair issues
2. Better uniform/helmet brief vars
3. Disable leader actions until further testing
4. Many tweaks

# v1.1.0

1. Increased engineer repair threshold
2. Better typing restriction
3. Added server-side kick for players without loadout set
4. Few fixes and tweaks
5. Fix admin safe time change causing server var to be nil
6. Likely fix for some players not having radios preset
7. Removed everything from editor units but uniforms

# v1.0.3c

1. Fix for allPlayers command not able to be used until mission start. Using BIS_fnc_listPlayers instead.

# v1.0.3b

1. Fix for fortify remove refunding money on remote clients

# v1.0.3a

1. Fix for fortify tool not being in CE inventory after loadout set
2. Added some more fortifications

# v1.0.3

1. Better staggered load. Only functions that cause network load will be staggered (loadout, radios).
2. Player check for staggered load. Will occur with player count > 50. May help prevent uniform/vest rendering bug as well.

# v1.0.2b

1. Prevent game admin from accidently setting safe start time too low

# v1.0.2a

1. Fix for aircraft being able to get out of the start zone if over water

# v1.0.2

1. Added diary record for admin to increase/decrease safe start time
2. BLUFOR default LAT weapon changed to LAW
3. OPFOR/INDFOR default LAT weapon changed to RPG-26
4. Added AFK check and config value to enable/disable it. If player doesn't press a key for 10 minutes a warning will be displayed. After 30 seconds the player will be killed if they don't press a key
5. Added FNF staff to whitelist of players that can always use the chat
6. Increased QS icons update time from 1 second to 2 seconds to improve map/gps performance
7. Made all vehicle team members engineers (mission.sqm update)
8. Added overtime win conditions for each game mode and diary records with overtime condition information
9. Client mission time left value will sync with the server every minute
10. Increased GRAD trenches placement time

# v1.0.1a

1. corpse manager tweaks

# v1.0.1

1. changed color of 1 orbat squad
2. corpse manager min distance = 0
3. added missing rifleman to INDFOR C2
4. fixed bug that would set destroy obj to be invincible if it was a building

# v1.0.0

1. removed cba_settings file, forced server-side now
2. added more colors for orbat squads
