#!/bin/bash

echo "🔄 Setting up auto-start on boot..."

# Create LaunchAgent plist
mkdir -p ~/Library/LaunchAgents

cat > ~/Library/LaunchAgents/com.devansh.codeforces-reminder-bot.plist << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.devansh.codeforces-reminder-bot</string>
    <key>ProgramArguments</key>
    <array>
        <string>/usr/bin/python3</string>
        <string>/Users/devansh/Everything/Academics/DevDaddy/Projects/cf reminders/main.py</string>
    </array>
    <key>WorkingDirectory</key>
    <string>/Users/devansh/Everything/Academics/DevDaddy/Projects/cf reminders</string>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
    <key>StandardOutPath</key>
    <string>/tmp/codeforces-bot.log</string>
    <key>StandardErrorPath</key>
    <string>/tmp/codeforces-bot-error.log</string>
</dict>
</plist>
EOF

# Load the service
launchctl load ~/Library/LaunchAgents/com.devansh.codeforces-reminder-bot.plist

echo "✅ Auto-start configured!"
echo ""
echo "📋 Commands to manage the service:"
echo "   Start:   launchctl start com.devansh.codeforces-reminder-bot"
echo "   Stop:    launchctl stop com.devansh.codeforces-reminder-bot"
echo "   Status:  launchctl list | grep codeforces"
echo "   Logs:    tail -f /tmp/codeforces-bot.log"
