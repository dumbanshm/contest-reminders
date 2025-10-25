import requests
from datetime import datetime, timezone

def get_upcoming_contests():
    CONTEST_LIST_URL = "https://codeforces.com/api/contest.list?gym=false"
    response  = requests.get(CONTEST_LIST_URL)
    data = response.json()
    contests = data["result"]

    upcoming  = sorted([c for c in contests if c["phase"] == "BEFORE"], key = lambda c: c["startTimeSeconds"])
    formatted = []
    for c in upcoming:
        dt = datetime.fromtimestamp(c["startTimeSeconds"], timezone.utc).astimezone()
        formatted.append({
        "name" : c["name"],
        "start_time" : dt,
        "start_time_formatted" : dt.strftime("%d/%m/%y %H:%M"),
        "duration_hours" : c["durationSeconds"]/3600
        })
    return formatted

