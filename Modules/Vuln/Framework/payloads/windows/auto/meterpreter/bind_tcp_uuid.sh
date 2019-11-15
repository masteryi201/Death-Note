function defaul_payload_options {
	rhost=""
	lport1="4444"
	lport2="5555"
	exitfunc="process"
}
function payload_compare {
rhost_lenght=`echo $rhost | awk '{print length}'`
	if  [ "$rhost_lenght" -le 18 ]; then
		payload1
	else
		payload2
	fi
}
function set_payload {
		if [[ "$new_processing_variables" = "lport1" ]] || [[ "$new_processing_variables" = "LPORT1" ]] || [[ "$new_processing_variables" = "Lport1" ]]; then
			unset lport1
			lport1="$module_set"
		elif [[ "$new_processing_variables" = "lport2" ]] || [[ "$new_processing_variables" = "LPORT2" ]] || [[ "$new_processing_variables" = "Lport2" ]]; then
			unset lport2
			lport2="$module_set"
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
rhost=`echo $rhost`
rhost_lenght=`echo $rhost | awk '{print length}'`
	integer=`expr 18 - $rhost_lenght`			
	for (( i = 0 ; i < $integer; i++ )) do
		myvar=$myvar$none
	done
	rhost=$rhost$myvar
unset_value
lport1=`echo $lport1`
lport1_lenght=`echo $lport1 | awk '{print length}'`
	none=" "
	myvar=""
	integer=`expr 18 - $lport1_lenght`			
	for (( i = 0 ; i < $integer; i++ )) do
	myvar=$myvar$none
	done
	lport1=$lport1$myvar
unset_value
lport2=`echo $lport2`
lport2_lenght=`echo $lport2 | awk '{print length}'`
	none=" "
	myvar=""
	integer=`expr 18 - $lport2_lenght`			
	for (( i = 0 ; i < $integer; i++ )) do
	myvar=$myvar$none
	done
	lport2=$lport2$myvar
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
rhost=`echo $rhost`
rhost_lenght=`echo $rhost | awk '{print length}'`
	integer=`expr 27 - $rhost_lenght`			
	for (( i = 0 ; i < $integer; i++ )) do
		myvar=$myvar$none
	done
	rhost=$rhost$myvar
unset_value
lport1=`echo $lport1`
lport1_lenght=`echo $lport1 | awk '{print length}'`
	none=" "
	myvar=""
	integer=`expr 27 - $lport1_lenght`			
	for (( i = 0 ; i < $integer; i++ )) do
	myvar=$myvar$none
	done
	lport1=$lport1$myvar
unset_value
lport2=`echo $lport2`
lport2_lenght=`echo $lport2 | awk '{print length}'`
	none=" "
	myvar=""
	integer=`expr 27 - $lport2_lenght`			
	for (( i = 0 ; i < $integer; i++ )) do
	myvar=$myvar$none
	done
	lport2=$lport2$myvar
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
Các tùy chọn của tải trọng (windows/auto/meterpreter/bind_tcp_uuid):

   Tên            Thiết lập hiện tại    Yêu cầu   Miêu tả
   ----           ----------------      --------  -----------
   EXITFUNC       $exitfunc$no   Biện pháp tạo lối thoát (Được chấp nhận: '', seh, thread, process, none).
   LPORT1         $lport1$yes    Cổng lắng nghe 1. 
   LPORT2         $lport2$yes    Cổng lắng nghe 2.
   RHOST          $rhost$yes    Địa chỉ máy mục tiêu.

!
elif [ "$language" = "EN" ]; then
yes="     yes"
no="     no "
cat << !
Payload options (windows/auto/meterpreter/bind_tcp_uuid):

   Name           Current Setting       Required  Description
   ----           ---------------       --------  -----------
   EXITFUNC       $exitfunc$no      Exit technique (Accepted: '', seh, thread, process, none).
   LPORT1         $lport1$yes      The listen port 1.
   LPORT2         $lport2$yes      The listen port 2.
   RHOST          $rhost$yes      The target address.

!
fi
}
function payload_banner_2 {
if [ "$language" = "VN" ]; then
yes="   Có  "
no="   Không "
cat << !
Các tùy chọn của tải trọng (windows/auto/meterpreter/bind_tcp_uuid):

   Tên            Thiết lập hiện tại	       Yêu cầu    Miêu tả
   ----      	  ---------------  	       --------  -----------
   EXITFUNC       $exitfunc$no   Biện pháp tạo lối thoát (Được chấp nhận: '', seh, thread, process, none).
   LPORT1         $lport1$yes     Cổng lắng nghe 1. 
   LPORT2         $lport2$yes     Cổng lắng nghe 2.
   RHOST          $rhost$yes     Địa chỉ máy mục tiêu.

!
elif [ "$language" = "EN" ]; then
yes="   yes"
no="   no "
cat << !
Payload options (windows/auto/meterpreter/bind_tcp_uuid):

   Name           Current Setting  	       Required  Description
   ----           ---------------  	       --------  -----------
   EXITFUNC       $exitfunc$no      Exit technique (Accepted: '', seh, thread, process, none).
   LPORT1         $lport1$yes      The listen port 1.
   LPORT2         $lport2$yes      The listen port 2.
   RHOST          $rhost$yes      The target address

!
fi
}
function payload_run {
	paylo="windows/auto/meterpreter/bind_tcp_uuid"
	paylo1="windows/meterpreter/bind_tcp_uuid"
	paylo2="windows/x64/meterpreter/bind_tcp_uuid"
	rhost=$rhost
	lport1=$lport1
	lport2=$lport2
	exitfunc=$exitfunc
}
