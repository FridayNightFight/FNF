# Friday Night Fight Mission Framework

<p align="center">
  <a href="https://github.com/FridayNightFight/FNF/releases/latest">
    <img src="https://img.shields.io/github/v/release/FridayNightFight/FNF?style=plastic&label=version&sort=semver" alt="version">
  </a>
  <a href="https://github.com/FridayNightFight/FNF/releases/latest">
    <img src="https://img.shields.io/github/languages/code-size/FridayNightFight/FNF?style=plastic" alt="code size">
  </a>
  <a href="https://github.com/FridayNightFight/FNF/releases/latest">
    <img src="https://img.shields.io/github/license/FridayNightFight/FNF?style=plastic" alt="code size">
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
  <a href="https://steamcommunity.com/sharedfiles/filedetails/?id=1551648858">
    <img src="https://img.shields.io/steam/collection-files/1551648858?label=optional%20clientside%20mods&logo=steam&style=plastic" alt="optional clientside mods collection">
  </a>
  <br/>
  <a href="https://docs.google.com/document/d/19-7s9YslwOBQ_sjh1Gi7y9NhOfRzHSYqqd7MKQXNI1A/edit?usp=sharing">
    <img src="https://img.shields.io/badge/GDocs-FNF%20Rules%20and%20Policies-orange?style=plastic&logo=#4285F4" alt="fnf rules and policies">
  </a>
  <a href="https://docs.google.com/document/d/1D_3Bfv4CshksOpXxsbW0u-FJKxUTSga1gCSSDYjFcOg/edit?usp=sharing">
    <img src="https://img.shields.io/badge/GDocs-FNF%20Mission%20Making%20Guide-orange?style=plastic" alt="fnf mission making guide">
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
