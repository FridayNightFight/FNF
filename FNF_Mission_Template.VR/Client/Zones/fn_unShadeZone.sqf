/*
	Author: Mallen

	Description:
		Removes a shading from the map by zone index

	Parameter(s):
    0: STRING -  The zone prefix used by the zone

	Returns:
		None
*/

params["_zonePrefix"];

_indexToDelete = -1;

{
  if (_x select 0 == _zonePrefix) then
  {
    _indexToDelete = _forEachIndex;
  }
} forEach fnf_trianglesToDraw;

if (_indexToDelete != -1) then
{
  fnf_trianglesToDraw deleteAt _indexToDelete;
};
