from .threading_utils import call_slow_function
import gspread
from google.oauth2.service_account import Credentials

def time_submit(stage, carNumber, startTime, penalty, adminName, endTime):
	SCOPES = ["https://www.googleapis.com/auth/spreadsheets", "https://www.googleapis.com/auth/drive"]

	creds = Credentials.from_service_account_file("C:/Program Files (x86)/Steam/steamapps/common/Arma 3/@server_mod/python_files/credentials.json", scopes=SCOPES)

	client = gspread.authorize(creds)

	spreadsheet = client.open("Timing Input")

	worksheet = spreadsheet.worksheet("Timings")

	row = [stage, 0, carNumber, startTime, penalty, adminName, endTime]

	worksheet.append_row(row)

def call_slow_time_submit(stage, carNumber, startTime, penalty, adminName, endTime):
	return call_slow_function(time_submit, (stage, carNumber, startTime, penalty, adminName, endTime))

def review_submit(missionName, author, reviewArray):
	SCOPES = ["https://www.googleapis.com/auth/spreadsheets", "https://www.googleapis.com/auth/drive"]

	creds = Credentials.from_service_account_file("C:/Program Files (x86)/Steam/steamapps/common/Arma 3/@server_mod/python_files/credentials.json", scopes=SCOPES)

	client = gspread.authorize(creds)

	spreadsheet = client.open("Mission Review Submissions")

	worksheet = spreadsheet.worksheet("Reviews")

	for x in reviewArray:

		row = [missionName, author, x[0], x[1][0], x[1][1], x[1][2]]

		worksheet.append_row(row)

def call_slow_review_submit(missionName, author, reviewArray):
	return call_slow_function(review_submit, (missionName, author, reviewArray))
