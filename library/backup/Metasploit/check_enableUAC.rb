##
# This module requires Metasploit: https://metasploit.com/download
# Current source: https://github.com/rapid7/metasploit-framework
##

class MetasploitModule < Msf::Post
  include Msf::Post::File

  def initialize(info={})
    super( update_info( info,
      'Name'          => 'Checking and Enable UAC',
      'Description'   => %q{ Checking and Enable User Account Control },
      'License'       => MSF_LICENSE,
      'Author'        => [ 'Ryuk'],
      'Platform'      => [ 'win' ],
      'SessionTypes'  => [ 'meterpreter','shell' ]
    ))

    register_options(
      [
      ])
  end
def run
       print_status("Checking!")
    if session.platform.include?("windows")
       checking = cmd_exec("cmd.exe /c REG QUERY HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System\\ /v EnableLUA")
       if checking["0x0"]
	  print_status("The target system is turn off UAC")
          print_status("Turning on UAC ...")
          cmd_exec("cmd.exe /c REG ADD HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System /v EnableLUA /t REG_DWORD /d 1 /f")
       else
          print_status("The target system has UAC enabled")
       end
    else
       print_error("The module only supports Windows platform.")
    end
   print_good("Finish the module ...")
  end
end

