# Dekaf
Dekaf wakes up Kaffeine for scheduled recordings, so the computer does not need to stay awake all the time.

<h4>Installation:</h4>

Replace the paths in all the scripts with the installation path.

sudo apt-get install sqlite3

In Kaffeine TV settings: command after recording finishes: (Installation path)/recend.sh

"sudo visudo" and add at the end "(Username) ALL = NOPASSWD: /usr/sbin/pm-suspend" (Replace (Username) with the name of the user that is running Kaffeine)

Copy 66_dekaf to /etc/pm/sleep.d/

Always use the tv_desktop_link.sh script to start Kaffeine

Make sure that the time in BIOS is in UTC (see also https://wiki.archlinux.org/index.php/Time#UTC_in_Windows)
