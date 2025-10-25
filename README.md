# 🤖 Codeforces Contest Reminder Bot

An automated bot that sends Pushbullet notifications for upcoming Codeforces contests.

## ✨ Features

- **Automatic Contest Detection** - Fetches upcoming contests from Codeforces API
- **Multiple Reminder Intervals** - 2 days, 1 day, 12h, 6h, 3h, 1h, 10min before contests
- **Pushbullet Notifications** - Mobile notifications via Pushbullet
- **Background Operation** - Runs continuously to monitor contests
- **Clean Date Formatting** - DD/MM/YY format for easy reading

## 🚀 Quick Start

### Prerequisites
- Python 3.7+
- Pushbullet account and API key

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/codeforces-reminder-bot.git
   cd codeforces-reminder-bot
   ```

2. **Create and activate virtual environment (recommended):**
   ```bash
   # Create virtual environment
   python -m venv venv
   
   # Activate virtual environment
   # On Windows:
   venv\Scripts\activate
   # On macOS/Linux:
   source venv/bin/activate
   ```

3. **Install dependencies:**
   ```bash
   pip install -r requirements.txt
   ```

4. **Set up Pushbullet:**
   - Get your API key from [Pushbullet.com](https://www.pushbullet.com/account)
   - Create a `.env` file:
     ```
     PUSHBULLET_API_KEY=your_api_key_here
     ```

5. **Run the bot:**
   ```bash
   # On Windows/Linux:
   python main.py
   # On macOS (if python3 is required):
   python3 main.py
   ```

## 📱 Pushbullet Setup

1. Create account at [pushbullet.com](https://www.pushbullet.com)
2. Install Pushbullet app on your phone
3. Get API key from account settings
4. Add API key to `.env` file

## 🔧 Configuration

The bot sends reminders at these intervals before each contest:
- 2 days before
- 1 day before  
- 12 hours before
- 6 hours before
- 3 hours before
- 1 hour before
- 10 minutes before

## 📁 Project Structure

```
codeforces-reminder-bot/
├── main.py              # Main bot logic
├── contests.py          # Codeforces API integration
├── push.py             # Pushbullet notifications
├── requirements.txt    # Python dependencies
├── .env               # API keys (create this)
└── README.md          # This file
```

## 🛠️ Usage

### Start the Bot
```bash
# On Windows/Linux:
python main.py
# On macOS (if python3 is required):
python3 main.py
```

### Background Operation
```bash
# On Windows/Linux:
nohup python main.py &
# On macOS:
nohup python3 main.py &
```

### Stop the Bot
Press `Ctrl+C` or kill the process

### Deactivate Virtual Environment
```bash
# When you're done working on the project:
deactivate
```

## 📊 Example Notifications

- **Bot Start**: "Codeforces reminder bot is activated - Next contest: Codeforces Round 123 on 15/12/24 20:05"
- **Reminders**: "Codeforces Round 123 starts in 1 day!"
- **Final Reminder**: "Codeforces Round 123 starts in 10 minutes!"

## 🤝 Contributing

Feel free to submit issues and enhancement requests!

## 📄 License

MIT License - feel free to use and modify as needed.

---

**Happy Coding! 🎉**
     