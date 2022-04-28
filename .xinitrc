xset dpms 60 120 180
feh --bg-scale  /home/markus/seafile/MyLibrary/pics/backgrounds/background_car.png

##  picom --config /home/markus/Documents/GitHub/dwm/picom.conf &
picom --experimental-backends --config /home/markus/Documents/GitHub/dwm/picom.conf &


IS_SHOWED=0

while true; do

    SPACER="    "
    START=""
    END=" "

    CPU="$(echo -e "\uf2db") $(top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}')% / 100%"
    MEM="$(echo -e "\uf1c0") $(free -m | grep '^Mem' | awk '{print  $3 " MB / " $2" MB"}')"
    SOUND="$(echo -e "\uf028") $(amixer -D pulse sget Master | grep 'Left:' | awk -F'[][]' '{ print $2 }')"
    BRIGHTNESS="$(echo -e " \uf185") $(echo -e "$((($(cat /sys/class/backlight/amdgpu_bl0/actual_brightness) / 2.55)))"  | grep -o -P "\b\d{1,3}\b")%"
    AKKU="$(echo -e "\uf241") $(acpi | awk '{print $4}' | sed s/,//)"
    DATE="$(echo -e "\uf133") $(date +"%d.%m.%Y")"
    TIME="$(echo -e "\uf017") $(date "+%R")"

    xsetroot -name "$START$CPU$SPACER$MEM$SPACER$SOUND$SPACER$BRIGHTNESS$SPACER$AKKU$SPACER$DATE$SPACER$TIME$END"    
   
   if [ "$(acpi | awk '{print $4}' | sed s/,// | sed s/%//)" -le "7" ]
   then
       if [ $IS_SHOWED -le 1 ]
       then 
          brightnessctl set 0%
          IS_SHOWED=20
       fi
        
   else
        IS_SHOWED=0
   fi


sleep 0.2s
done &
seaf-cli start
bash  /home/markus/shart.sh
xmodmap /home/markus/.xmodmap-`uname -n` &

exec dwm
