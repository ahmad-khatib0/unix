
# To find out what is your default login shell
grep ahmad-khatib /etc/passwd; 

# get the current host
hostname; 

# shows the type of system you are running
uname -a; 

# When you log in to a Linux system, Linux views you as having a particular identity, which
# includes your username, group name, user ID, and group ID. Linux also keeps track of your login 
# session: It knows when you logged in, how long you have been idle, and where you logged in from: 
id; 
# ->>> uid=1000(chris) gid=1000(chris) groups=1005(sales), 7(lp) :
# In this example, the username is chris, which is represented by the numeric user ID (uid)
# 1000. The primary group for chris also is called chris, which has a group ID (gid) of 1000. It is 
# normal for Fedora and Red Hat Enterprise Linux users to have the same primary group name as their 
# username. The user chris also belongs to other groups called sales (gid 1005) and lp (gid 7). These 
# names and numbers represent the permissions that chris has to access computer resources.
# 

# see information about your current login session by using the who command: 
who -uH; 

# show command location (-a to have all of the known locations of the command printed)
type -a bash; # or which  

# locate a command. (also from time to time run updatedb as root to update the locate database) 
locate chage ; 

# show environment variables
printenv ; 

# the most 8 recent commands ( !3 for example runs the 3th command, !! runs last command, 
# !?dat? runs the command contains dat string)
history 8 ; 

fc ; # + history line number : edit the command in text editor

# un-zip ( the nroff command to format the man page using the manual macro (-man).)
gunzip < /usr/share/man/man1/grep.1.gz | nroff -c -man | less; 

# Sequential commands: see how long it takes to format a huge document
date ; troff -me verylargedocument | lpr ; date;

# Background commands:  run in the background by using the ampersand (&) 
troff -me verylargedocument | lpr &;;

# Expanding commands: The two forms of command substitution are $(command) and `command`
vi $(find /home | grep xyzzy)

set; # or declare or env see all variables/environment

man -k passwd; # search the name and summary sections of all man pages  

# The following chmod command results in this permission: rwxrwxrwx
chmod 777 file-name; 

# The following chmod command results in this permission: rwxr-xr-x
chmod 755 file-name;  # 5 is:   read=4  execute=1  so: 4+1=5 

# The following chmod command results in this permission: rw-r--r--
chmod 644 file-name;

# The following chmod command results in this permission: ---------
chmod 000 file-name;

# you can change permission for the user (u), group (g), other (o), and all users (a).
# What you would change includes the read (r), write (w), and execute (x) bits
#
## create a file that has all permissions open (rwxrwxrwx): 

# The following chmod command results in this permission: r-xr-xr-x
chmod a-w file;     # remove execute from all

# The following chmod command results in this permission: rwxrwxrw-
chmod o-x file;     # remove execute from other

# The following chmod command results in this permission: rwx------
chmod go-rwx file;  # remove execute,read,write from group and other  

## create a file with all permissions closed (---------)
# The following chmod command results in this permission: rw-------
chmod u+rw files; 

# The following chmod command results in this permission: --x--x--x
chmod a+x files;

# The following chmod command results in this permission: r-xr-x---
chmod ug+rx files;

# ▲                                                                         ▲
# █ Using letters to change permission recursively with chmod generally     █
# █ works better than using numbers because you can change bits selectively █
# █ instead of changing all permission bits at once.                        █
# ▼                                                                         ▼

umask 777 ; touch file01 ; mkdir dir01 ; ls -ld file01 dir01;
# d---------. 2 joe joe 6 Dec 19 11:03 dir01
# ----------. 1 joe joe 0 Dec 19 11:02 file01

umask 000 ; touch file02 ; mkdir dir02 ; ls -ld file02 dir02;
# drwxrwxrwx. 2 joe joe 6 Dec 19 11:00 dir02/
# -rw-rw-rw-. 1 joe joe 0 Dec 19 10:59 file02
 
umask 022 ; touch file03 ; mkdir dir03 ; ls -ld file03 dir03;
# drwxr-xr-x. 2 joe joe 6 Dec 19 11:07 dir03
# -rw-r--r--. 1 joe joe 0 Dec 19 11:07 file03

# To change both user and group to joe,
chown joe:joe /home/joe/memo.txt; 

# ask before overwritting a folder if exists 
alias mv='mv -i'; 

# only removes the directory (nothing) if it is empty
rmdir /home/joe/nothing/;


