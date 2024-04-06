
# Listing processes
ps -u; 
# TTY represent which terminal is running this proceses
# STAT: with R indicating a currently running process and S representing a sleeping process
# VSZ (virtual set size) shows the size of the image process (in kilobytes)
# RSS (resident set size) shows the size of the program in memory.
# The VSZ and RSS sizes may be different because VSZ is the amount of memory allocated for the 
# process, whereas RSS is the amount that is actually being used. RSS memory represents physical 
# memory that cannot be swapped.
# START shows the time the process began running
# TIME shows the cumulative system time used. (0:00 means haven’t even used a whole second of CPU time.)

# the current user
ps ux | less;

#  all processes running for all users on your system
ps aux | less;

# filter the columns
ps -eo pid,user,uid,group,gid,vsz,rss,comm | less;

# the highset
ps -eo pid,user,group,gid,vsz,rss,comm --sort=-vsz | head;

# Starting background processes
find /usr > /tmp/allusrfiles &;;

# check which commands you have running in the background
jobs;
# [1] Stopped (tty output) vi /tmp/myfile
# [2] Running find   /usr -print > /tmp/allusrfiles &
# [3] Running nroff  -man /usr/man2/* >/tmp/man2 &
# [4]- Running nroff -man /usr/man3/* >/tmp/man3 &
# [5]+ Stopped nroff -man /usr/man4/* >/tmp/man4
# e.g The plus sign (+) next to number 5 shows that it was most recently placed in the
# background. The minus sign (-) next to number 4 shows that it was placed in the background just 
# before the most recent background job. Because job 1 requires terminal input, it cannot run in the 
# background. As a result, it is Stopped until it is brought to the foreground again.

# bring any of the commands on the jobs list to the foreground.
fg %1;

# If a command is stopped, you can start it running again in the background
bg %5;

# Using kill to signal processes by PID
kill 10432;  # default signal sent by kill is 15 (SIGTERM) 
kill -15 10432;
kill -SIGKILL 10432;

# If, for example, something on your GNOME desktop were corrupted, you could send the 
# gnome-shell a SIGHUP signal to reread its configuration files and restart the desktop
kill -1 1833;
killall -HUP gnome-shell;

# Using killall to signal processes by name
killall -9 testme;

# use the nice command to run a command with a particular nice value ( priority )
nice -n +5 updatedb &;;

#  change the nice value for the updatedb ( root only can lower the nice value)
renice -n -5 20284;


