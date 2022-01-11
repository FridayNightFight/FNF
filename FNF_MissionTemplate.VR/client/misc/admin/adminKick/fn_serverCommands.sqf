_commands = _this;

if (_commands select 0 == "kick") then
{
  "llcooljiscool" serverCommand format ["#kick %1", _commands select 1];
};
if (_commands select 0 == "ban") then
{
  "llcooljiscool" serverCommand format ["#exec ban %1", _commands select 1];
};
