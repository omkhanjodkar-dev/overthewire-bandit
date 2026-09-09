# OverTheWire Bandit Helper & Auto-Connector

A lightweight, terminal-friendly CLI tool that automates the SSH connection to OverTheWire Bandit levels and tracks your progress and passwords.

---

## 🚀 Features

- **Automated SSH Connection**: Automatically launches `ssh -p 2220 bandit<N>@bandit.labs.overthewire.org`.
- **Automatic Clipboard Copying**: When connecting to a level where the password is known, it automatically copies the password to your clipboard (`clip.exe`). Just right-click or press `Ctrl+V` / `Ctrl+Shift+V` at the password prompt!
- **Level Progression Loop**: Once you solve a level and type `exit` to end your SSH session, the tool immediately prompts for the new password, saves it, and can jump straight into the next level.
- **Password Vault**: All discovered passwords are automatically saved in `bandit_progress.json` and mirrored in a human-readable `passwords.txt`.
- **Jump to Any Level**: Easily switch between levels, replay previous challenges, or manually update passwords.

---

### Windows
- **Option 1**: Double-click `play.bat` in File Explorer.
- **Option 2**: Run in terminal / PowerShell:
  ```powershell
  python bandit.py
  ```

### Kali Linux / Linux VM
1. Open a terminal in the project folder.
2. Run directly with Python:
   ```bash
   python3 bandit.py
   ```
   *Or make the launcher executable and run it:*
   ```bash
   chmod +x play.sh
   ./play.sh
   ```
3. *(Recommended for auto-clipboard)* Install `xclip`:
   ```bash
   sudo apt update && sudo apt install -y xclip
   ```

---

## 📋 Menu Options

1. **Connect & Play current level**: Connects you to your active level via SSH.
2. **Select a different level**: Jump back or forward to any specific level (e.g., 0 to 34).
3. **View all saved passwords**: Displays a table of all the levels and passwords you have saved.
4. **Add or edit a password manually**: Update or enter a password for any level.
5. **Reset all progress**: Resets your progress back to level 0.
0. **Exit**: Exit the program.

---

## 💡 Pro-Tips for Bandit

- Level 0's password is pre-configured as `bandit0`.
- When inside an SSH session, find the password using Linux commands. Once you have it, copy it to your clipboard.
- Type `exit` or press `Ctrl+D` to leave the SSH session. The script will catch you and ask for the new password.
- You can always inspect `passwords.txt` to view your solved passwords.
