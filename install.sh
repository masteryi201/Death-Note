#!/bin/bash
Work_dir=`pwd`
log="$Work_dir/logs/setup.log"
Folder_MalwareTools="Tools/Synthetic-Malware/"
Folder_Backup="Backup/"
Folder_WIFITools="Tools/Wireless-Attacks/"
Folder_exploitTools="Tools/Vulnerability-Exploit/"
dirbackup_malwarebackup="library/backup/Synthetic-Malware/"
dirbackup_vulexploit="library/backup/Vulnerability-Exploit"
dirbackup_WIFIbackup="library/backup/Wireless-Attacks/"
dirbackup_metasploitbackup="library/backup/Metasploit/"
direxploit_expframework="Modules/Vuln/Framework"
config_language="$Work_dir/config/config-language"
source $config_language
######################
#language
if [ "$language" = "VN" ]; then
source $Work_dir/language/VietNamese/VN
source $Work_dir/language/VietNamese/vn_table
elif [ "$language" = "EN" ]; then
source $Work_dir/language/English/EN
source $Work_dir/language/English/en_table
fi
#######################
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
#############################
lnx="Linux"
lsb_release -i > distro.tmp
dist=`awk '{print $3}' distro.tmp`
dist1=`awk '{print $4}' distro.tmp`
rm -f distro.tmp >/dev/null
if [ "$dist" == "$lnx" ];
then
dist0=$dist1
else
dist0=$dist
fi
########## check file ############
function check_privilegies {
if [[ $EUID -ne 0 ]]; then
        echo -e "\e[1;31mYou don't have admin privilegies, execute the script as root.""\e[0m"""
        exit 1
fi
}
function check_folder {
check_folder_tool=`find  -name Tools -type d | grep -w "./Tools"`
if [ "$check_folder_tool" = "./Tools" ]; then
	echo ""
else
	mkdir -p $Folder_MalwareTools
	mkdir -p $Folder_WIFITools
	mkdir -p $Folder_exploitTools
fi
check_folder_output=`find  -name output -type d | grep -w "./output"`
if [ "$check_folder_output" = "./output" ]; then
	echo ""
else
	mkdir output
fi
check_folder_victim=`find  -name Victim -type d | grep -w "./Victim"`
if [ "$check_folder_victim" = "./Victim" ]; then
	echo ""
else
	mkdir Victim
fi
if [ "$check_folder_backup" = "./Backup" ]; then
	echo ""
else
	mkdir -p $Folder_Backup
fi
check_folder_logs=`find  -name logs -type d | grep -w "./logs"`
if [ "$check_folder_logs" = "./logs" ]; then
	echo ""
else
	mkdir logs
	rm -f $log
	touch $log
fi
}
########## cleaning up #########
function cleanup {
echo -e "${cyan}	Clean and Update System${RESET}"
#sudo apt-get install -f -y
#sudo apt-get autoremove -y
#sudo apt-get autoclean -y
#sudo apt-get clean -y
#sudo apt-get update
#sudo apt-get install xterm --yes

}
##################################################################
############## Vul exploit tools #################################
##################################################################
function cve201711882 {	
cve201711882=`find $Folder_exploitTools -name CVE-2017-11882 -type d | grep -w "Tools/Vulnerability-Exploit/CVE-2017-11882"`
cve201711882_sh=`find $direxploit_expframework/exploit/windows/fileformat -name CVE-2017-11882 -type d | grep -w "Modules/Vuln/Framework/exploit/windows/fileformat/CVE-2017-11882_office_rce.sh"`
	if [[ "$cve201711882" = "Tools/Vulnerability-Exploit/CVE-2017-11882" ]] || [[ "$cve201711882" = "Modules/Vuln/Framework/exploit/windows/fileformat/CVE-2017-11882_office_rce.sh" ]]; then
		echo -e "[ ✔ ]   CVE-2017-11882 tool ${white}................ ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   CVE-2017-11882 tool ${white}................ ${red}$NotInstalled ${RESET}"
		cd $Folder_exploitTools
		mkdir CVE-2017-11882
		cd CVE-2017-11882
		cp $Work_dir/$dirbackup_vulexploit/CVE-2017-11882/CVE-2017-11882.py CVE-2017-11882.py
		cp $Work_dir/$dirbackup_vulexploit/CVE-2017-11882/shellcode.c shellcode.c
		cp $Work_dir/$dirbackup_vulexploit/CVE-2017-11882/CVE-2017-11882_office_rce.sh $Work_dir/$direxploit_expframework/exploit/windows/fileformat/CVE-2017-11882_office_rce.sh
		echo -e "[ ✔ ]   CVE-2017-11882 tool ${white}................ ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
}
function cve20170199 {	
cve20170199=`find $Folder_exploitTools -name CVE-2017-0199 -type d | grep -w "Tools/Vulnerability-Exploit/CVE-2017-0199"`
cve20170199_sh=`find $direxploit_expframework/exploit/windows/fileformat -name CVE-2017-0199 -type d | grep -w "Modules/Vuln/Framework/exploit/windows/fileformat/CVE-2017-0199_office_rce.sh"`
	if [[ "$cve20170199" = "Tools/Vulnerability-Exploit/CVE-2017-0199" ]] || [[ "$cve20170199" = "Modules/Vuln/Framework/exploit/windows/fileformat/CVE-2017-0199_office_rce.sh" ]]; then
		echo -e "[ ✔ ]   CVE-2017-0199 tool ${white}................ ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   CVE-2017-0199 tool ${white}................ ${red}$NotInstalled ${RESET}"
		cd $Folder_exploitTools
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download CVE-2017-0199 tool <=" -e git clone https://github.com/bhdresh/CVE-2017-0199.git
		cd CVE-2017-0199		
		chmod 755 *.py
		cp $Work_dir/$dirbackup_vulexploit/CVE-2017-0199/CVE-2017-0199_office_rce.sh $Work_dir/$direxploit_expframework/exploit/windows/fileformat/CVE-2017-0199_office_rce.sh
		echo -e "[ ✔ ]   CVE-2017-0199 tool ${white}................ ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
}
#function cve20178570 {	
#cve20178570=`find $Folder_exploitTools -name CVE-2017-8570 -type d | grep -w "Tools/Vulnerability-Exploit/CVE-2017-8570"`
#	if [ "$cve20178570" = "Tools/Vulnerability-Exploit/CVE-2017-8570" ]; then
#		echo -e "[ ✔ ]   CVE-2017-8570 tool ${white}................ ${yellow}$Installed ${RESET}"
#	else    echo -e "[ ! ]   CVE-2017-8570 tool ${white}................ ${red}$NotInstalled ${RESET}"
#		cd $Folder_exploitTools
#		#xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download CVE-2017-8570 tool <=" -e git clone https://github.com/bhdresh/CVE-2017-0199.git
#		cd CVE-2017-8570
#		chmod 755 *.py
#		cp $dirbackup_vulexploit/CVE-2017-8570_office_rce.sh $direxploit_expframework/windows/fileformat/CVE-2017-8570_office_rce.sh
#		echo -e "[ ✔ ]   CVE-2017-8570 tool ${white}................ ${yellow}$Installed ${RESET}"
##		cd $Work_dir
#	fi
#}
function cve20180802 {	
cve20180802=`find $Folder_exploitTools -name CVE-2018-0802 -type d | grep -w "Tools/Vulnerability-Exploit/CVE-2018-0802"`
cve20180802_sh=`find $direxploit_expframework/exploit/windows/fileformat -name CVE-2018-0802 -type d | grep -w "Modules/Vuln/Framework/exploit/windows/fileformat/CVE-2018-0802_office_rce.sh"`
	if [[ "$cve20180802" = "Tools/Vulnerability-Exploit/CVE-2018-0802" ]] || [[ "$cve20180802" = "Modules/Vuln/Framework/exploit/windows/fileformat/CVE-2018-0802_office_rce.sh" ]]; then
		echo -e "[ ✔ ]   CVE-2018-0802 tool ${white}................ ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   CVE-2018-0802 tool ${white}................ ${red}$NotInstalled ${RESET}"
		cd $Folder_exploitTools
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download CVE-2018-0802 tool <=" -e git clone https://github.com/rxwx/CVE-2018-0802.git
		cd CVE-2018-0802
		chmod 755 *.py
		cp $Work_dir/$dirbackup_vulexploit/CVE-2018-0802/CVE-2018-0802_office_rce.sh $Work_dir/$direxploit_expframework/exploit/windows/fileformat/CVE-2018-0802_office_rce.sh
		echo -e "[ ✔ ]   CVE-2018-0802 tool ${white}................ ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
}
##################################################################
############## Backdoor and malwares #############################
##################################################################
############# Dr0p1t-Framework ################
function drolit {
Drolit=`find $Folder_MalwareTools -name Dr0p1t-Framework -type d | grep -w "Tools/Synthetic-Malware/Dr0p1t-Framework"`
	if [ "$Drolit" = "Tools/Synthetic-Malware/Dr0p1t-Framework" ]; then
		echo -e "[ ✔ ]   Dr0p1t-Framework ${white}.... ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   Dr0p1t-Framework ${white}.... ${red}$NotInstalled ${RESET}"
		cd $Folder_MalwareTools
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download Dr0p1t-Framework <=" -e git clone https://github.com/D4Vinci/Dr0p1t-Framework.git
		cd Dr0p1t-Framework
		chmod 755 *.py | chmod 755 *.sh
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing Dr0p1t-Framework <=" -e ./install.sh
		echo -e "[ ✔ ]   Dr0p1t-Framework ${white}.... ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
}
############# Don't kill my cat ################
function dkmc {	
dkmc=`find $Folder_MalwareTools -name DKMC -type d | grep -w "Tools/Synthetic-Malware/DKMC"`
	if [ "$dkmc" = "Tools/Synthetic-Malware/DKMC" ]; then
		echo -e "[ ✔ ]   DKMC ${white}................ ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   DKMC ${white}................ ${red}$NotInstalled ${RESET}"
		cd $Folder_MalwareTools
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download DKMC <=" -e git clone https://github.com/Mr-Un1k0d3r/DKMC.git
		cd DKMC		
		chmod 755 *.py
		echo -e "[ ✔ ]   DKMC ${white}................ ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
}
############# TheFatRat ################
function fatrat {
thefatrat=`find $Folder_MalwareTools -name TheFatRat -type d | grep -w "Tools/Synthetic-Malware/TheFatRat"`
	if [ "$thefatrat" = "Tools/Synthetic-Malware/TheFatRat" ]; then
		echo -e "[ ✔ ]   TheFatRat ${white}........... ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   TheFatRat ${white}........... ${red}$NotInstalled ${RESET}"
	cd $Folder_MalwareTools
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download TheFatRat <=" -e git clone https://github.com/Screetsec/TheFatRat.git
		cd TheFatRat
		chmod 755 *.sh
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing TheFatRat <=" -e ./setup.sh
		echo -e "[ ✔ ]   TheFatRat ${white}........... ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
}
############# msfpc ################	
function msfpc {
msfpc=`find $Folder_MalwareTools -name mpc -type d | grep -w "Tools/Synthetic-Malware/mpc"`
	if [ "$msfpc" = "Tools/Synthetic-Malware/mpc" ]; then
		echo -e "[ ✔ ]   Msfpc ${white}............... ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   Msfpc ${white}............... ${red}$NotInstalled ${RESET}"
cd $Folder_MalwareTools
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download Msfpc <=" -e git clone https://github.com/g0tmi1k/mpc.git
		cd $Work_dir
		cp $dirbackup_malwarebackup/mpc/msfpc.sh $Folder_MalwareTools/mpc/
		cp $dirbackup_malwarebackup/mpc/msfpc1.sh $Folder_MalwareTools/mpc/
		cd $Folder_MalwareTools/mpc/
		chmod 755 *.sh
		cd $Work_dir
		echo -e "[ ✔ ]   Msfpc ${white}............... ${yellow}$Installed ${RESET}"
	fi
}
############# winpayloads ################
function winpayloads {	
winpayloads=`find $Folder_MalwareTools -name Winpayloads -type d | grep -w "Tools/Synthetic-Malware/Winpayloads"`
	if [ "$winpayloads" = "Tools/Synthetic-Malware/Winpayloads" ]; then
		echo -e "[ ✔ ]   Winpayloads ${white}......... ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   Winpayloads ${white}......... ${red}$NotInstalled ${RESET}"
		cd $Folder_MalwareTools
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download Winpayloads <=" -e git clone https://github.com/nccgroup/Winpayloads.git
		cd Winpayloads
		chmod 755 *.sh
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing Winpayloads <=" -e ./setup.sh
		echo -e "[ ✔ ]   Winpayloads ${white}......... ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
}
############# astroid ################
function astroid {
astroid=`find $Folder_MalwareTools -name astroid -type d | grep -w "Tools/Synthetic-Malware/astroid"`
	if [ "$astroid" = "Tools/Synthetic-Malware/astroid" ]; then
		echo -e "[ ✔ ]   astroid ${white}............. ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   astroid ${white}............. ${red}$NotInstalled ${RESET}"
		cd $Folder_MalwareTools
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download astroid <=" -e git clone https://github.com/M4sc3r4n0/astroid.git
		cd astroid
		chmod 755 *.sh
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing astroid <=" -e ./setup.sh
		echo -e "[ ✔ ]   astroid ${white}............. ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
}
############# Phantom-Evasio ################
function phantom {
phantom=`find $Folder_MalwareTools -name Phantom-Evasion -type d | grep -w "Tools/Synthetic-Malware/Phantom-Evasion"`
	if [ "$phantom" = "Tools/Synthetic-Malware/Phantom-Evasion" ]; then
		echo -e "[ ✔ ]   Phantom-Evasion ${white}..... ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   Phantom-Evasion ${white}..... ${red}$NotInstalled ${RESET}"
cd $Folder_MalwareTools
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download Phantom-Evasion <=" -e git clone https://github.com/oddcod3/Phantom-Evasion.git
		cd Phantom-Evasion
		chmod 755 *.py
		echo -e "[ ✔ ]   Phantom-Evasion ${white}..... ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
}
############# tophat ################
function tophat {
tophat=`find $Folder_MalwareTools -name TopHat -type d | grep -w "Tools/Synthetic-Malware/TopHat"`
	if [ "$tophat" = "Tools/Synthetic-Malware/TopHat" ]; then
		echo -e "[ ✔ ]   TopHat ${white}.............. ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   TopHat ${white}.............. ${red}$NotInstalled ${RESET}"
cd $Folder_MalwareTools
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download TopHat <=" -e git clone https://github.com/stnby/TopHat.git
		cd TopHat
		chmod 755 *.py
		echo -e "[ ✔ ]   TopHat ${white}.............. ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
}
############# mpm ################	
function mpm {
mpm=`find $Folder_MalwareTools -name Meterpreter_Paranoid_Mode-SSL -type d | grep -w "Tools/Synthetic-Malware/Meterpreter_Paranoid_Mode-SSL"`
	if [ "$mpm" = "Tools/Synthetic-Malware/Meterpreter_Paranoid_Mode-SSL" ]; then
		echo -e "[ ✔ ]   MPM ${white}................. ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   MPM ${white}................. ${red}$NotInstalled ${RESET}"
cd $Folder_MalwareTools
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download MPM <=" -e git clone https://github.com/r00t-3xp10it/Meterpreter_Paranoid_Mode-SSL.git
		cd $Work_dir
		cp $dirbackup_malwarebackup/Meterpreter_Paranoid_Mode-SSL/Meterpreter_Paranoid_Mode.sh $Folder_MalwareTools/Meterpreter_Paranoid_Mode-SSL/
		cd $Folder_MalwareTools/Meterpreter_Paranoid_Mode-SSL/
		chmod 755 *.sh
		cd $Work_dir
		echo -e "[ ✔ ]   MPM ${white}................. ${yellow}$Installed ${RESET}"
	fi
}
############# venom ################
function venom {
venom=`find $Folder_MalwareTools -name venom -type d | grep -w "Tools/Synthetic-Malware/venom"`
	if [ "$venom" = "Tools/Synthetic-Malware/venom" ]; then
		echo -e "[ ✔ ]   venom ${white}............... ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   venom ${white}............... ${red}$NotInstalled ${RESET}"
		cd $Folder_MalwareTools
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download venom <=" -e git clone https://github.com/r00t-3xp10it/venom.git
		echo -e "[ ✔ ]   venom ${white}............... ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
}
############# HERCULES ################	
function hercules {
HERCULES=`find $Folder_MalwareTools -name HERCULES -type d | grep -w "Tools/Synthetic-Malware/HERCULES"`
	if [ "$HERCULES" = "Tools/Synthetic-Malware/HERCULES" ]; then
		echo -e "[ ✔ ]   HERCULES ${white}............ ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   HERCULES ${white}............ ${red}$NotInstalled ${RESET}"
		sudo apt-get install golang --yes
		cd $Folder_MalwareTools
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download HERCULES <=" -e git clone https://github.com/EgeBalci/HERCULES.git
		cd HERCULES
		chmod 755 *.go
		chmod 755 HERCULES
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing HERCULES <=" -e go get github.com/fatih/color
xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing HERCULES <=" -e go run Setup.go
		echo -e "[ ✔ ]   HERCULES ${white}............ ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
}
############# zirikatu ################
function zirikatu {
zirikatu=`find $Folder_MalwareTools -name zirikatu -type d | grep -w "Tools/Synthetic-Malware/zirikatu"`
	if [ "$zirikatu" = "Tools/Synthetic-Malware/zirikatu" ]; then
		echo -e "[ ✔ ]   zirikatu ${white}............ ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   zirikatu ${white}............ ${red}$NotInstalled ${RESET}"
		cd $Folder_MalwareTools
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download zirikatu <=" -e git clone https://github.com/pasahitz/zirikatu.git
		cd $Work_dir
		cp $dirbackup_malwarebackup/zirikatu/zirikatu.sh $Folder_MalwareTools/zirikatu/
		cd $Folder_MalwareTools/zirikatu/
		chmod 755 *.sh
		echo -e "[ ✔ ]   zirikatu ${white}............ ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
}
############# CHAOS ################
function chaos {
CHAOS=`find $Folder_MalwareTools -name CHAOS -type d | grep -w "Tools/Synthetic-Malware/CHAOS"`
	if [ "$CHAOS" = "Tools/Synthetic-Malware/CHAOS" ]; then
		echo -e "[ ✔ ]   CHAOS ${white}............... ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   CHAOS ${white}............... ${red}$NotInstalled ${RESET}"
sudo apt-get install golang --yes
cd $Folder_MalwareTools
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download CHAOS <=" -e git clone https://github.com/tiagorlampert/CHAOS.git
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing CHAOS <=" -e go get github.com/kbinani/screenshot 
xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing CHAOS <=" -e go get github.com/lxn/win
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing CHAOS <=" -e go install github.com/kbinani/screenshot 
xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing CHAOS <=" -e go install github.com/lxn/win
		cd CHAOS
		chmod 755 *.go
		echo -e "[ ✔ ]   CHAOS ${white}............... ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
}
############# NXcrypt ################
function nxcrypt {
NXcrypt=`find $Folder_MalwareTools -name NXcrypt -type d | grep -w "Tools/Synthetic-Malware/NXcrypt"`
	if [ "$NXcrypt" = "Tools/Synthetic-Malware/NXcrypt" ]; then
		echo -e "[ ✔ ]   NXcrypt ${white}............. ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   NXcrypt ${white}............. ${red}$NotInstalled ${RESET}"
		cd $Folder_MalwareTools
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download NXcrypt <=" -e git clone https://github.com/Hadi999/NXcrypt.git
		cd NXcrypt		
		chmod 755 *.py
		echo -e "[ ✔ ]   NXcrypt ${white}............. ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
}
############# Reverse0x1 ################
function reverse0x1 {	
Reverse0x1=`find $Folder_MalwareTools -name Reverse0x1 -type d | grep -w "Tools/Synthetic-Malware/Reverse0x1"`
	if [ "$Reverse0x1" = "Tools/Synthetic-Malware/Reverse0x1" ]; then
		echo -e "[ ✔ ]   Reverse0x1 ${white}.......... ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   Reverse0x1 ${white}.......... ${red}$NotInstalled ${RESET}"
		cd $Folder_MalwareTools
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download Reverse0x1 <=" -e git clone https://github.com/LukaSikic/Reverse0x1.git
		cd Reverse0x1
		chmod 755 *.py
		echo -e "[ ✔ ]   Reverse0x1 ${white}.......... ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
}
############# The-backdoor-factory ###############
function backdoor_factory {
backdoorfactory=`find $Folder_MalwareTools -name the-backdoor-factory -type d | grep -w "Tools/Synthetic-Malware/the-backdoor-factory"`
	if [ "$backdoorfactory" = "Tools/Synthetic-Malware/the-backdoor-factory" ]; then
		echo -e "[ ✔ ]   The-backdoor-factory ${white} ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   The-backdoor-factory ${white} ${red}$NotInstalled ${RESET}"
cd $Folder_MalwareTools
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download The-backdoor-factory <=" -e git clone  https://github.com/secretsquirrel/the-backdoor-factory.git
		cd the-backdoor-factory
		chmod 755 *.py | chmod 755 *.sh
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing The-backdoor-factory <=" -e ./install.sh
		echo -e "[ ✔ ]   The-backdoor-factory ${white} ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
}
############# trolo ################
function trolo {	
trolo=`find $Folder_MalwareTools -name trolo -type d | grep -w "Tools/Synthetic-Malware/trolo"`
	if [ "$trolo" = "Tools/Synthetic-Malware/trolo" ]; then
		echo -e "[ ✔ ]   Trolo ${white}............... ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   Trolo ${white}............... ${red}$NotInstalled ${RESET}"
		cd $Folder_MalwareTools
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download Trolo <=" -e git clone https://github.com/b3rito/trolo.git
		cd $Work_dir
		cp $dirbackup_malwarebackup/trolo/trolo.sh $Folder_MalwareTools/trolo/
		cd $Folder_MalwareTools/trolo/
		chmod 755 *.sh
		echo -e "[ ✔ ]   Trolo ${white}............... ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
}
############# Metasploitavevasion ################
function metasploitavevasion {
metasploitavevasion=`find $Folder_MalwareTools -name metasploitavevasion -type d | grep -w "Tools/Synthetic-Malware/metasploitavevasion"`
	if [ "$metasploitavevasion" = "Tools/Synthetic-Malware/metasploitavevasion" ]; then
		echo -e "[ ✔ ]   Metasploitavevasion ${white}. ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   Metasploitavevasion ${white}. ${red}$NotInstalled ${RESET}"
		cd $Folder_MalwareTools
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download Metasploitavevasion <=" -e git clone https://github.com/nccgroup/metasploitavevasion.git
		cd $Work_dir
		cp $dirbackup_malwarebackup/metasploitavevasion/avoid.sh $Folder_MalwareTools/metasploitavevasion/
		cd $Folder_MalwareTools/metasploitavevasion/
		chmod 755 *.sh
		echo -e "[ ✔ ]   Metasploitavevasion ${white}. ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
}
############# Terminator ################
function terminator {
Terminator=`find $Folder_MalwareTools -name Terminator -type d | grep -w "Tools/Synthetic-Malware/Terminator"`
	if [ "$Terminator" = "Tools/Synthetic-Malware/Terminator" ]; then
		echo -e "[ ✔ ]   Terminator ${white}.......... ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   Terminator ${white}.......... ${red}$NotInstalled ${RESET}"
		cd $Folder_MalwareTools
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download Terminator <=" -e git clone https://github.com/MohamedNourTN/Terminator.git
		cd $Work_dir
		#cp $dirbackup_malwarebackup/Terminator/Terminator.sh $Folder_MalwareTools/Terminator/
		cd $Folder_MalwareTools/Terminator/
		chmod 755 *.py
		echo -e "[ ✔ ]   Terminator ${white}.......... ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
}
############# HackTheWorld ################
function hacktheworld {
HackTheWorld=`find $Folder_MalwareTools -name HackTheWorld -type d | grep -w "Tools/Synthetic-Malware/HackTheWorld"`
	if [ "$HackTheWorld" = "Tools/Synthetic-Malware/HackTheWorld" ]; then
		echo -e "[ ✔ ]   HackTheWorld ${white}........ ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   HackTheWorld ${white}........ ${red}$NotInstalled ${RESET}"
		cd $Folder_MalwareTools
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download HackTheWorld <=" -e git clone https://github.com/stormshadow07/HackTheWorld.git
		cd $Work_dir
		#cp $dirbackup_malwarebackup/HackTheWorld/HackTheWorld.py $Folder_MalwareTools/Terminator/
		cd $Folder_MalwareTools/HackTheWorld/
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing HackTheWorld <=" -e pip install termcolor
		chmod 755 *.py && chmod 755 *.sh
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing HackTheWorld <=" -e ./install.sh
		echo -e "[ ✔ ]   HackTheWorld ${white}........ ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
}
############# Avet ################
function avet {
avet=`find $Folder_MalwareTools -name avet -type d | grep -w "Tools/Synthetic-Malware/avet"`
	if [ "$avet" = "Tools/Synthetic-Malware/avet" ]; then
		echo -e "[ ✔ ]   Avet ${white}................ ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   Avet ${white}................ ${red}$NotInstalled ${RESET}"
		cd $Folder_MalwareTools
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download Avet <=" -e git clone https://github.com/govolution/avet.git
		cd $Work_dir
		#cp $dirbackup_malwarebackup/Terminator/Terminator.sh $Folder_MalwareTools/Terminator/
		echo -e "[ ✔ ]   Avet ${white}................ ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
}
############# ZeroDoor ################
function zerodoor {
Zerodoor=`find $Folder_MalwareTools -name Zerodoor -type d | grep -w "Tools/Synthetic-Malware/Zerodoor"`
	if [ "$Zerodoor" = "Tools/Synthetic-Malware/Zerodoor" ]; then
		echo -e "[ ✔ ]   ZeroDoor ${white}............ ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   ZeroDoor ${white}............ ${red}$NotInstalled ${RESET}"
		cd $Folder_MalwareTools
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download ZeroDoor <=" -e git clone https://github.com/Souhardya/Zerodoor.git
		cd $Work_dir
		#cp $dirbackup_malwarebackup/Terminator/Terminator.sh $Folder_MalwareTools/Terminator/
		cd $Folder_MalwareTools/Zerodoor/
		chmod 755 *.py
		echo -e "[ ✔ ]   ZeroDoor ${white}............ ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
}
############# Andspoilt ################
function andsploit {
Andspoilt=`find $Folder_MalwareTools -name Andspoilt -type d | grep -w "Tools/Synthetic-Malware/Andspoilt"`
	if [ "$Andspoilt" = "Tools/Synthetic-Malware/Andspoilt" ]; then
		echo -e "[ ✔ ]   Andspoilt ${white}........... ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   Andspoilt ${white}........... ${red}$NotInstalled ${RESET}"
		cd $Folder_MalwareTools
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download Andspoilt <=" -e git clone https://github.com/sundaysec/Andspoilt.git
		cd $Work_dir
		#cp $dirbackup_malwarebackup/Terminator/Terminator.sh $Folder_MalwareTools/Terminator/
		cd $Folder_MalwareTools/Andspoilt/
		chmod 755 *.py
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing Andspoilt <=" -e python setup.py install
		echo -e "[ ✔ ]   Andspoilt ${white}........... ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
}
############# Koadic ################
function koadic {
koadic=`find $Folder_MalwareTools -name koadic -type d | grep -w "Tools/Synthetic-Malware/koadic"`
	if [ "$koadic" = "Tools/Synthetic-Malware/koadic" ]; then
		echo -e "[ ✔ ]   Koadic ${white}.............. ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   Koadic ${white}.............. ${red}$NotInstalled ${RESET}"
		cd $Folder_MalwareTools
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download Koadic <=" -e git clone https://github.com/zerosum0x0/koadic.git
		cd $Work_dir
		#cp $dirbackup_malwarebackup/Terminator/Terminator.sh $Folder_MalwareTools/Terminator/
		cd $Folder_MalwareTools/koadic/
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing Koadic <=" -e pip install -r requirements.txt
		echo -e "[ ✔ ]   Koadic ${white}.............. ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
}
############# Mkvenom ################
function mkvemon {
mkvenom=`find $Folder_MalwareTools -name mkvenom -type d | grep -w "Tools/Synthetic-Malware/mkvenom"`
	if [ "$mkvenom" = "Tools/Synthetic-Malware/mkvenom" ]; then
		echo -e "[ ✔ ]   Mkvenom ${white}............. ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   Mkvenom ${white}............. ${red}$NotInstalled ${RESET}"
		cd $Folder_MalwareTools
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download Mkvenom <=" -e git clone https://github.com/phraxoid/mkvenom.git
		cd $Work_dir
		#cp $dirbackup_malwarebackup/Terminator/Terminator.sh $Folder_MalwareTools/Terminator/
		cd $Folder_MalwareTools/mkvenom/
		chmod 755 *.sh
		echo -e "[ ✔ ]   Mkvenom ${white}............. ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
}
############# BeeLogger ################	
function beelogger {
BeeLogger=`find $Folder_MalwareTools -name BeeLogger -type d | grep -w "Tools/Synthetic-Malware/BeeLogger"`
	if [ "$BeeLogger" = "Tools/Synthetic-Malware/BeeLogger" ]; then
		echo -e "[ ✔ ]   BeeLogger ${white}........... ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   BeeLogger ${white}........... ${red}$NotInstalled ${RESET}"
	cd $Folder_MalwareTools
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download BeeLogger <=" -e git clone https://github.com/4w4k3/BeeLogger.git
		cd BeeLogger
		chmod 755 *.sh | chmod 755 *.py
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing BeeLogger <=" -e ./install.sh
		echo -e "[ ✔ ]   BeeLogger ${white}........... ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
}
############# sAINT ################
function saint {
sAINT=`find $Folder_MalwareTools -name sAINT -type d | grep -w "Tools/Synthetic-Malware/sAINT"`
	if [ "$sAINT" = "Tools/Synthetic-Malware/sAINT" ]; then
		echo -e "[ ✔ ]   sAINT ${white}............... ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   sAINT ${white}............... ${red}$NotInstalled ${RESET}"
	cd $Folder_MalwareTools
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download sAINT <=" -e git clone https://github.com/tiagorlampert/sAINT.git
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing sAINT <=" -e apt install maven default-jdk default-jre openjdk-8-jdk openjdk-8-jre -y
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing sAINT <=" -e apt install zlib1g-dev libncurses5-dev lib32z1 lib32ncurses6 -y
		cd sAINT
		chmod +x configure.sh
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing sAINT <=" -e ./configure.sh
		echo -e "[ ✔ ]   sAINT ${white}............... ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
}
##################################################################
############## WIFI Tools ########################################
##################################################################
############# Fluxion ################
function fluxion {
fluxion=`find $Folder_WIFITools -name fluxion -type d | grep -w "Tools/Wireless-Attacks/fluxion"`
	if [ "$fluxion" = "Tools/Wireless-Attacks/fluxion" ]; then
		echo -e "[ ✔ ]   Fluxion ${white}............. ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   Fluxion ${white}............. ${red}$NotInstalled ${RESET}"
		cd $Folder_WIFITools
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download Fluxion <=" -e git clone https://github.com/wi-fi-analyzer/fluxion.git
		cd fluxion
		chmod 755 *.sh
		cd install
		chmod 755 *.sh		
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing Fluxion <=" -e ./install.sh
		cd $Work_dir
		cp $dirbackup_WIFIbackup/fluxion/fluxion.sh $Folder_WIFITools/fluxion/
		cp -r $dirbackup_WIFIbackup/fluxion/sites/* $Folder_WIFITools/fluxion/sites/
		cd $Folder_WIFITools/fluxion/
		chmod 755 *.sh
		cd $Work_dir
		echo -e "[ ✔ ]   Fluxion ${white}............. ${yellow}$Installed ${RESET}"
	fi
}
############# Wifiphisher ################
function wifiphisher {
wifiphisher=`find $Folder_WIFITools -name wifiphisher -type d | grep -w "Tools/Wireless-Attacks/wifiphisher/wifiphisher"`
	if [ "$wifiphisher" = "Tools/Wireless-Attacks/wifiphisher/wifiphisher" ]; then
		echo -e "[ ✔ ]   Wifiphisher ${white}......... ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   Wifiphisher ${white}......... ${red}$NotInstalled ${RESET}"
	cd $Folder_WIFITools
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download Wifiphisher <=" -e git clone https://github.com/wifiphisher/wifiphisher.git
		cd wifiphisher
		chmod 755 *.py
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing Wifiphisher <=" -e sudo python setup.py install
		echo -e "[ ✔ ]   Wifiphisher ${white}......... ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
}
############# Airgeddon ################
function airgeddon {
airgeddon=`find $Folder_WIFITools -name airgeddon -type d | grep -w "Tools/Wireless-Attacks/airgeddon"`
	if [ "$airgeddon" = "Tools/Wireless-Attacks/airgeddon" ]; then
		echo -e "[ ✔ ]   Airgeddon ${white}........... ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   Airgeddon ${white}........... ${red}$NotInstalled ${RESET}"
	cd $Folder_WIFITools
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download Airgeddon <=" -e git clone https://github.com/v1s1t0r1sh3r3/airgeddon.git
		cd airgeddon
		chmod 755 *.sh
		echo -e "[ ✔ ]   Airgeddon ${white}........... ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
}
############# hashcat ################
function hashcat {
 	if ! [ -f /usr/bin/hashcat ]; then
                echo -e "[ ! ]   hashcat ${white}............. ${red}$NotInstalled ${RESET}"
		cd $Folder_WIFITools
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download hashcat <=" -e git clone https://github.com/hashcat/hashcat.git
		cd hashcat
		make
		echo -e "[ ✔ ]   hashcat ${white}............. ${yellow}$Installed ${RESET}"
		cd $Work_dir
        else
		echo -e "[ ✔ ]   hashcat ${white}............. ${yellow}$Installed ${RESET}"
        fi
}
############# pmkid tool ################
############# hcxtools and hcxdumptools ################
function pmkcrack {
pmkcrack_tool=`find $Folder_WIFITools -name pmkcrack -type d | grep -w "Tools/Wireless-Attacks/pmkcrack"`
	if [ "$pmkcrack_tool" = "Tools/Wireless-Attacks/pmkcrack" ]; then
		echo -e "[ ✔ ]   pmkcrack ${white}............ ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   pmkcrack ${white}............ ${red}$NotInstalled ${RESET}"
		cp -r $Work_dir/$dirbackup_WIFIbackup/pmkcrack $Work_dir/$Folder_WIFITools/pmkcrack
		echo -e "[ ✔ ]   pmkcrack ${white}............ ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi

hcxtools=`find $Folder_WIFITools -name hcxtools -type d | grep -w "Tools/Wireless-Attacks/hcxtools"`
	if [ "$hcxtools" = "Tools/Wireless-Attacks/hcxtools" ]; then
		echo -e "[ ✔ ]   hcxtools ${white}............ ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   hcxtools ${white}............ ${red}$NotInstalled ${RESET}"
	cd $Folder_WIFITools
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download hcxtools <=" -e git clone https://github.com/ZerBea/hcxtools.git
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing hcxtools library <=" -e apt-get install libssl-dev libz-dev libpcap-dev libcurl4-openssl-dev --allow-unauthenticated -y
		cd hcxtools
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing hcxtools <=" -e  make
				xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing hcxtools <=" -e sudo make install
		echo -e "[ ✔ ]   hcxtools ${white}............ ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi

hcxdumptool=`find $Folder_WIFITools -name hcxdumptool -type d | grep -w "Tools/Wireless-Attacks/hcxdumptool"`
	if [ "$hcxdumptool" = "Tools/Wireless-Attacks/hcxdumptool" ]; then
		echo -e "[ ✔ ]   hcxdumptool ${white}......... ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   hcxdumptool ${white}......... ${red}$NotInstalled ${RESET}"
	cd $Folder_WIFITools
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download hcxdumptool <=" -e git clone https://github.com/ZerBea/hcxdumptool.git
		cd hcxdumptool
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing hcxdumptool <=" -e  make
				xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing hcxdumptool <=" -e sudo make install
		echo -e "[ ✔ ]   hcxdumptool ${white}......... ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
}
############# MDK4 ################
function mdk4 {
mdk4=`find $Folder_WIFITools -name mdk4 -type d | grep -w "Tools/Wireless-Attacks/mdk4"`
	if [ "$mdk4" = "Tools/Wireless-Attacks/mdk4" ]; then
		echo -e "[ ✔ ]   MDK4 ${white}................ ${yellow}$Installed ${RESET}"
	else    echo -e "[ ! ]   MDK4 ${white}................ ${red}$NotInstalled ${RESET}"
	cd $Folder_WIFITools
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Download MDK4 <=" -e git clone https://github.com/aircrack-ng/mdk4.git
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing MDK4 <=" -e apt-get install pkg-config libnl-3-dev libnl-genl-3-dev -y
		cd mdk4
		xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing MDK4 <=" -e  make
				xterm $BOTTOMRIGHT -bg "#000000" -fg "#FFFFFF" -title "=> Installing MDK4 <=" -e sudo make install
		echo -e "[ ✔ ]   MDK4 ${white}................ ${yellow}$Installed ${RESET}"
		cd $Work_dir
	fi
}
##################################
##############################################
function ShowAndInstall_MalwareTools {
clear
echo -e "${cyan}	Install Malware Tools${RESET}"
sleep 0.5
function all_malware_tools {
		drolit
		dkmc
		fatrat
		msfpc
		winpayloads
		astroid
		phantom
		tophat
		mpm
		venom
		hercules
		zirikatu
		chaos
		nxcrypt
		reverse0x1
		backdoor_factory
		trolo
		metasploitavevasion
		terminator
		hacktheworld
		avet
		zerodoor
		andsploit
		koadic
		mkvemon
		beelogger
		saint
	}
function ShowMalwareTable {
cat << !
 _________________________________________________________________________
|    |				     |    |				  |
| ID | 	Tool name		     | ID | 	Tool name		  |
|----+-------------------------------|----+-------------------------------|
| 1  | Dr0p1t-Framework 	     | 2  | Don't kill my cat  	          |
|----+-------------------------------|----+-------------------------------|
| 3  | TheFatRat 	             | 4  | MSFPC                         |
|----+-------------------------------|----+-------------------------------|
| 5  | Winpayloads   		     | 6  | Astroid   		          |
|----+-------------------------------|----+-------------------------------|
| 7  | Phantom  		     | 8  | Tophat	  		  |
|----+-------------------------------|----+-------------------------------|
| 9  | Meterpreter_Paranoid_Mode-SSL | 10 | Venom	  		  |
|----+-------------------------------|----+-------------------------------|
| 11 | Hercules	  		     | 12 | Zirikatu	  		  |
|----+-------------------------------|----+-------------------------------|
| 13 | Chaos	  		     | 14 | Nxcrypt	  		  |
|----+-------------------------------|----+-------------------------------|
| 15 | Reverse0x1	  	     | 16 | The-Backdoor-Factory	  |
|----+-------------------------------|----+-------------------------------|
| 17 | Trolo	  		     | 18 | Metasploitavevasion	          |
|----+-------------------------------|----+-------------------------------|
| 19 | Terminator	  	     | 20 | Hacktheworld	  	  |
|----+-------------------------------|----+-------------------------------|
| 21 | Avet	  		     | 22 | Zerodoor	  		  |
|----+-------------------------------|----+-------------------------------|
| 23 | Andsploit	  	     | 24 | Koadic	  		  |
|----+-------------------------------|----+-------------------------------|
| 25 | Mkvenom	  		     | 26 | Beelogger	  	          |
|----+-------------------------------|----+-------------------------------|
| 27 | Saint	  		     | 28 | ALL tools		          |
|----+-------------------------------|----+-------------------------------|
| 99 | $return_choose                       |                                    |
 ------------------------------------------------------------------------- 
!
}
ShowMalwareTable
	echo -ne "$install_parameter"
		while true; do
		read parameter
		case $parameter in		
		1) drolit;;
		2) dkmc;;
		3) fatrat;;
		4) msfpc;;
		5) winpayloads;;
		6) astroid;;
		7) phantom;;
		8) tophat;;
		9) mpm;;
		10) venom;;
		11) hercules;;
		12) zirikatu;;
		13) chaos;;
		14) nxcrypt;;
		15) reverse0x1;;
		16) backdoor_factory;;
		17) trolo;;
		18) metasploitavevasion;;
		19) terminator;;
		20) hacktheworld;;
		21) avet;;
		22) zerodoor;;
		23) andsploi;;
		24) koadic;;
		25) mkvemon;;
		26) beelogger;;
		27) saint;;
		28) all_malware_tools;;
		99) break;;
		*) echo -e "$error1";
		esac
	ShowMalwareTable
	echo -ne "$install_parameter"
		done
sleep 1
}

function ShowAndInstall_ExploitTools {
	check_exploit_folder=`find $direxploit_expframework -name exploit -type d | grep -w "./exploit"`
	if [ "$check_exploit_folder" = "./exploit" ]; then
		echo ""
	else
		mkdir -p $direxploit_expframework/exploit/windows/fileformat
		mkdir -p $direxploit_expframework/exploit/windows/smb
		mkdir -p $direxploit_expframework/exploit/windows/rdp

	fi
clear
echo -e "${cyan}	Install Vulnerability Exploit Tools${RESET}"
sleep 0.5

function all_exploit_tools {
	cve20170199
	cve20180802	
	}
function ShowVunlTable {
cat << !

	 _________________________________________________________________________
	|    |       			     |    |               		  |
	| 1  |        CVE-2017-11882 	     | 2  |       CVE-2017-0199           |
	|----+-------------------------------|----+-------------------------------|
	| 3  |        CVE-2017-8570          | 4  |       CVE-2018-0802           |
	|----+-------------------------------|----+-------------------------------|
	| 6  |          ALL                  | 99 |       back                    |
	|----+-------------------------------|----+-------------------------------|
!
}
ShowVunlTable
		echo -ne "$install_parameter"
		while true; do
		read parameter
		case $parameter in
		1) cve201711882;;
		2) cve20170199;;
		4) cve20180802;;
		6) all_exploit_tools;;
		99) break;;
		*) echo -e "$error1";
		esac
		ShowVunlTable
		echo -ne "$install_parameter"
		done

sleep 1
}

function ShowAndInstall_WiFiTools {
clear
echo -e "${cyan}	Install WIFI Tools${RESET}"
sleep 0.5
	function all_wifi_tools {
		fluxion
		wifiphisher
		airgeddon
		hashcat
		pmkcrack
		mdk4
	}
function ShowWIFITable {
cat << !
 _________________________________________________________________________
|    |				     |    |				  |
| ID | 	Tool name		     | ID | 	Tool name		  |
|----+-------------------------------|----+-------------------------------|
| 1  | Fluxion       	 	     | 2  | Wifiphisher  	          |
|----+-------------------------------|----+-------------------------------|
| 3  | Airgeddon 	             | 4  | Hashcat                       |
|----+-------------------------------|----+-------------------------------|
| 5  | Pmkcrack   		     | 6  | Mdk4   		          |
|----+-------------------------------|----+-------------------------------|
| 7  | ALL tools		     | 99 | $return_choose                       |
 ------------------------------------------------------------------------- 
!
}
ShowWIFITable
	echo -ne "$install_parameter"
		while true; do
		read parameter
		case $parameter in		
		1) fluxion;;
		2) wifiphisher;;
		3) airgeddon;;
		4) hashcat;;
		5) pmkcrack;;
		6) mdk4;;
		7) all_wifi_tools;;
		99) break;;
		*) echo -e "$error1";
		esac
	ShowWIFITable
	echo -ne "$install_parameter"
		done
sleep 1
}
function add_module_metasploits {
############# Post Metasploit  ################
if [[ "$dist0" = "Kali" ]] || [[ "$dist0" = "Parrot" ]]; then
	Folder_Module_Metasploit="/usr/share/metasploit-framework/modules"
else [ "$dist0" = "Ubuntu" ]
	Folder_Module_Metasploit="/opt/metasploit-framework/embedded/framework/modules"
fi
cd $dirbackup_metasploitbackup
	cp upload_injectCA.rb $Folder_Module_Metasploit/post/multi/manage/upload_injectCA.rb
cd $Work_dir
sleep 1
}
function ShowAndInstall_ALLTools {
		drolit
		dkmc
		fatrat
		msfpc
		winpayloads
		astroid
		phantom
		tophat
		mpm
		venom
		hercules
		zirikatu
		chaos
		nxcrypt
		reverse0x1
		backdoor_factory
		trolo
		metasploitavevasion
		terminator
		hacktheworld
		avet
		zerodoor
		andsploit
		koadic
		mkvemon
		beelogger
		saint
		fluxion
		wifiphisher
		airgeddon
		hashcat
		hcxtool
		mdk4
	add_module_metasploits
}
function create_shotcut {
path=$Work_dir
echo -e $okegreen "Do you want to create a shortcut for fatrat in your system"
echo -e $okegreen "so you can run fatrat from anywhere in your terminal and desktop ?"
echo ""
while true; do
echo -ne $cyan "Choose y/n : "
read cho
case $cho in
y|Y|Yes|yes|YES)
lnk=$?
if [ $lnk ==  "0" ];then
scrp="cd $path && ./Death-Note.sh"
rm -f /usr/local/sbin/Death-Note
touch /usr/local/sbin/Death-Note
echo "#!/bin/bash" > /usr/local/sbin/Death-Note
echo $scrp >> /usr/local/sbin/Death-Note
cp $path/config/Death-Note.desktop /usr/share/applications/Death-Note.desktop
cp $path/icons/Death-Note.ico /usr/share/icons/Death-Note.ico
chmod +x /usr/local/sbin/Death-Note
which Death-Note >> "$log" 2>&1
echo ""
echo -e $green "Instalation completed , To execute fatrat write anywhere in your terminal"
sleep 1
fi;
break;;
n|no|No|NO)
echo ""
sleep 0.5
break;;
*) echo -e "$error1";
sleep 1
esac
done
}
