
# auto updates for Ubuntu
# config file: /etc/apt/apt.conf.d/20auto-upgrades
systemctl status unattended-upgrades

# If you want to see if there are any security-related updates available
sudo unattended-upgrade --dry-run -d

 # manually install the security-related updates without installing non-security updates
sudo unattended-upgrade -d

# see if there are any security-related updates
sudo yum updateinfo list updates security
sudo yum upgrade --security  # perform the update 

# because of that on Red Hat-based systems  there’s no automatic update mechanism,,
# if you need a CentOS system to automatically update itself: 
sudo yum install yum-cron
sudo systemctl enable --now yum-cron
# go into the /etc/yum directory, and edit the yum-cron.conf file,
# Let’s say that you only want security updates to get applied automatically
update_cmd = security # chaned from ( default ) (which means everything )
# also in this config file, you can to configure sending email after an update is downloaded or applied
# to read the sent messages (to your email ): 
sudo yum install mutt
# to see if your os needs to be restarted: 
sudo yum install yum-utils  # and then: 
sudo needs-restarting  # shows the services that need to be restarted or that requires system reboot,  or: 
sudo sudo needs-restarting -s  # This only shows the services that need to be restarted.,   or: 
sudo needs-restarting -r       # This only shows the reasons why the system needs to be rebooted 

# auto-update for os that has dnf: 
sudo dnf install dnf-automatic
# In the /etc/dnf directory, you’ll see the automatic.conf file, (same config as yum-cron)
# but the dnf-automatic works with systemd instead of cron jobs, so enable it:
sudo systemctl enable --now dnf-automatic.timer
sudo systemctl status dnf-automatic.timer
# To determine if a system needs to be restarted, just install the dnf-utils package
sudo dnf install dnf-utils

