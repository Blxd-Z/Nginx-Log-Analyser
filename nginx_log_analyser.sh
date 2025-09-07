#!/bin/bash

if [ -e nginx-access.log ]; then

        echo "Top 5 IP addresses with the most requests:"
        awk '{print $1}' nginx-access.log |sort | uniq -c | sort -nr | head -n 5 | awk '{print $2, "- " $1,"requests"}'

        echo "Top 5 most requested paths: "
        awk '{print $7}' nginx-access.log |sort | uniq -c |sort -nr | head -n 5 | awk '{print $2, "-",$1, " requests"}'

        echo "Top 5 response status codes:"
        awk '{print $9}' nginx-access.log |sort | uniq -c |sort -nr | head -n 5 | awk '{print $2, "-",$1, " requests"}'
else

        echo "Nginx log file does not exist. Please download it from: https://github.com/Blxd-Z/Nginx-Log-Analyser"
        exit 1
fi
