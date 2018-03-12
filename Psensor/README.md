# Installing temperature sensors
Source: https://wpitchoune.net/psensor/
psensor is a graphical hardware temperature monitor for Linux.

It can monitor:

- the temperature of the motherboard and CPU sensors (using lm-sensors).
- the temperature of the NVidia GPUs (using XNVCtrl).
- the temperature of ATI/AMD GPUs (not enabled in Ubuntu PPAs or official distribution repositories, see the instructions for enabling its support).
- the temperature of the Hard Disk Drives (using hddtemp or libatasmart).
- the rotation speed of the fans (using lm-sensors).
- the CPU usage (since 0.6.2.10 and using Gtop2).

Code:
`
sudo apt install lm-sensors
sudo sensors-detect
# To check that we are getting
sensors 
sudo apt install psensor
`


