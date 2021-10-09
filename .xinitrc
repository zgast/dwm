xset dpms 60 120 180
xss -lock slock

feh --bg-scale  /home/markus/Nextcloud/pics/backgrounds/tree.jpg



while true; do

    SPACER="  "
    START=""
    END=""

    CPU="$(echo -e "\uf2db") $(top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}')% / 100%"
    MEM="$(echo -e "\uf1c0") $(free -m | grep '^Mem' | awk '{print  $3 " MB / " $2" MB"}')"
    AKKU="$(echo -e "\uf241") $(acpi | awk '{print $4}' | sed s/,//)"
    TIME="$(echo -e "\uf133") $(date +"%d.%m.%Y$SPACER$(echo -e "\uf017") %R")"

    xsetroot -name "$START$CPU$SPACER$MEM$SPACER$AKKU$SPACER$TIME$END"    
sleep 1s
done &

#while true; do
     
#    if [ $(acpi | awk '{print $4}' | sed s/%,//) -lt 5 ]
#    then
#        brightnessctl set 30
#    fi

#    sleep 1s		
#done &

exec dwm









