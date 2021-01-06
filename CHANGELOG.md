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
3. Separated main loadout function into two, phx_initLoadout sets vars, phx_setLoadout adds gear
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
