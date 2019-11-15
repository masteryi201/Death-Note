function defaul_payload_options {
	pipehost=""
	pipename="msf-pipe"
	exitfunc="process"
}
function payload_compare {
pipehost_lenght=`echo "$pipehost" | awk '{print length}'`
	if  [ "$pipehost_lenght" -le 18 ]; then
		payload1
	else
		payload2
	fi
}
function set_payload {
		if [[ "$new_processing_variables" = "pipehost" ]] || [[ "$new_processing_variables" = "PIPEHOST" ]] || [[ "$new_processing_variables" = "Pipehost" ]]; then
			unset pipehost
			pipehost="$module_set"
		elif [[ "$new_processing_variables" = "pipename" ]] || [[ "$new_processing_variables" = "PIPENAME" ]] || [[ "$new_processing_variables" = "Pipename" ]]; then
			unset pipename
			pipename="$module_set"
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
pipehost=`echo $pipehost`
pipehost_lenght=`echo $pipehost | awk '{print length}'`
	integer=`expr 18 - $pipehost_lenght`			
	for (( i = 0 ; i < $integer; i++ )) do
		myvar=$myvar$none
	done
	pipehost=$pipehost$myvar
unset_value
pipename=`echo $pipename`
pipename_lenght=`echo $pipename | awk '{print length}'`
	none=" "
	myvar=""
	integer=`expr 18 - $pipename_lenght`			
	for (( i = 0 ; i < $integer; i++ )) do
	myvar=$myvar$none
	done
	pipename=$pipename$myvar
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
pipehost=`echo $pipehost`
pipehost_lenght=`echo $pipehost | awk '{print length}'`
	integer=`expr 27 - $pipehost_lenght`			
	for (( i = 0 ; i < $integer; i++ )) do
		myvar=$myvar$none
	done
	pipehost=$pipehost$myvar
unset_value
pipename=`echo $pipename`
pipename_lenght=`echo $pipename | awk '{print length}'`
	none=" "
	myvar=""
	integer=`expr 27 - $pipename_lenght`			
	for (( i = 0 ; i < $integer; i++ )) do
	myvar=$myvar$none
	done
	pipename=$pipename$myvar
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
Các tùy chọn của tải trọng (windows/meterpreter/reverse_named_pipe):

   Tên            Thiết lập hiện tại    Yêu cầu   Miêu tả
   ----           ----------------      --------  -----------
   EXITFUNC       $exitfunc$no   Biện pháp tạo lối thoát (Được chấp nhận: '', seh, thread, process, none).
   PIPEHOST       $pipehost$yes    Máy chủ PIPE để kết nối với.
   PIPENAME       $pipename$yes    Tên của PIPE để lắng nghe.

!
elif [ "$language" = "EN" ]; then
yes="     yes"
no="     no "
cat << !
Payload options (windows/meterpreter/reverse_named_pipe):

   Name           Current Setting       Required  Description
   ----           ---------------       --------  -----------
   EXITFUNC       $exitfunc$no      Exit technique (Accepted: '', seh, thread, process, none).
   PIPEHOST       $pipehost$yes      Host of the pipe to connect to.
   PIPENAME       $pipename$yes      Name of the pipe to listen on.

!
fi
}
function payload_banner_2 {
if [ "$language" = "VN" ]; then
yes="   Có  "
no="   Không "
cat << !
Các tùy chọn của tải trọng (windows/meterpreter/reverse_named_pipe):

   Tên            Thiết lập hiện tại	       Yêu cầu    Miêu tả
   ----      	  ---------------  	       --------  -----------
   EXITFUNC       $exitfunc$no   Biện pháp tạo lối thoát (Được chấp nhận: '', seh, thread, process, none).
   PIPEHOST       $pipehost$yes     Máy chủ PIPE để kết nối với.
   PIPENAME       $pipename$yes     Tên của PIPE để lắng nghe.

!
elif [ "$language" = "EN" ]; then
yes="   yes"
no="   no "
cat << !
Payload options (windows/meterpreter/reverse_named_pipe):

   Name           Current Setting  	       Required  Description
   ----           ---------------  	       --------  -----------
   EXITFUNC       $exitfunc$no      Exit technique (Accepted: '', seh, thread, process, none).
   PIPEHOST       $pipehost$yes      Host of the pipe to connect to.
   PIPENAME       $pipename$yes      Name of the pipe to listen on.

!
fi
}
function payload_run {
payload_path_present=`pwd`
payload_path_rc_file="$payload_path_present/Config"
rc_file="$payload_path_rc_file/file.rc"
config_file="$payload_path_present/Config/config"
	echo "set payload windows/meterpreter/reverse_named_pipe" >> $rc_file
	echo "set EXITFUNC $exitfunc" >> $rc_file
	echo "set PIPEHOST $pipehost" >> $rc_file
	echo "set PIPENAME $pipename" >> $rc_file
	paylo="windows/meterpreter/reverse_named_pipe"
}
