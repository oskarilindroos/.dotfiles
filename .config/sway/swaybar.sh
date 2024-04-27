# Date and time
date_and_week=$(date "+%d.%m.%Y (w%-V)")
current_time=$(date "+%H:%M:%S")

# Battery
battery_capacity=$(cat /sys/class/power_supply/BAT0/capacity)% 

# if on desktop, don't show battery
if [[ -z $(ls /sys/class/power_supply | grep BAT) ]]; then
    battery_capacity=""
fi

# Bluetooth
if rfkill list bluetooth | grep -q "Soft blocked: no"; then
    bluetooth_state="On |"
else
    bluetooth_state="Off |"
fi

# VPN
active_connections=$(nmcli connection show --active | grep -o "vpn")
if [[ -n "$active_connections" ]]; then
    vpn_status="VPN: $active_connections |"
else
    vpn_status=""
fi

# Audio and multimedia
audio_volume="VOL: $(amixer get Master | grep "Right:" | grep -oE "[0-9]+%") |"
media_artist=$(playerctl metadata artist)
media_song=$(playerctl metadata title)
player_status=$(playerctl status)

if [[ "$player_status" == "Playing" ]]; then
    if [[ -n "$media_artist" && -n "$media_song" ]]; then
        media_string="$media_artist - $media_song |"
    elif [[ -n "$media_artist" ]]; then
        media_string="$media_artist | "
    elif [[ -n "$media_song" ]]; then
        media_string="$media_song | " 
    else
        media_string=""
    fi
else
    media_string=""
fi

echo "$media_string $audio_volume BL:$bluetooth_state $vpn_status $battery_capacity $date_and_week | $current_time"
