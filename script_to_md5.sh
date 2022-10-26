#!/bin/bash

#crontab entry would be /0 * * * * /home/blue/script_to_md5.sh

#!/bin/bash

#we start by storing the command to get all users in a variable
output_script=$(cat /etc/passwd)

#then we store the hashed value in /current_users file
echo $(echo $output_script | md5sum) > /var/log/current_users



#let's monitor the current_users file for changes using inotyfywait
while inotifywait -e close_write /var/log/current_users; do echo "$date files changed"; done

# Then run ./script_to_md5.sh
