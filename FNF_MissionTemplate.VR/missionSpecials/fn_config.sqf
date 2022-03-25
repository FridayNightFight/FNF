if !(isServer) exitWith {};

/////////////////////////////////////////////////////
// CONFIGURE HERE //
/////////////////////////////////////////////////////

_settings = [
  ["ambientAirdrop", [
    false, // is enabled
    false, // items are required to reach ground/intact/usable -- will condense the drop and ensure all arrive in zone. designed for function over ambience
    false, // hide markers from players that were placed as reference in editor
    0, // delay in seconds from mission start before beginning (planes will take ~30 seconds to arrive)
    [ // drop targets
      [
        west,
        [

        ]
      ],
      [
        east,
        [

        ]
      ]
    ]
  ]],
  ["ambientArtillery", [
    false, // is enabled
    [ // targets
      [
        ["_startDelay", 10], // time delay before rounds start falling
        ["_target", [500, 500, 0]], // artillery target (<position> [500,500,0], <object> vehicle1, or <string> "artyMarker1")
        ["_mag", "Sh_82mm_AMOS"], // ammo to use
        ["_radius", 200], // radius of fire
        ["_rounds", 15], // number of rounds
        ["_delay", [5, 10]], // Number: delay in seconds OR Array: [min delay, max delay]
        ["_conditionEnd", {false}], // special condition to end firing early
        ["_safeZone", 0], // radius of internal safezone around target which rounds won't fire at
        ["_spawnAlt", 250], // altitude
        ["_speed", 150] // speed of fall in m/s, LOWER THIS FOR FLARES (1-5)
      ]
    ]
  ]]
];





/////////////////////////////////////////////////////
// INFORMATION //
/////////////////////////////////////////////////////
/*

// AMBIENT AIRDROP //

This tool will let you place 1 or more markers on the map for spots you want an airdrop to happen in.
OPFOR markers will use Antonov AN-2s. BLUFOR markers will use C-130Js.
The items dropped will be a mix of boxes and barrels to represent general logistics supplies.
Recommended marker names:
  fnf_ambientAirdrop_east_N | (OPFOR)
  fnf_ambientAirdrop_west_N | (BLUFOR)

[ // drop targets
  [
    west,
    [
      [3, 750, "fnf_ambientAirdrop_west_1", 90, [ // 3 planes will drop cargo in a 750 meter radius around the fnf_ambientAirdrop_west_1 marker flying at a 90 degree heading // number of planes to spawn adds lateral spread to the formation - keep this in mind
        ["CargoNet_01_box_F", 15], ["CargoNet_01_barrels_F", 15] // will attempt to drop 15 boxes and 15 barrels total
      ]]
    ]
  ],
  [
    east,
    [
      [4, 750, "fnf_ambientAirdrop_east_1", 270, [
        ["CargoNet_01_box_F", 20], ["CargoNet_01_barrels_F", 15] // will attempt to drop 20 boxes and 30 barrels total
      ]],
      // [4, 270, [1000, 800], 750, [
      //   ["CargoNet_01_box_F", 20], ["CargoNet_01_barrels_F", 15]
      // ]] // 4 planes will drop cargo in a 750 meter radius around position [1000, 800] flying at a 270 degree heading
    ]
  ]
]



// AMBIENT ARTILLERY //

This will simulate artillery fire at a specific location with optional delay and other parameters you can customize.

[ // targets
  [
    [500, 500, 0], // artillery target (position, object, or string)
    "Sh_82mm_AMOS", // ammo to use
    200, // radius of fire
    15, // number of rounds
    [5, 15], // Number: delay in seconds OR Array: [min delay, max delay]
    {false}, // special condition to end firing early
    0 // radius of internal safezone around target which rounds won't fire at
  ]
]



*/




/////////////////////////////////////////////////////
// DO NOT MODIFY BELOW THIS LINE //
/////////////////////////////////////////////////////

// [_settings, false] call CBA_fnc_hashCreate;
// fnf_missionSpecials = [_settings] call CBA_fnc_deserializeNamespace;

[{getClientStateNumber > 9}, {
  private _settings = _this;

  private _activatedSpecials = [];
  {
    _x params ["_key", "_value"];
    if (_value#0) then {
      _activatedSpecials pushBack _key;
      _fnc = missionNamespace getVariable format["fnf_missionSpecials_fnc_%1", _key];
      _value call _fnc;
    };
  } forEach _settings;

  if (count _activatedSpecials > 0 && is3DENPreview) then {
    format["[FNF] [PreviewOnly] Active specials: %1", _activatedSpecials] remoteExec ["systemChat", 0, true];
  };
}, _settings] call CBA_fnc_waitUntilAndExecute;
