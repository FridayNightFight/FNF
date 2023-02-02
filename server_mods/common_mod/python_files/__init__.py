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

  response = requests.post(url, json=payload)

  if 200 <= response.status_code < 300:
    print(f"Webhook sent {response.status_code}")
  else:
    print(f"Not sent with {response.status_code}, response:\n{response.json()}")

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

  response = requests.post(url, json=payload)

  if 200 <= response.status_code < 300:
    print(f"Webhook sent {response.status_code}")
  else:
    print(f"Not sent with {response.status_code}, response:\n{response.json()}")
