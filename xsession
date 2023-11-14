#!/bin/bash
PATH="$HOME/bin:$PATH"


# set keyboard layout to us
setxkbmap us &

# Start your wm!
dte(){
  dte="$(date +"%A, %B %d | 🕒 %l:%M%p")"
  echo -e "$dte"
}

mem(){
  mem=`free | awk '/Mem/ {printf "%d MiB/%d MiB\n", $3 / 1024.0, $2 / 1024.0 }'`
  echo -e "🖪 $mem"
}

cpu(){
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  echo -e "💻 $cpu% cpu"
}

bat() {
    bat=`upower -i $(upower -e | grep BAT) | grep --color=never "percentage" | awk -F ":" '{print $2}' | xargs`
    echo -e "🔋 $bat"
}

while true; do
    xsetroot -name "$(bat) | $(cpu) | $(mem) | $(dte)"
     sleep 1m    # Update time every ten seconds
done &

wmname LG3D
export _JAVA_AWT_WM_NONREPARENTING=1
exec dwm
