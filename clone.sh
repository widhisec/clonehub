#!/bin/bash
# -(c) zsecc0de-crew.id ~ widhisec
# -createon   : 24/04/2019
# -toolsname  : clone github
# -lastupdate : 02/12/2022
GREEN=$(tput setaf 2)
RED=$(tput setaf 1)
NORMAL=$(tput sgr0)
CYAN=$(tput setaf 6)
ti=$(set `date` && echo -e "$4 $5" | cut -d : -f1,2);
checking(){
if [[ ! -z $(command -v gawk) ]]; then
	printf ""
else
	sleep 2
	apt install grep && apt install gawk; apt install curl
	printf "selesai terinstall.\n"
fi
return
}
checking
user(){
local g ba
g=$(curl -s https://api.github.com/users/$w/repos)
ba=$(echo $g | grep -Po '(?<="clone_url":)[^,]*'|tr -d '"'|gawk -F //git. '{ print $2 }'|
gawk -F / '{ print $3 }'|
cut -d '.' -f1)
for arrItem in "${ba[@]}"
do
  select nu in $arrItem
do
        echo $nu
        break
   done
done
}
main () {
        local oa js
        oa="curl -s https://api.github.com/users/${w}/repos"
        js=$($oa | grep -Po '(?<="clone_url":)[^,]*' | grep -n "" | grep -o "$pilih:.*" | head -1 | gawk '{ print $2 }' | tr -d '"' | gawk '{ print $1 }')
        echo "$js" >> down
}
shuf -e "
${CYAN}
[+] CREATE BY WIDHISEC
######  ####  ######  ####
   #  #      #      #    #
  #    ####  #####  #$ti
 #        #  #      #
#    #    #  #      #    #
######  ####  ######  ####
Powered by zsecc0de-crew.id
"
echo -en "${RED}[?] ${NORMAL}name > "; read w
user $w
echo -en "${GREEN}[*] ${NORMAL}pilih > "; read pilih
main $j;
git clone `cat down`
rm -rf user
rm -rf down
