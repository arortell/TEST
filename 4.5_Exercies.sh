#Count README files in /usr/share/doc'
 find /usr/share/doc -name 'README' | wc -l
#!/bin/bash


# makes sure there is one argument
#if [ $# -ne 1 ]; then
#  echo "usage: []./files_containing arg]"
#fi

# 1) Display a list of all the users on your system who log in with the Bash shell as a default.
grep "bash" /etc/profile

# 2) From the /etc/group directory, display all lines starting with the string "daemon".
grep "^daemon" /etc/group

# 3) Print all the lines from the same file that don't contain the string.
grep -v "daemon" /etc/group

#4) Display localhost information from the /etc/hosts file, display the line number(s) matching the search string and count the number of occurrences of the string.
grep -nc "localhost" /etc/hosts

# 5) Display a list of /usr/share/doc subdirectories containing information about shells.
 find /usr/share/doc -name bash

# 6) How many README files do these subdirectories contain? Don't count anything in the form of "README.a_string".
 find /usr/share/doc -name 'README*' | wc -l
										↓
#							This covers README.md files and other extensions

# 7) Make a list of files in your home directory that were changed less that 10 hours ago, using grep, but leave out directories.
 ls -algG --time-style=+%s | grep ^[^d] | awk -vlimit=$(date +%s -d '10 hours ago') '$4 > limit { print substr($0, index($0, $4) + length($4) + 1) }'




# searches entire filesystem for directories containing files taht match $1
echo "print all directoies that contain a file with shell in the name"
sudo find / -type f -name 'shell' | sed -r 's|/[^/]+$||' |sort |uniq

# count them
echo ''
echo Counts the files that contain shell in the name
echo "Count:  $(sudo find / -type f -name 'shell' | wc -l)"


#Count Number of lines in /etc/hosts that contain localhost 
echo ''
echo "Count lines that contain localhost" 
grep -n 'localhost' /etc/hosts | wc -l


#display all lines staring with daemon /etc/hosts 
echo ''
echo "Lines that start with daemon"
grep '^daemon' /etc/group

 # display users logged in with bash shell 
echo ''
echo "users logged in with bash"
grep 'bash' /etc/passwd

echo ''
echo "Count lines of file with grep"
grep -c ^ /etc/passwd

echo ''
echo "Count lines of file with wc"
wc -l /etc/passwd

echo ''
echo "List locally mounted filesystems"
grep '/dev/*' /etc/fstab

echo ''
echo "check /etc/passwd for user bl4ckr41n"
grep 'bl4ckr41n' /etc/passwd

echo '' 
 #find all files in /etc that contain numbers in their name 
 sudo find / -type f -name  '[0-9]' | sed -r 's|/[^/]+$||' |sort |uniq
