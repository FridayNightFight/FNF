/*
  By default, this game mode will make the defending side's HQ (3 slots) the HVTs.
  If more than 3 HVTs are desired, they will need to be manually identified by setting the var name (HVT_4, HVT_5, etc)
  You can optionally set the desired units' variable name to "HVT_1", "HVT_2", etc to manually define them which will override the PLTHQ selection.

  You can use the default setting (_useDefaultPLTHQ = true) and manually add a unit variable in Editor to select 1 or more HVTs outside of PLTHQ.

  If _useDefaultPLTHQ = false, only units with HVT_x var preset in Editor will be used.

  The format for _targets is:
    ["Target X", "Objective/Role Name", "Custom name for dogtags"]

  Target 1 is associated with HVT_1
  Target 2 is associated with HVT_2
  etc
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
