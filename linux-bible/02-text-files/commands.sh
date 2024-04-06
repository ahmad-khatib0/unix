
# -i runs locate as root.. locate finds files and directories containing the dir_color text string.
locate -i dir_color;

# -ls A long listing (ownership, permission, size, and so on) is printed
find $HOME -ls;

# direct standard errors to /dev/null (if you do not have permission to run find on a folder) .
# To do that, add the following to the end of the command line: 2> /dev/null. The 2> redirects 
# standard error to the next option (in this case /dev/ null, where the output is discarded).

# -iname match any combination of upper and lowercase
find /etc -iname '*passwd*';

# Finding files by size
find /bigdata -size +500M -size -5G -exec du -sh {} \;;

# Finding files by user
find /home \( -user chris -or -user joe \) -ls;
find /var/spool -not -user root -ls;

# ANY files or directories with exactly rwxr-xr-x permission are matched
find /usr/bin -perm 755 -ls;
# ONLY files that have write permission for user, group, and other are matched
find /home/chris/ -perm -222 -type d -ls;  
# 144503 4 drwxrwxrwx 8 chris chris 4096 Jun 23 2014 /home/chris/OPENDIR

# /222, any file that has write permission turned on for the user, group, or other
find /myreadonly -perm /222 -type f;
# 685035 0 -rw-rw-r-- 1 chris chris 0 Dec 30 16:34 /myreadonly/abc
# 
find . -perm -002 -type f -ls;
# 266230 0 -rw-rw-rw- 1 chris chris        0 Dec 30 16:28 ./LINUX_BIBLE/abc

# see what has changed in the past 10 minutes (e.g changed conf file and you can't remember which one):
find /etc/ -mmin -10; # (-amin, -cmin, and -mmin)

# e.g search the system to see if any commands have had their ownership or permissions 
# changed in the past three days:
find /bin /usr/bin /sbin /usr/sbin -ctime -3; # (-atime, -ctime, and -mtime)

# ■■ You want to find files in your FTP server (/var/ftp) and web server (/var/www)
# that have not been accessed in more than 300 days so that you can see if any need to be deleted:
find /var/ftp /var/www -atime +300;

# find files that are owned by either joe or chris.
find /var/allusers \( -user joe -o -user chris \) -ls;
find /var/allusers/ -user joe -not -group joe -ls;
find /var/allusers/ -user joe -and -size +1M -ls;

# run a command on each found ( or using the   -ok instead of -exec )
find /etc -iname passwd -exec echo "I found {}" \;

# find and sort
find /usr/share -size +5M -exec du {} \; | sort -nr;

# find and confirm to move the found files
find /var/allusers/ -user joe -ok mv {} /tmp/joe/ \;hh;

# or -i case-insensitive
grep desktop /etc/services;

# don’t contain a selected text
grep -vi tcp /etc/services;

# To do recursive searches, use the -r option and a directory as an argument
grep -rli peerdns /usr/share/doc/;
grep -ri --color root /etc/sysconfig/;

