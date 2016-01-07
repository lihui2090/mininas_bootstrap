#!/bin/bash
#test example

FLAGS=0
TESTFILE="testfile.log"
test_file(){
    if [ ! -f $1 ];then
        FLAGS=$(($FLAGS+1))
		printf "$1\t\t\tfailed\n" >> $TESTFILE
    fi
}

test_dir(){
    if [ ! -d $1 ];then
        FLAGS=$(($FLAGS+1))
		printf "$1\t\t\tfailed\n" >> $TESTFILE
    fi
}

test_mininas_example() {
   echo "test"
}

highlight () {
	echo -e "\e[32m\e[1m${1}\e[0m"
}

result_test(){
	if [ $1 -eq 0 ];then
		printf "pass\n"
	else
		printf "$1 files failed\n"
	fi
}

basic_files_test(){
	highlight "system files test"
	FLAGS=0
	printf "\nsystem files:\n" >> $TESTFILE
	test_file "/etc/fstab"	
	test_file "/etc/mininas/data/configs/volume.json"
	test_dir "/etc/mininas/chassis"
	test_file "/etc/mininas/version"
	test_file "/etc/mininas/hardversion"
	test_file "/etc/mininas/updatedversion"
	test_file "/usr/local/sbin/mininas_common"
	test_file "/usr/local/sbin/mininas_dvmtree"
	test_file "/usr/local/sbin/mininas_pool_disable"
	test_file "/usr/local/sbin/mininas_pool_refresh"
	test_file "/usr/local/sbin/mininas_pool_usage"
	test_file "/usr/local/sbin/mininas_touch"
	test_file "/usr/local/sbin/mininas_user_delete"
	test_file "/usr/local/sbin/mininas_disk_info"
	test_file "/usr/local/sbin/mininas_initial_pool_refresh"
	test_file "/usr/local/sbin/mininas_pool_enable"
	test_file "/usr/local/sbin/mininas_pool_replace_device"
	test_file "/usr/local/sbin/mininas_update_guide_small.sh"
	test_file "/usr/local/sbin/mininas_user_password"
	test_file "/usr/local/sbin/mininas_disk_probe"
	test_file "/usr/local/sbin/mininas_pool_add_device"
	test_file "/usr/local/sbin/mininas_pool_make_volume"
	test_file "/usr/local/sbin/mininas_btrfs_fi_show"
	test_file "/usr/local/sbin/mininas_dvm"
	test_file "/usr/local/sbin/mininas_pool_create"
	test_file "/usr/local/sbin/mininas_pool_probe"
	test_file "/usr/local/sbin/mininas_pool_snapshot_volume"
	test_file "/usr/local/sbin/mininas_share_members"
	test_file "/usr/local/sbin/mininas_user_create_home"
	test_file "/usr/local/sbin/mininas_volume_usage"
	test_dir "/etc/mininas/data/dvm"
	test_file "/lib/systemd/system/mnt-1.mount"
	test_file "/lib/systemd/system/mnt-1-mount-success.service"
	test_file "/lib/systemd/system/mnt-1-mount-failure.service"
	result_test $FLAGS
}

samba_test(){
	highlight "samba test"
	FLAGS=0
	printf "\nsamba files:\n" >> $TESTFILE
	test_file "/etc/samba/smb.conf"
	test_file "/etc/mininas/data/configs/samba.json"
	test_dir "/etc/mininas/templates/samba"
	result_test $FLAGS
}
ssh_test(){
	highlight "ssh test"
	FLAGS=0
	printf "\nssh files:\n" >> $TESTFILE
	test_file "/etc/ssh/sshd_config"
	result_test $FLAGS
}

ssdp_test(){
	highlight "ssdp test"
	FLAGS=0
	printf "\nssdp files:\n" >> $TESTFILE
	test_file "/usr/local/sbin/ssdp"
	result_test $FLAGS
}

key_led_test(){
	highlight "key and led test"
	FLAGS=0
	printf "\nkey and led files:\n" >> $TESTFILE
	test_file "/usr/local/sbin/powerkey_chk.sh"
	result_test $FLAGS
}

update_starter_test(){
	highlight "update starter test"
	FLAGS=0
	printf "\nupdate starter files:\n" >> $TESTFILE
	test_file "/usr/local/sbin/updated_starter.sh"
	result_test $FLAGS
}
netatalk_test(){
	highlight "netatalk test"
	FLAGS=0
	printf "\nnetatalk files:\n" >> $TESTFILE
	test_file /etc/mininas/data/configs/afp.json
	test_dir /etc/mininas/templates/netatalk
	test_file /usr/local/etc/afp.conf
	test_dir /usr/include/netatalk
	test_dir /usr/local/lib/netatalk
	test_dir /usr/local/var/netatalk
	test_file /usr/local/sbin/netatalk
	test_dir /mininas/ping/netatalk
	test_file /etc/pam.d/netatalk
	result_test $FLAGS
}
