# Date and timerfkill list bluetooth | grep -o "Soft blocked: no"
date_and_week=$(date "+%d.%m.%Y (w%-V)")
current_time=$(date "+%H:%M:%S")

# Battery
battery_capacity=$(cat /sys/class/power_supply/BAT0/capacity) + "%"

if [[ -z "$bluetooth_status" ]]; then
    battery_capacity=""
fi

# Network
network_status=$(nmcli networking connectivity)

# Bluetooth
bluetooth_status=$(rfkill list bluetooth | grep -o "Soft blocked: no")

if [[ -n "$bluetooth_status" ]]; then
    bluetooth_status="On"
else
    bluetooth_status="Off"
fi

# VPN
vpn_status="| VPN: " + $(nmcli connection show --active | grep -o "vpn") + " |"

if [[ -z "$vpn_status" ]]; then
    vpn_status=""
fi

# Audio and multimedia
audio_volume=$(amixer get Master | grep "Right:" | grep -oE "[0-9]+%")
media_artist=$(playerctl metadata artist)
media_song=$(playerctl metadata title)
player_status=$(playerctl status)

if [ $player_status = "Playing" ]
then
    song_status='▶'
elif [ $player_status = "Paused" ]
then
    song_status='⏸'
else
    song_status='⏹'
fi

echo "$media_artist - $media_song | VOL: $audio_volume | BL: $bluetooth_status $vpn_status | $battery_capacity $date_and_week | $current_time"
