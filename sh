#!/bin/bash

# Function to send email notification
send_notification() {
    local email_address="$1"
    local subject="$2"
    local message="$3"
    echo "$message" | mail -s "$subject" "$email_address"
}

# Define threshold for filesystem usage
THRESHOLD=80

# Check filesystem usage percentage
filesystem_usage=$(df -h /monitor | awk 'NR==2 {print $5}' | cut -d'%' -f1)

# If usage is greater than threshold, proceed to check and delete log files
if [ $filesystem_usage -gt $THRESHOLD ]; then
    # Find and delete log files older than 5 days
    find /monitor/splunk/var/log/splunk -type f -mtime +5 -exec rm -f {} \;

    # Send notification that filesystem is under threshold
    email_address="your_email@example.com"
    subject="Filesystem Usage Alert"
    message="The filesystem usage on /monitor is $filesystem_usage%. Log files older than 5 days have been deleted."
    send_notification "$email_address" "$subject" "$message"
fi
