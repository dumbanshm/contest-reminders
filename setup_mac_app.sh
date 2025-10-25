#!/bin/bash

echo "🤖 Creating Codeforces Reminder Bot Mac App..."

# Create app bundle structure
mkdir -p "Codeforces Reminder Bot.app/Contents/MacOS"
mkdir -p "Codeforces Reminder Bot.app/Contents/Resources"

# Create executable script
cat > "Codeforces Reminder Bot.app/Contents/MacOS/Codeforces Reminder Bot" << 'EOF'
#!/bin/bash
cd "/Users/devansh/Everything/Academics/DevDaddy/Projects/cf reminders"
python3 main.py
EOF

# Make executable
chmod +x "Codeforces Reminder Bot.app/Contents/MacOS/Codeforces Reminder Bot"

# Create Info.plist
cat > "Codeforces Reminder Bot.app/Contents/Info.plist" << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleExecutable</key>
    <string>Codeforces Reminder Bot</string>
    <key>CFBundleIdentifier</key>
    <string>com.devansh.codeforces-reminder-bot</string>
    <key>CFBundleName</key>
    <string>Codeforces Reminder Bot</string>
    <key>CFBundleVersion</key>
    <string>1.0</string>
    <key>CFBundleShortVersionString</key>
    <string>1.0</string>
    <key>CFBundlePackageType</key>
    <string>APPL</string>
    <key>CFBundleSignature</key>
    <string>????</string>
</dict>
</plist>
EOF

echo "✅ Mac app created successfully!"
echo ""
echo "📱 Next steps:"
echo "1. Drag 'Codeforces Reminder Bot.app' to your Applications folder"
echo "2. Drag it to your Dock for easy access"
echo "3. Double-click to run the bot"
echo ""
echo "🔄 For auto-start on boot, run:"
echo "   ./setup_autostart.sh"
