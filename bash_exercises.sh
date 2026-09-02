#!/bin/bash
###############################################################################
# COMP7044 — Systems Scripting in Cloud Computing
# Bash practice exercises with model answers.
# Prepared as a self-study reference for systems-scripting practice.
###############################################################################

# ── Exercise: conditional — check a file does NOT exist ────────────────────
# Write an `if` that checks that backup.tar.gz does NOT exist, and prints
# "backup not found" if so.
if [ ! -f "backup.tar.gz" ]; then
    echo "backup not found"
fi


# ── Exercise: loop over .txt files in the current folder ───────────────────
# Write a loop that goes through every .txt file in the current folder and
# prints each file's name.
for file in *.txt; do
    [ -e "$file" ] || continue
    echo "$file"
done


# ── Exercise: find PIDs by name and force-kill ──────────────────────────────
# How do you find the PID of every process with "python" in the name and
# kill it forcibly?
#   ps aux | grep python
#   kill -9 <PID>


# ── Exercise: permissions — octal notation ──────────────────────────────────
# What octal value gives: owner read+write+execute, group read+execute,
# others no permission?
#   chmod 750 arquivo   ->  owner=7 (rwx), group=5 (r-x), others=0 (---)


# ── Exercise (Lab 02 Ex.7 style): timestamped logging via cron ─────────────
# Write a script that appends a sentence with the current timestamp to
# log.txt. Schedule it with cron to run every 2 minutes.
log_timestamp() {
    echo "Script ran at: $(date '+%Y-%m-%d %H:%M:%S')" >> log.txt
}
log_timestamp

# Crontab entry to run this script every 2 minutes:
#   */2 * * * * /path/to/log_timestamp.sh


###############################################################################
# Reference syntax used throughout the exercises above
###############################################################################

# Script structure
# shebang: tells the system which interpreter to use
name="Ralphe"
echo "Hello, $name"
echo "Hello, ${name}!"        # braces help delimit the variable name
# chmod +x script.sh && ./script.sh to make executable and run
# NOTE: `nome = "Ralphe"` (with spaces around =) is a syntax error in bash.

# Conditionals
age=20
if [ "$age" -ge 18 ]; then
    echo "adult"
elif [ "$age" -ge 13 ]; then
    echo "teenager"
else
    echo "child"
fi

if [ -f "file.txt" ]; then echo "exists"; fi
if [ -d "/var/log" ]; then echo "directory exists"; fi

# Number comparisons:  -eq -ne -gt -lt -ge -le
# String comparisons:  =  !=  -z (empty)  -n (not empty)

# Loops
for i in 1 2 3 4 5; do
    echo "number $i"
done

for i in {1..10}; do
    echo $i
done

for file in /var/log/*.log; do
    [ -e "$file" ] || continue
    echo "processing: $file"
done

counter=0
while [ "$counter" -lt 5 ]; do
    echo "counter: $counter"
    counter=$((counter + 1))
done

# Functions and script arguments
greet() {
    echo "Hello, $1! You are $2 years old."
}
greet "Ralphe" 30

echo "Script: $0"
echo "First argument: ${1:-<none>}"
echo "All arguments: $*"
echo "Argument count: $#"

# Process management
#   ps aux                      # list running processes
#   ps aux | grep python
#   top / htop                  # interactive monitors
#   kill 1234                   # ask PID 1234 to terminate
#   kill -9 1234                # force (SIGKILL)
#   python3 script.py &         # run in background
#   nohup python3 script.py &   # survives terminal close
#   sudo systemctl status|start|stop|enable nginx

# Networking & SSH
#   ping -c 4 google.com
#   curl -O https://exemplo.com/arquivo.zip
#   curl -I https://exemplo.com          # headers only
#   wget https://exemplo.com/arquivo.zip
#   ss -tulpn / netstat -tulpn           # open ports/connections
#   chmod 400 minha-chave.pem            # REQUIRED before ssh with a .pem key
#   ssh -i minha-chave.pem ubuntu@1.2.3.4
#   ssh-keygen -t rsa -b 4096 -C "seu-email@exemplo.com"
