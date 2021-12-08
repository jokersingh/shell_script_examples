#!/usr/bin/env bash

readonly data=(       
                            '192.168.1.4/24|tcp|22'
                            '192.168.1.4/24|tcp|53'
                            '192.168.1.4/24|tcp|80'
                            '192.168.1.4/24|tcp|139'
                            '192.168.1.4/24|tcp|443'
                            '192.168.1.4/24|tcp|445'
                            '192.168.1.4/24|tcp|631'
                            '192.168.1.4/24|tcp|5901'
                            '192.168.1.4/24|tcp|6566'
)

function set_data(){
    IFS=$'|' read -r range proto port <<< "$1"
	echo "$range", "$proto", "$port" "$2" "$3" 
	# curl -POST --insecure url -d ''
}

function loop(){
	count=1 
	local range proto port
    for fields in ${data[@]}
    do
		for i in {1..3}
		do
			set_data "$fields" "$count" "$i"
		done
		count=`expr $count + 1`
    done
}

loop