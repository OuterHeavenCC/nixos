menu_command="fuzzel -d -l 5"

shutdown="󰐥 Eteindre"
reboot="󰜉 Redémarrer"
suspend="󰜗 Hiberner"
lock=" Verrouiller"
logout="󰍃 Déconnexion"

# Variable passed to rofi
options="$lock\n$logout\n$suspend\n$reboot\n$shutdown"

chosen="$(echo -e "$options" | $menu_command)"
case $chosen in
    "$shutdown")
			  systemctl poweroff
        ;;
    "$reboot")
			  systemctl reboot
        ;;
    "$suspend")
        systemctl suspend
        ;;
    "$lock")
        hyprlock
        ;;
    "$logout")
        loginctl kill-user "$(whoami)"
        ;;
esac

exit 0 
