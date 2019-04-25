#!/bin/bash
# -(c) zsecc0de-crew.id ~ widhisec
# -createon   : 24/04/2019
# -toolsname  : clone github
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
usr(){
g=$(curl -s https://api.github.com/users/$w/repos | grep -Po '(?<="clone_url":)[^,]*' |  
gawk '{print $1}' | tr -d '""' | 
gawk -F //git. '{ print $2 }' | 
cut -d "." -f2 | gawk -F / '{ print $3 }' | grep -n "")
printf "$g \n"
}
main () {
oa="curl -s https://api.github.com/users/`cat user`/repos" 
js=$($oa | grep -Po '(?<="clone_url":)[^,]*' | grep -n "" | grep -o "$pilih:.*" | head -1 | gawk '{ print $2 }' | tr -d '"' | gawk '{ print $1 }')
#gawk -F $pilih: '{ print $2 }' | sed -e 's/"//g' -e 's/,//g' | gawk '{ print $1 }')
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
usr $w
echo "$w" >> user
echo -en "${GREEN}[*] ${NORMAL}pilih > "; read pilih
main $j;
git clone `cat down`
rm -rf user
rm -rf down