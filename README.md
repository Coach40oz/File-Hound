File Hound 👻

File Hound is a powerful PowerShell-based file searching tool designed to help you quickly locate files across multiple drives with a ghost-themed interface.

🔍 Features

Multi-Drive Scanning: Search across all drives or select specific ones
Interactive Interface: User-friendly ghost-themed console interface with colored output
Flexible Search Options: Find files by name, partial name, or extension
Deep Search: Option for recursive directory scanning
Progress Tracking: Real-time scanning progress with visual indicators
Results Export: Save search results to CSV for further analysis
File Location Access: Directly open folders containing discovered files

📋 Requirements

Windows operating system
PowerShell 5.1 or higher
Administrator privileges (recommended for full drive access)

💻 Installation & Execution
Direct Execution from GitHub
You can run File Hound directly from GitHub with this command:

Launch PowerShell and run:
```irm https://github.com/Coach40oz/File-Hound/blob/main/File%20Hound.ps1 | iex```

Manual Download and Execution

Download the File Hound.ps1 file to your computer
Ensure PowerShell execution policy allows script execution:
powershellCopySet-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process

Run the script:
powershellCopy.\File` Hound.ps1


📖 How to Use
Running File Hound

Launch PowerShell (Administrator recommended)
Execute using one of the methods above
Follow the interactive prompts

Search Options
File Hound offers an intuitive interface with the following options:

File Name: Enter the name or part of the name (wildcards supported)
File Extension: Specify file extension (.txt, .log, .exe, etc.)
Drive Selection: Choose specific drives or scan all available drives
Deep Search: Enable for recursive searching through all subdirectories
Result Export: Save findings to CSV for documentation and analysis

🔮 Understanding the Output
File Hound displays results in a clear, tabular format showing:

Full file path location
File size
Last modified date
Creation date

Results are color-coded for easy identification, and you can directly access file locations with the built-in folder opener.
🛠️ Advanced Features
Visual Progress Tracking

Real-time progress indicators for each drive being searched
Clear visual feedback during deep searches

CSV Export

Save comprehensive search results to your Desktop
Includes all file metadata for further analysis

Open File Location

Directly access folders containing found files
Seamless integration with Windows Explorer

⚠️ Known Issues

Some special characters in filenames may cause display issues
Very deep directory structures may take longer to search
System files and protected directories may be skipped without admin privileges

🔒 Security Note
This tool is designed for legitimate file searching purposes. Always ensure you have appropriate permissions when searching system directories.
✅ Troubleshooting

No Files Found: Try using wildcards (*) or check if deep search is enabled
Slow Performance: Narrow your search to specific drives or disable deep search
Access Denied: Run PowerShell as Administrator for full access
Export Errors: Check if you have write permissions to the Desktop

📝 License
This tool is released under the MIT License.
👻 Author
Coach40oz - Development and design

MIT License
Copyright (c) 2025 Coach40oz
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
