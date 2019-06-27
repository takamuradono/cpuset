	#bash script that sets cpu settings
	function main_menu
	{
	clear
	cursetting=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)
	getspd=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq)
	curspd=$(echo $getspd 1000000 | awk '{printf $1 / $2}')
	echo "CPU freq"
	echo "1. CPU min"
	echo "2. CPU medium"
	echo "3. CPU max"
	echo "4. Now with exit commands!"
	echo "Current CPU "$cursetting;
	echo "Current CPU speed"$curspd" GHz";
	choice=4
	echo -e "Choose your warrior and write your own destiny : \c"
	}

	function press_enter
	{
	echo ""
	echo -n "Hit Enter"
	read
	main_menu
	}

	main_menu
	while [ $choice -eq 4 ] ; do
	read choice

	if [ $choice -eq 1 ] ; then
	echo powersave | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor;
	main_menu
	else
	if [ $choice -eq 2 ] ; then
	echo ondemand | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor;
	main_menu
	else
	if [ $choice -eq 3 ] ; then
	echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor;
	main_menu
	else 
	if [ $choice -eq 4 ]; then
		exit
	else
	echo -e "Do what?: \c"
	choice=5
	fi
	fi
	fi
	fi
	done 
