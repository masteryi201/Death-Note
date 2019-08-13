function defaul_payload_options {
	lhost=`ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1 -d'/'`
	lport="4444"
	exitfunc="process"
	luri=""
}
function payload_compare {
lhost_lenght=`echo "$lhost" | awk '{print length}'`
	if  [ "$lhost_lenght" -le 18 ]; then
		payload1
	else
		payload2
	fi
}
function set_payload {
		if [[ "$new_processing_variables" = "lhost" ]] || [[ "$new_processing_variables" = "LHOST" ]]; then
			unset lhost
			lhost=$module_set
		elif [[ "$new_processing_variables" = "lport" ]] || [[ "$new_processing_variables" = "LPORT" ]]; then
			unset lport
			lport="$module_set"
		elif [[ "$new_processing_variables" = "exitfunc" ]] || [[ "$new_processing_variables" = "EXITFUNC" ]]; then
			unset exitfunc
			exitfunc="$module_set"
		elif [[ "$new_processing_variables" = "luri" ]] || [[ "$new_processing_variables" = "LURI" ]]; then
			unset exitfunc
			exitfunc="$module_set"
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
lhost=`echo $lhost`
lhost_lenght=`echo $lhost | awk '{print length}'`
	integer=`expr 18 - $lhost_lenght`			
	for (( i = 0 ; i < $integer; i++ )) do
		myvar=$myvar$none
	done
	lhost=$lhost$myvar
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
luri=`echo $luri`
luri_lenght=`echo $luri | awk '{print length}'`
	integer=`expr 18 - $luri_lenght`			
	for (( i = 0 ; i < $integer; i++ )) do
	myvar=$myvar$none
	done
	luri=$luri$myvar
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
lhost=`echo $lhost`
lhost_lenght=`echo $lhost | awk '{print length}'`
	integer=`expr 27 - $lhost_lenght`			
	for (( i = 0 ; i < $integer; i++ )) do
		myvar=$myvar$none
	done
	lhost=$lhost$myvar
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
luri=`echo $luri`
luri_lenght=`echo $luri | awk '{print length}'`
	integer=`expr 27 - $luri_lenght`			
	for (( i = 0 ; i < $integer; i++ )) do
	myvar=$myvar$none
	done
	luri=$luri$myvar
unset_value
payload_banner_2
}
function payload_banner_1 {
if [ "$language" = "VN" ]; then
yes="  Có "
no="  Không "
cat << !
Các tùy chọn của tải trọng (windows/meterpreter/reverse_tcp):

   Tên            Thiết lập hiện tại  Yêu cầu   Miêu tả
   ----           ----------------    --------  -----------
   EXITFUNC       $exitfunc$yes       Biện pháp tạo lối thoát (Được chấp nhận: '', seh, thread, process, none)
   LHOST          $lhost$yes       Địa chỉ lắng nghe
   LPORT          $lport$yes       Cổng lắng nghe
   LURI           $luri$no         Đường dẫn HTTP
!
elif [ "$language" = "EN" ]; then
yes="  yes"
no="  no "
cat << !
Payload options (windows/meterpreter/reverse_tcp):

   Name           Current Setting  Required  Description
   ----           ---------------  --------  -----------
   EXITFUNC       $exitfunc$yes    Exit technique (Accepted: '', seh, thread, process, none)
   LHOST          $lhost$yes    The listen address
   LPORT          $lport$yes    The listen port
   LURI           $luri$no      The HTTP Path

!
fi
}
function payload_banner_2 {
if [ "$language" = "VN" ]; then
yes="  Có  "
no="  Không "
cat << !
Các tùy chọn của tải trọng (windows/meterpreter/reverse_tcp):

   Tên            Thiết lập hiện tại	       Yêu cầu    Miêu tả
   ----      	  ---------------  	       --------  -----------
   EXITFUNC       $exitfunc$yes       Biện pháp tạo lối thoát (Được chấp nhận: '', seh, thread, process, none)
   LHOST          $lhost$yes       Địa chỉ lắng nghe
   LPORT          $lport$yes       Cổng lắng nghe
   LURI           $luri$no         Đường dẫn HTTP

!
elif [ "$language" = "EN" ]; then
yes="  yes"
no="  no "
cat << !
Payload options (windows/meterpreter/reverse_tcp):

   Name           Current Setting  	       Required  Description
   ----           ---------------  	       --------  -----------
   EXITFUNC       $exitfunc$yes       Exit technique (Accepted: '', seh, thread, process, none)
   LHOST          $lhost$yes       The listen address
   LPORT          $lport$yes       The listen port
   LURI           $luri$no      The HTTP Path

!
fi
}
function payload_run {
payload_path_present=`pwd`
payload_path_rc_file="$payload_path_present/Config"
rc_file="$payload_path_rc_file/file.rc"
	echo "set payload $payload_OS/$payload_format/$payload_name" >> $rc_file
	echo "set LHOST $lhost" >> $rc_file
	echo "set LPORT $lport" >> $rc_file
	echo "set EXITFUNC $exitfunc" >> $rc_file
	echo "set LURI $luri" >> $rc_file
}
