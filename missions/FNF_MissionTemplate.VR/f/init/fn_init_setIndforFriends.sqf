_friends = "phx_indforFriends" call BIS_fnc_getParamValue;

if !(_friends isEqualTo -1) then {
  switch (_friends) do {
    case 0: {
      resistance setFriend [west, 1];
    };
    case 1: {
      resistance setFriend [east, 1];
    };
  };
};
