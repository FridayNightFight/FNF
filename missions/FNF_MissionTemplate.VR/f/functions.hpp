class init {
    file = "f\init";
    class init_server{};
    class init_server_preInitVars{preInit = 1;};
    class init_client{};
    class init_setupGame{};
    class init_shared{};
    class init_postBriefing{};
    class init_vehicleLocks_server{};
    class init_vars{preInit = 1;};
    class init_setIndforFriends{};
    class init_removeClientHandlers{};
};
class radios {
    file = "f\radios";
    class radio_genFreqs{};
    class radio_waitGear{};
    class radio_getChannels{};
    class radio_waitRadios{};
    class radio_setRadios{};
    class radio_cleanup{};
};
class endConditions {
    file = "f\endconditions";
    class end_clientWait{};
    class end_clientTime{};
    class end_checkTime{};
    class end_checkAlive{};
};
class loadout {
    file = "f\loadout";
    class loadout_set{};
    class loadout_notes{};
    class loadout_handleItems{};
    class loadout_handleClothing{};
    class loadout_handleGear{};
    class loadout_checkLoadout{postInit = 1;};
    class loadout_handleNV{};
    class loadout_handleCECharges{};
};
class misc {
    file = "f\misc";
    class _clearBody{};
    class _clearContainer{};
    class _hintThenClear{};
    class serverJIP{postInit = 1;};
    class clientJIP{postInit = 1;};
    //class disableCSpect{};
    class disableCJIP{};
    class disableCollisions{};
    class setTimeOfDay{};
    class setWeather{};
};
class ui {
  file = "f\ui";
  class gearSelector{};
  class removeSelectorHandlers{};
  class gearSelectorAdds{};
  class removeSelector{};
  class adminMenuAdds{};
};
class unflip {
	file = "f\misc\unflip";
	class unflipVehicle {};
	class unflipVehicleAddAction {};
};
