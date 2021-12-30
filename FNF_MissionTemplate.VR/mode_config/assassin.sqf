/*
  By default, this game mode will make the defending side's HQ (3 slots) the HVTs.
  You can optionally set the desired units' variable name to "HVT_1", "HVT_2", etc to manually define them.
  You can use the default setting (_useDefaultPLTHQ = true) and manually add a unit variable in Editor to put 1 or more HVTs outside of PLTHQ.

  ALL HVTs SHOULD BE ON THE SAME SIDE (BLUFOR, OPFOR, OR INDEPENDENT)

  The format for _targets is:
    ["Target X", "Objective/Role Name", "Custom name for dogtags"]
*/

_useDefaultPLTHQ = true;
_targets = [
  ["Target 1", ["Platoon Leader", "Danny Carpenter"]],
  ["Target 2", ["Second-in-Command", "Gary Jones"]],
  ["Target 3", ["Medic", "Rick Porter"]],
  ["Target 4", ["Ambassador", "Jeremiah Anders"]]
];

// How many of the above targets must be killed for the attackers to win
_requiredKills = 3;
