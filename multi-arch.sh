#!/bin/bash
export BLUE='\033[1;94m'
export GREEN='\033[1;92m'
export RED='\033[1;91m'
export RESETCOLOR='\033[1;00m'

# Make sure only root can run this script
if [ $(id -u) -ne 0 ]; then
  echo -e "\n$GREEN[$RED!$GREEN] $RED  This script must be run as root$RESETCOLOR\n" >&2
  exit 1
fi

#spain func
spin() {
    sp='/-\|'
    printf ' '
    while true; do
        printf '\b%.1s' "$sp"
        sp=${sp#?}${sp%???}
        sleep 0.05
    done
}
#bar func
progressbar()
{
    bar="##################################################"
    barlength=${#bar}
    n=$(($1*barlength/100))
    printf "\r[%-${barlength}s (%d%%)] " "${bar:0:n}" "$1"
}
Cleaning(){
	echo -e "\n$GREEN[$BLUE 1$GREEN ]$BLUE system Updating"$(sudo apt-get update)
	echo -e "\n$BLUE[$RED 0$BLUE ]$GREEN Enable to lock administration directory ...\n"$(sudo rm -vf /var/lib/apt/lists/*)
	echo -e "\n$BLUE[$RED 1$BLUE ]$GREEN Cleaing Start ...\n"$(sudo apt-get install -f)
	echo -e "\n$BLUE[$RED 2$BLUE ]$GREEN Cleaing blocked dpkg done ...\n"$(sudo dpkg --configure -a)
}
#Add new arch
architecture(){
	
	echo -e "\n$BLUE Setp 1:$GREEN Adding architecture 32 \n" $(dpkg --add-architecture i386)
	echo -e "\n$BLUE Setp 2:$GREEN Updating:\n" $(sudo apt-get update)
	echo -e "\n$BLUE Setp 3:$GREEN Adding libs part 1 \n" $(apt-get install libdbus-1-3:i386 libasound2:i386 libexpat1:i386 libfontconfig1:i386 libfreetype6:i386 libsm6:i386 libxdamage1:i386 libxext6:i386 libxfixes3:i386 libxinerama1:i386 libxrandr2:i386 libxrender1:i386 libxtst6:i386 zlib1g:i386 libc6:i386)
	echo -e "\n$BLUE Setp 4:$GREEN Adding libs part 2\n"$(apt-get install libgtk2.0-0:i386 gtk2-engines-murrine:i386 gtk2-engines-pixbuf:i386 libpango1.0-0:i386)
	echo -e "\n$BLUE Setp 5:$GREEN Adding libs part 3 including Android SDK Lib\n" $(apt-get install libstdc++6:i386 libgcc1:i386 zlib1g:i386 libncurses5:i386)
	echo -e "\n$BLUE Setp 6:$GREEN Updating !\n" $(apt-get update)


} 
# main
spin & pid=$!
echo -e "\n$GREEN[$BLUE 1$GREEN ]$BLUE Cleaning system Errors $RESETCOLOR\n"
#Cleaning
echo -e "\n$GREEN[$BLUE 4$GREEN ]$BLUE Starting adding the new architecture :$RESETCOLOR"
architecture
for i in `seq 1 100`;
do
   	progressbar $i
    sleep 0.1
done
echo '\n'
# kill the spinner task and exit
kill $pid > /dev/null 2>&1
exit 1
