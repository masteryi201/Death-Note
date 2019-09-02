function defaul_payload_options {
	khost=""
	rhost=""
	lport="4444"
	exitfunc="process"
}
function payload_compare {
khost_lenght=`echo "$khost" | awk '{print length}'`
echo $khost_lenght
	if  [ "$khost_lenght" -le 18 ]; then
		payload1
	else
		payload2
	fi
}
function set_payload {
		if [[ "$new_processing_variables" = "khost" ]] || [[ "$new_processing_variables" = "KHOST" ]] || [[ "$new_processing_variables" = "Khost" ]]; then
			unset khost
			khost="$module_set"
		elif [[ "$new_processing_variables" = "lport" ]] || [[ "$new_processing_variables" = "LPORT" ]] || [[ "$new_processing_variables" = "Lport" ]]; then
			unset lport
			lport="$module_set"
		elif [[ "$new_processing_variables" = "rhost" ]] || [[ "$new_processing_variables" = "RHOST" ]] || [[ "$new_processing_variables" = "Rhost" ]]; then
			unset rhost
			rhost="$module_set"
		elif [[ "$new_processing_variables" = "exitfunc" ]] || [[ "$new_processing_variables" = "EXITFUNC" ]] || [[ "$new_processing_variables" = "Exitfunc" ]]; then
			if [[ "$module_set" = "" ]] || [[ "$module_set" = "" ]] || [[ "$module_set" = "" ]]; then
				unset exitfunc
				exitfunc="$module_set"
			elif [[ "$module_set" = "seh" ]] || [[ "$module_set" = "SEH" ]] || [[ "$module_set" = "Seh" ]]; then
				unset exitfunc
				exitfunc="$module_set"
			elif [[ "$module_set" = "thread" ]] || [[ "$module_set" = "THREAD" ]] || [[ "$module_set" = "Thread" ]]; then
				unset exitfunc
				exitfunc="$module_set"
			elif [[ "$module_set" = "process" ]] || [[ "$module_set" = "PROCESS" ]] || [[ "$module_set" = "Process," ]]; then
				unset exitfunc
				exitfunc="$module_set"
			elif [[ "$module_set" = "none" ]] || [[ "$module_set" = "NONE" ]] || [[ "$module_set" = "None" ]]; then
				unset exitfunc
				exitfunc="$module_set"
			else 	failed_to_validate=" $failed_validate'$module_set' $notvalid '$new_processing_variables'"
				echo -e "$red[-]$RESET" $failed_to_validate
			fi
		fi
}
function payload1 {
none=" "
myvar=""
	function unset_value {
		unset none
		unset myvar
		unset integer
		none=" "
		myvar=""
	}
khost=`echo $khost`
khost_lenght=`echo $khost | awk '{print length}'`
	integer=`expr 18 - $khost_lenght`			
	for (( i = 0 ; i < $integer; i++ )) do
		myvar=$myvar$none
	done
	khost=$khost$myvar
unset_value
rhost=`echo $rhost`
rhost_lenght=`echo $rhost | awk '{print length}'`
	integer=`expr 18 - $rhost_lenght`			
	for (( i = 0 ; i < $integer; i++ )) do
		myvar=$myvar$none
	done
	rhost=$rhost$myvar
unset_value
lport=`echo $lport`
lport_lenght=`echo $lport | awk '{print length}'`
	none=" "
	myvar=""
	integer=`expr 18 - $lport_lenght`			
	for (( i = 0 ; i < $integer; i++ )) do
	myvar=$myvar$none
	done
	lport=$lport$myvar
unset_value
exitfunc=`echo $exitfunc`
exitfunc_lenght=`echo $exitfunc | awk '{print length}'`
	integer=`expr 18 - $exitfunc_lenght`			
	for (( i = 0 ; i < $integer; i++ )) do
	myvar=$myvar$none
	done
	exitfunc=$exitfunc$myvar
unset_value
payload_banner_1
}
function payload2 {
none=" "
myvar=""
	function unset_value {
		unset none
		unset myvar
		unset integer
		none=" "
		myvar=""
	}
khost=`echo $khost`
khost_lenght=`echo $khost | awk '{print length}'`
	integer=`expr 27 - $khost_lenght`			
	for (( i = 0 ; i < $integer; i++ )) do
		myvar=$myvar$none
	done
	khost=$khost$myvar
unset_value
rhost=`echo $rhost`
rhost_lenght=`echo $rhost | awk '{print length}'`
	integer=`expr 27 - $rhost_lenght`			
	for (( i = 0 ; i < $integer; i++ )) do
		myvar=$myvar$none
	done
	rhost=$rhost$myvar
unset_value
lport=`echo $lport`
lport_lenght=`echo $lport | awk '{print length}'`
	none=" "
	myvar=""
	integer=`expr 27 - $lport_lenght`			
	for (( i = 0 ; i < $integer; i++ )) do
	myvar=$myvar$none
	done
	lport=$lport$myvar
unset_value
exitfunc=`echo $exitfunc`
exitfunc_lenght=`echo $exitfunc | awk '{print length}'`
	integer=`expr 27 - $exitfunc_lenght`			
	for (( i = 0 ; i < $integer; i++ )) do
	myvar=$myvar$none
	done
	exitfunc=$exitfunc$myvar
unset_value
payload_banner_2
}
function payload_banner_1 {
if [ "$language" = "VN" ]; then
yes="     Có   "
no="     Không "
cat << !
Các tùy chọn của tải trọng (windows/meterpreter/bind_hidden_ipknock_tcp):

   Tên            Thiết lập hiện tại    Yêu cầu   Miêu tả
   ----           ----------------      --------  -----------
   EXITFUNC       $exitfunc$no   Biện pháp tạo lối thoát (Được chấp nhận: '', seh, thread, process, none).
   KHOST          $khost$yes    Địa chỉ IP được cho phép.
   LPORT          $lport$yes    Cổng lắng nghe.
   RHOST          $rhost$yes    Địa chỉ máy mục tiêu.

!
elif [ "$language" = "EN" ]; then
yes="     yes"
no="     no "
cat << !
Payload options (windows/meterpreter/bind_hidden_ipknock_tcp):

   Name           Current Setting       Required  Description
   ----           ---------------       --------  -----------
   EXITFUNC       $exitfunc$no      Exit technique (Accepted: '', seh, thread, process, none).
   KHOST          $khost$yes      IP address allowed
   LPORT          $lport$yes      The listen port.
   RHOST          $rhost$yes      The target address.

!
fi
}
function payload_banner_2 {
if [ "$language" = "VN" ]; then
yes="   Có  "
no="   Không "
cat << !
Các tùy chọn của tải trọng (windows/meterpreter/bind_hidden_ipknock_tcp):

   Tên            Thiết lập hiện tại	       Yêu cầu    Miêu tả
   ----      	  ---------------  	       --------  -----------
   EXITFUNC       $exitfunc$no   Biện pháp tạo lối thoát (Được chấp nhận: '', seh, thread, process, none).
   KHOST          $khost$yes     Địa chỉ IP được cho phép.
   LPORT          $lport$yes     Cổng lắng nghe.
   RHOST          $rhost$yes     Địa chỉ máy mục tiêu.

!
elif [ "$language" = "EN" ]; then
yes="   yes"
no="   no "
cat << !
Payload options (windows/meterpreter/bind_hidden_ipknock_tcp):

   Name           Current Setting  	       Required  Description
   ----           ---------------  	       --------  -----------
   EXITFUNC       $exitfunc$no      Exit technique (Accepted: '', seh, thread, process, none).
   KHOST          $khost$yes      IP address allowed.
   LPORT          $lport$yes      The listen port.
   RHOST          $rhost$yes      The target address

!
fi
}
function payload_run {
payload_path_present=`pwd`
payload_path_rc_file="$payload_path_present/Config"
rc_file="$payload_path_rc_file/file.rc"
config_file="$payload_path_present/Config/config"
	echo "set payload windows/meterpreter/bind_hidden_ipknock_tcp" >> $rc_file
	echo "set EXITFUNC $exitfunc" >> $rc_file
	echo "set KHOST $khost" >> $rc_file
	echo "set RHOST $rhost" >> $rc_file
	paylo="windows/meterpreter/bind_hidden_ipknock_tcp"
	khost=$khost
	lport=$lport
}
