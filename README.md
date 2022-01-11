# Friday Night Fight Mission Framework

<p align="center">
  <a href="https://github.com/FridayNightFight/FNF/releases/latest">
    <img src="https://img.shields.io/github/v/release/FridayNightFight/FNF?style=plastic&label=version&sort=semver" alt="version">
  </a>
  <a href="null">
    <img src="https://img.shields.io/github/languages/code-size/FridayNightFight/FNF?style=plastic" alt="code size">
  </a>
  <a href="https://www.codefactor.io/repository/github/fridaynightfight/fnf">
    <img src="https://img.shields.io/codefactor/grade/github/FridayNightFight/FNF/master?style=plastic" alt="code quality">
  </a>
  <a href="https://github.com/FridayNightFight/FNF/graphs/contributors">
    <img src="https://img.shields.io/github/contributors/FridayNightFight/FNF?style=plastic" alt="contributors">
  </a>
  <br/>
  <a href="https://steamcommunity.com/sharedfiles/filedetails/?id=1551644814">
    <img src="https://img.shields.io/steam/collection-files/1551644814?label=required%20mods&logo=steam&style=plastic" alt="required mods collection">
  </a>
  <a href="https://steamcommunity.com/sharedfiles/filedetails/?id=1551644814">
    <img src="https://img.shields.io/steam/views/1551644814?logo=steam&style=plastic" alt="mod collection views">
  </a>
  <a href="https://steamcommunity.com/sharedfiles/filedetails/?id=1551644814">
    <img src="https://img.shields.io/steam/subscriptions/2100378754?logo=steam&style=plastic" alt="fnf mod subscriptions">
  </a>
  <br/>
    <a href="https://twitter.com/armafnf">
    <img src="https://img.shields.io/twitter/follow/armafnf?style=social" alt="twitter">
  </a>
  <br/>
  <a href="https://discord.gg/y4Rygfd">
    <img src="https://img.shields.io/discord/106475368495484928?logo=discord&style=social" alt="discord">
  </a>
  <br/>
</p>

<p align="center">
  <a href="https://steamcommunity.com/sharedfiles/filedetails/?id=1551644814">FNF Required Mods</a>
  <br/>
  <a href="https://docs.google.com/document/d/1D_3Bfv4CshksOpXxsbW0u-FJKxUTSga1gCSSDYjFcOg/edit?usp=sharing">FNF Mission Making Guide</a>
</p>

## USAGE
All configuration changes should be made in [config.sqf](FNF_MissionTemplate.VR/config.sqf)

Some options available for use are present in [configGuide.txt](FNF_MissionTemplate.VR/configGuide.txt)

## FEATURES
This framework includes the following features:

- preset editor units for ease of setup
- custom MissionInfo UI panel
- ACE Spectator, Fortify, Crew-served weapons, Trenches, Vehicle lock integration
- Discord webhook integration
- config-defined uniform and gear sets loaded at mission start / on-demand
- TFAR radio preset according to ORBAT structure + vehicle radio side association
- admin contact system
- support for TvT or 2v1 team Atk/Def modes, as well as TvT and TvTvT Neutral game modes


===ATK/DEF===
- adSector
- assassin
- captureTheFlag
- destroy
- rush
- uplink

===NEUTRAL===
- connection
- neutralSector
- scavHunt

and much more
