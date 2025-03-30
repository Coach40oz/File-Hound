File Hound 👻
File Hound is a powerful PowerShell-based file searching tool designed to help you quickly locate files across multiple drives with a ghost-themed interface.
🔍 Features

Multi-Drive Scanning: Search across all drives or select specific ones
Interactive Interface: User-friendly ghost-themed console interface with colored output
Flexible Search Options: Find files by name, partial name, or extension
Deep Search: Recursive directory scanning for thorough results
Progress Tracking: Real-time scanning progress indicator
Results Export: Save search results to CSV for further analysis
File Location Access: Directly open folders containing discovered files

📋 Requirements

Windows operating system
PowerShell 5.1 or higher
Administrator privileges (recommended for full drive access)

💻 Installation & Execution
Option 1: Direct Execution from GitHub
Launch PowerShell as Administrator and run:
powershellCopyirm https://raw.githubusercontent.com/Coach40oz/File-Hound/main/File-Hound.ps1 | iex
Option 2: Manual Download and Execution

Download the File-Hound.ps1 file to your computer
Ensure PowerShell execution policy allows script execution:

powershellCopySet-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process

Run the script:

powershellCopy.\File-Hound.ps1
📖 How to Use
Running File Hound

Launch PowerShell (Administrator recommended)
Execute using one of the methods above
Follow the interactive prompts

Search Options
File Hound offers an intuitive interface with the following options:

File Name: Enter the name or part of the name (wildcards supported)

setup - Finds files named exactly 'setup'
set* - Finds files starting with 'set' (setup, setting, etc.)
*install* - Finds any file with 'install' in the name


File Extension: Specify file extension (.txt, .log, .exe, etc.)
Drive Selection: Choose specific drives or scan all available drives
Deep Search: Automatically searches through all subdirectories
Result Export: Save findings to CSV for documentation and analysis

🔮 Understanding the Output
File Hound displays results in a clear, tabular format showing:

Full file path location
File size (in KB)
Last modified date
Creation date

Results are color-coded for easy identification, and you can directly access file locations with the built-in file selector.
🛠️ Advanced Features
Progress Tracking

PowerShell progress bar shows scanning status for each drive
Visual feedback helps track search progress through large drives

CSV Export

Save comprehensive search results to your Desktop
CSV includes file location, size, and date information
Easily importable to Excel or other analysis tools

Open File Location

Select files from search results to view their location
Files are highlighted in Windows Explorer for easy identification

⚠️ Known Issues

Some special characters in filenames may cause display issues
Very deep directory structures may take longer to search
System files and protected directories may be skipped without admin privileges

🔒 Security Note
This tool is designed for legitimate file searching purposes. Always ensure you have appropriate permissions when searching system directories.
✅ Troubleshooting

No Files Found: Try using wildcards (*) or check drive selection
Slow Performance: Narrow your search to specific drives
Access Denied: Run PowerShell as Administrator for full access
Export Errors: Check if you have write permissions to the Desktop

🔄 Version History

Version 1.0.0 - Initial release (March 2025)

📝 License
This tool is released under the MIT License.
CopyMIT License
Copyright (c) 2025 Coach40oz

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
👻 Author
Coach40oz - Development and design
