import time
from datetime import datetime, timedelta
from contests import get_upcoming_contests
from push import send_notification

def notify_next_contest():
    intervals = [
        timedelta(days=2),
        timedelta(days=1),
        timedelta(hours=12),
        timedelta(hours=6),
        timedelta(hours=3),
        timedelta(hours=1),
        timedelta(minutes=10)
    ]
    
    while True:
        upcoming = get_upcoming_contests()
        if not upcoming:
            print("No upcoming contests. Checking again in 6 hours...")
            time.sleep(21600)  # 6 hours
            continue
            
        next_contest = upcoming[0]
        now = datetime.now().astimezone()

        if next_contest["start_time"] <= now:
            print(f"Contest {next_contest['name']} has already started. Waiting for next contest...")
            time.sleep(60)
            continue
            
        print(f"Next contest: {next_contest['name']} at {next_contest['start_time_formatted']}")
        
        for interval in intervals:
            notify_time = next_contest["start_time"] - interval
            wait_seconds = (notify_time - datetime.now().astimezone()).total_seconds()
            
            if wait_seconds > 0:
                print(f"Waiting {wait_seconds/3600:.1f} hours for notification: {interval} before {next_contest['name']}")
                send_notification(f"Codeforces reminder bot is activated",
                f"The next contest is {next_contest['name']} on {next_contest['start_time_formatted']} the next notification will be sent in {wait_seconds/3600:.1f} hours")
                time.sleep(wait_seconds)
                send_notification(
                    "Codeforces Contest Reminder",
                    f"{next_contest['name']} starts in {interval}!"
                )
        
        # Wait until contest starts
        while datetime.now().astimezone() < next_contest["start_time"]:
            time.sleep(30)

if __name__ == "__main__":
    print("Codeforces Contest Reminder Bot Started")
    try:
        notify_next_contest()
    except KeyboardInterrupt:
        print("\nBot stopped.")