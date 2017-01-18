#!/bin/bash
# Specify colors utilized in the terminal
    red=$(tput setaf 1)             #  red
    grn=$(tput setaf 2)             #  green
    ylw=$(tput setaf 3)             #  yellow
    blu=$(tput setaf 4)             #  blue
    ppl=$(tput setaf 5)             #  purple
    cya=$(tput setaf 6)             #  cyan
    txtbld=$(tput bold)             #  Bold
    bldred=${txtbld}$(tput setaf 1) #  red
    bldgrn=${txtbld}$(tput setaf 2) #  green
    bldylw=${txtbld}$(tput setaf 3) #  yellow
    bldblu=${txtbld}$(tput setaf 4) #  blue
    bldppl=${txtbld}$(tput setaf 5) #  purple
    bldcya=${txtbld}$(tput setaf 6) #  cyan
    txtrst=$(tput sgr0)             #  Reset
    rev=$(tput rev)                 #  Reverse color
    pplrev=${rev}$(tput setaf 5)
    cyarev=${rev}$(tput setaf 6)
    ylwrev=${rev}$(tput setaf 3)
    blurev=${rev}$(tput setaf 4)
    normal='tput sgr0'

echo -e "";
tput setaf 6
echo -e "                                                                                                                        ";
echo -e " ________              ______ _____   __                                  ________     ____________            _________";
echo -e " ___  __ \_____ __________  /____  | / /___________________   _______________  __ \_______  __/__(_)_________________  /";
echo -e " __  / / /  __  /_  ___/_  //_/_   |/ /_  _ \_  ___/_  ___/   __  ___/  _ \_  / / /  _ \_  /_ __  /__  __ \  _ \  __  / ";
echo -e " _  /_/ // /_/ /_  /   _  ,<  _  /|  / /  __/(__  )_(__  )    _  /   /  __/  /_/ //  __/  __/ _  / _  / / /  __/ /_/ /  ";
echo -e " /_____/ \__,_/ /_/    /_/|_| /_/ |_/  \___//____/ /____/     /_/    \___//_____/ \___//_/    /_/  /_/ /_/\___/\__,_/   ";
echo -e "                                                                                                                        ";
echo -e "                                                                                                                        ";
echo -e "";
tput setaf 2
echo -e " Thanks for choosing DarkNess reDefined, Now go ahead and build this cool shit ";
echo -e "";
echo -e ${ylw}"\n\n ▼ Which build-type do you want to choose?\n"${txtrst}
echo -e "";
echo -e ${cya}" 〉 1- Official "${txtrst}${red}"    ︱ Only for the official builds by the maintainers"${txtrst}
echo -e "";
echo -e ${cya}" 〉 2- Unofficial "${txtrst}${red}"  ︱ For the unofficial builds"${txtrst}
echo -e "";
echo -e ${cya}" 🕑  30/sec Time-out"${txtrst}${red}"︱ Default option"${txtrst}
echo -e "";
echo -e ${cya}" ▼ Pick a number"${txtrst}
echo -e "";
$normal
read -t 30 askvariant
sleep 1
if [ "$askvariant" == "1" ]
then
echo -e "";
echo -e ${blu}" ▪ Building official variant "${txtrst}
export DND_BUILDTYPE=Official
echo -e "";
echo -e "";
$normal
sleep 1
fi
if [ "$askvariant" == "2" ]
then
echo -e "";
echo -e ${blu}" ▪ Building unofficial variant "${txtrst}
export DND_BUILDTYPE=Unofficial
echo -e "";
echo -e "";
$normal
sleep 1
fi
