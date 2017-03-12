# Dekaf
Dekaf wakes up the computer and starts Kaffeine for scheduled recordings, so the computer does not need to stay awake all the time.

<h4>Installation:</h4>
<ol>
<li>Install <a href="https://www.kde.org/applications/multimedia/kaffeine/">Kaffeine</a> (e.g. "sudo apt-get install kaffeine")</li>
<li>Install sqlite3, pygtk2 and (sudo apt-get install sqlite3 python-gtk2)</li>
<li>Download Dekaf.</li>
<li>Run INSTALL.sh and follow the instructions. This script replaces the paths in all the Dekaf's scripts by the installation path.</li>
<li>In Kaffeine TV settings: command after recording finishes: (Installation path)/recend.sh</li>
<li>
<ol>
<li>"sudo visudo" and add at the end "(Username) ALL = NOPASSWD: /usr/sbin/pm-suspend" (Replace (Username) with the name of the user that is running Kaffeine)</li>
<li>or see recend_run.sh for other options </li>
</ol>
<li>Copy 66_dekaf to /lib/systemd/system-sleep/ <b>NOTE:</b> In Mint <= 17.3 (probably also in Ubuntu before 16.4), copy 66_dekaf-old-pm to /etc/pm/sleep.d/</li>
<li>Always use the tv_desktop_link.sh script to start Kaffeine</li>
<li>Make sure that the time in BIOS is in UTC. This is especially needed when dual-booting with Windows older than Windows 7 (see https://wiki.archlinux.org/index.php/Time#UTC_in_Windows)</li>
<li>Apply <a href=https://sourceforge.net/p/kaffeine/mailman/message/31673147/>the patch from here</a> to ensure that repeated recordings start at correct time even after changes to and from the daylight saving time. Dekaf worked well so far when changes to and from daylight saving time occurred, but no thorough testing was done.
</ol>
