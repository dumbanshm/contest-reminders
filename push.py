from pushbullet import Pushbullet
import os

# Load API key from .env file
def load_env():
    if os.path.exists('.env'):
        with open('.env', 'r') as f:
            for line in f:
                if line.startswith('PUSHBULLET_API_KEY='):
                    return line.split('=', 1)[1].strip()
    return None

API_KEY = load_env() or os.getenv('PUSHBULLET_API_KEY')
if not API_KEY:
    raise ValueError("PUSHBULLET_API_KEY not found in .env file or environment variables")

pb = Pushbullet(API_KEY)

def send_notification(title, message):
    try:
        pb.push_note(title, message)
        print(f"Notification sent: {title}")
    except Exception as e:
        print(f"Notification failed: {e}")