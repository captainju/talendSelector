#!/bin/sh

folder=/home/captainju/talend/

nl=$'\n'

for i in `find $folder -maxdepth 2 -name "*linux-gtk-x86_64" | sort -r`
do
	x=$i
	y=${x#*-V}
	z=${y%/*}
	options="$options V$z $i$nl"
done

choice=$(zenity --list --width=700 --height=320 \
	--title="Talend version selector" \
	--column="Version" --column="Path" \
	--print-column=2 \
	$options)

if [ ! -z "$choice" ]
then
	strippedChoice=${choice#*|}
	nohup $strippedChoice > /dev/null &
fi
