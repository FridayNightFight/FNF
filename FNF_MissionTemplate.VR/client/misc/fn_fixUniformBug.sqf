/*
    Name: phx_fnc_fixUniformBug

    Author(s):
		Ezhuk

    Description:
        ReEquip player to fix uniform bug. Donated by the WMT A3 community.

    Parameters:
        0: PLAYER

    Returns:
        NONE
*/

params ["_unit"];

if not (isNull (vestContainer player)) then
{
    private ["_vest", "_vestItems", "_vestMagazines"];
    _vest = vest _unit;
    _vestItems = vestItems _unit;
    _vestMagazines = magazinesAmmoCargo (vestContainer _unit);
    removeVest _unit;

    _unit addVest _vest;
    {
        if not (isClass (configFile >> "cfgMagazines" >> _x)) then
        {
            _unit addItemToVest _x;
        };
    } foreach _vestItems;
    {
        (vestContainer player) addMagazineAmmoCargo [_x select 0, 1, _x select 1];
    } foreach _vestMagazines;
};

//===========================

if not (isNull (uniformContainer player)) then
{
    private ["_uniform", "_uniformItems", "_uniformMagazines"];
    _uniform = uniform _unit;
    _uniformItems = uniformItems _unit;
    _uniformMagazines = magazinesAmmoCargo (uniformContainer _unit);
    removeUniform _unit;

    _unit forceAddUniform _uniform;
    {
        if not (isClass (configFile >> "cfgMagazines" >> _x)) then
        {
            _unit addItemToUniform _x;
        };
    } foreach _uniformItems;

    {
        (uniformContainer player) addMagazineAmmoCargo [_x select 0, 1, _x select 1];
    } foreach _uniformMagazines;
};
