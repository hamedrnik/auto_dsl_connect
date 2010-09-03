#!/bin/bash
#
#    Auto DSL Connect Automatically connects to dsl connection in NetworkManager for GNU/Linux.
#    Copyright (C) 2010  Hamed Ramezanian
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

CHECK_WAIT=60
SECOND_CONNECTION_START=3
SECOND_CONNECTION_END=8
FIRST_DSL_PROVIDER="first_dsl_provider"
SECOND_DSL_PROVIDER="second_dsl_provider"

prompt () (
	TimeStamp=$(date)
	echo "["$TimeStamp"] : "$1
)

wait() {
	if [ -z $1 ]; then
		:
	else
#		echo -n "wait for "$1" seconds..."
		i=0
		while [ $i -lt $1 ]; do
			sleep 1
#			echo -n $i
			let "i++"
		done
#		echo $i
	fi
}

check_and_connect()
{
	active_connection=$(cnetworkmanager -tc|grep -w $1|cut -d "|" -f 2)

	if ! [ $active_connection = $1 ]; then
		prompt "Connectiong to "$1"..."
		cnetworkmanager --activate-connection=user,$1,eth0,&
		wait 40
		killall cnetworkmanager
		prompt "done."
	else
		prompt "It seems that every thing is OK! but I will check connection "$CHECK_WAIT" seconds later."
		wait $CHECK_WAIT
	fi
}

main()
{
	while [ 1 ]
	do
		Hour=$(date +%H)
		if [ $Hour -lt $SECOND_CONNECTION_START ] || ! [ $Hour -lt $SECOND_CONNECTION_END ]; then
			Dsl=$FIRST_DSL_PROVIDER
		else
			Dsl=$SECOND_DSL_PROVIDER
		fi
		check_and_connect $Dsl
	done
	exit 1
}

main >> .adc.log

