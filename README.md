# oss-audit-24BCY10132

**Student Name:** Deep Deshmukh  
**Registration Number:** 24BCY10132  
**Course:** Open Source Software  
**Software Chosen:** Git  
**Environment:** Kali Linux  

---

## Scripts

### script1.sh — System Identity Report
Displays a system welcome screen showing the Linux distro, kernel version, current user, home directory, uptime, date, and OS license.  
**Concepts:** variables, command substitution `$()`, `echo`, output formatting.

### script2.sh — FOSS Package Inspector
Checks whether Git is installed on the system using `dpkg`, displays its version, and uses a `case` statement to print a short description of common FOSS packages.  
**Concepts:** `if/else`, `dpkg -l`, `grep`, `case` statement.

### script3.sh — Disk and Permission Auditor
Loops through key system directories (`/etc`, `/var/log`, `/home`, `/usr/bin`, `/tmp`) and reports the permissions and disk usage of each.  
**Concepts:** arrays, `for` loop, `ls -ld`, `du -sh`, `awk`.

### script4.sh — Log File Analyzer
Reads a log file line by line, counts how many lines contain a keyword, and prints the last 5 matching lines. Auto-detects available log files on Kali Linux.  
**Concepts:** `while IFS= read -r` loop, `if/then`, counter variables, command-line arguments `$1` `$2`, `grep`, `tail`.

### script5.sh — Open Source Manifesto Generator
Asks the user three interactive questions and generates a personalised open-source philosophy statement, saving it to a `.txt` file.  
**Concepts:** `read -p`, string interpolation, `>` and `>>` file redirection, `date` command.

---

## How to Run

### Requirements
- Linux system (Kali / Ubuntu / Debian)
- Bash shell
- Git installed (`sudo apt install git`)

### Steps

```bash
# Clone the repository
git clone https://github.com/deepdevee/oss-audit-24BCY10132.git
cd oss-audit-24BCY10132/scripts

# Make all scripts executable
chmod +x *.sh

# Run each script
./script1.sh
./script2.sh
./script3.sh
./script4.sh                            # auto-detects log file
./script4.sh /var/log/dpkg.log installed  # or pass your own log + keyword
./script5.sh
```

### Script 4 — extra examples
```bash
./script4.sh /var/log/auth.log failure
./script4.sh /var/log/dpkg.log installed
./script4.sh /var/log/kern.log warning
```

---

## Repository Structure

```
oss-audit-24BCY10132/
├── README.md
├── scripts/
│   ├── script1.sh
│   ├── script2.sh
│   ├── script3.sh
│   ├── script4.sh
│   └── script5.sh
└── report/
    └── report.pdf
```
