from datetime import datetime
import requests

def roundStart(missionName, gamemode, staffNum, bluforNum, opforNum, indforNum, spectatorNum, url):

  playing = int(bluforNum) + int(opforNum) + int(indforNum)

  fields = [{
    "name": "Mission name",
    "value": missionName,
    "inline": "false"
  },
  {
    "name": "Game Mode",
    "value": gamemode,
    "inline": "false"
  },
  {
    "name": "Playing",
    "value": playing,
    "inline": "true"
  },
  {
    "name": "Spectators",
    "value": spectatorNum,
    "inline": "true"
  },
  {
    "name": "Staff",
    "value": staffNum,
    "inline": "true"
  },
  {
    "name": "BLUFOR Players",
    "value": bluforNum,
    "inline": "true"
  },
  {
    "name": "OPFOR Players",
    "value": opforNum,
    "inline": "true"
  },
  {
    "name": "INDFOR Players",
    "value": indforNum,
    "inline": "true"
  }]

  embed = {
    "description": "Safe start has ended and the game is underway!",
    "title": "Round has started!",
    "fields": fields,
    "timestamp": datetime.utcnow().strftime('%Y-%m-%dT%H:%M:%S.000Z'),
    "color": "65280"
    }

  payload = {"embeds": [embed]}

  requests.post(url, json=payload)

def roundEnd(missionName, endMessage, gamemode, playersRemaining, missionDuration, bluforNum, opforNum, indforNum, url):

  fields = [
  {
    "name": endMessage,
    "value": "Check out the AAR [here](http://aar.fridaynightfight.org/)\n\nMission feedback can be submitted [here](https://forms.gle/R43PA6B21SJNcikC6)",
    "inline": "false"
  },
  {
    "name": "Mission name",
    "value": missionName,
    "inline": "false"
  },
  {
    "name": "Game Mode",
    "value": gamemode,
    "inline": "true"
  },
  {
    "name": "Players Connected",
    "value": playersRemaining,
    "inline": "true"
  },
  {
    "name": "Mission Duration",
    "value": missionDuration,
    "inline": "true"
  },
  {
    "name": "BLUFOR Players",
    "value": bluforNum,
    "inline": "true"
  },
  {
    "name": "OPFOR Players",
    "value": opforNum,
    "inline": "true"
  },
  {
    "name": "INDFOR Players",
    "value": indforNum,
    "inline": "true"
  }]

  embed = {
    "title": "Round has ended!",
    "fields": fields,
    "timestamp": datetime.utcnow().strftime('%Y-%m-%dT%H:%M:%S.000Z'),
    "color": "16711680"
    }

  payload = {"embeds": [embed]}

  requests.post(url, json=payload)

def adminAction(atID, playerName, description, side, role, missionName, mapName, grid, timeElapsed, url):
  description = description.split("\\n")
  stringOut = ""
  for string in description:
    stringOut = stringOut + string + "\n"
  description = stringOut[:-1]
  fields = [{
    "name": "Assigned Side",
    "value": side,
    "inline": "true"
  },
  {
    "name": "Role",
    "value": role,
    "inline": "true"
  },
  {
    "name": "Mission Name",
    "value": missionName,
    "inline": "false"
  },
  {
    "name": "Map Name",
    "value": mapName,
    "inline": "true"
  },
  {
    "name": "Grid Location",
    "value": grid,
    "inline": "true"
  },
  {
    "name": "Mission Time Elapsed",
    "value": timeElapsed,
    "inline": "true"
  }]

  embed = {
    "description": description,
    "title": "Message from " + playerName,
    "fields": fields,
    "timestamp": datetime.utcnow().strftime('%Y-%m-%dT%H:%M:%S.000Z'),
    "color": "16776960"
    }

  payload = {"embeds": [embed], "content": atID}

  requests.post(url, json=payload)
