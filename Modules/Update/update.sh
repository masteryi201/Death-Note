#!/bin/bash
#Repository and contact vars
repository_hostname="github.com"
github_user="masteryi201"
github_repository="Death-Note"
branch="master"
script_filename="Death-Note.sh"
urlgithub="https://${repository_hostname}/${github_user}/${github_repository}"
url_directlink="https://raw.githubusercontent.com/${github_user}/${github_repository}/${branch}/${script_filename}"


########### check update ##########
function checkupdate {
        revision_online="$(timeout -s SIGTERM 20 curl "$url_directlink" 2>/dev/null| grep "^revision" | cut -d "=" -f2)"
        if [ -z "$revision_online" ]; then
                echo "?">$DUMP_PATH/Irev
        else
                echo "$revision_online">$DUMP_PATH/Irev
        fi
}
########### update ##########
function download_last_version() {
	echo 
	local script_file_downloaded=0
	check=`cat $DUMP_PATH/Irev` > /dev/null 2>&1
	if [ $check != "$" ]; then
		check_internet=1
	else check_internet=0
	fi
	if [ $check_internet = 1 ]; then
		if timeout -s SIGTERM 15 curl -L ${url_directlink} -s -o "${0}" > /dev/null 2>&1; then
rm -r Backup/Death-Note/ > /dev/null 2>&1
cd $Work_dir/Backup > /dev/null 2>&1
git clone https://github.com/masteryi201/Death-Note.git > /dev/null 2>&1
cp -r Death-Note/install.sh $Work_dir > /dev/null 2>&1
cp -r Death-Note/language/ $Work_dir > /dev/null 2>&1
cp -r Death-Note/library/ $Work_dir > /dev/null 2>&1
cp -r Death-Note/Modules/ $Work_dir > /dev/null 2>&1
cp -r Death-Note/README.md $Work_dir > /dev/null 2>&1
cd  $Work_dir
cp $Work_dir/library/backup/Wireless-Attacks/pmkcrack/pmkcrack.sh $Work_dir/Tools/Wireless-Attacks/pmkcrack/pmkcrack.sh > /dev/null 2>&1
		script_file_downloaded=1

		fi
	else 
	script_file_downloaded=0
	echo "$not_internet"
	fi

	if [ "${script_file_downloaded}" -eq 1 ]; then

		chmod +x "${Work_dir}${scriptname}" > /dev/null 2>&1
		echo "$updated"
	fi
}
##################
