#!/usr/bin/env bash

# set preferred launcher
PREFERRED_LAUNCHER="fuzzel"
# set path where urls will be stored
URL_FILE_PATH="$HOME/.config/bmks"
# name of file urls will be stored in
URL_FILE_NAME="urls"

show_usage() {
    printf "bmks: unix bookmark management that sucks less\n\n"
    printf "usage:\n"
    printf "bmks help\n\tshow this help message\n"
    printf "bmks add <url>\n\tadd a new bookmark\n"
    printf "bmks del\n\tremove a bookmark\n"
    printf "bmks ls\n\tshow all bookmarks\n"
    printf "bmks dmenu\n\tmanual switch for displaying bookmarks in dmenu\n"
    printf "bmks fzf\n\tmanual switch for displaying bookmarks in fzf\n\n"
    printf "Configuration is done by directly editing the script. Two launchers are available (dmenu and fzf). You can specify which one to use by adding to the PREFERRED_LAUNCHER variable directly in the script. Both will display a menu that will allow you to choose a bookmark and open it in your default browser.\n\n"
    printf "If you would prefer to have your bookmarks stored in alternate location there are also variables that can be changed for that. The default is %s/.bmks/urls\n" "$HOME"
}

bmks_add() {
    [ -z "$url" ] && printf "Error: url must be provided\n\n" && show_usage && exit 1
    printf "Description: "
    read -r description
    if [ -z "$description" ]; then
        echo "$url" >> "$URL_FILE_PATH/$URL_FILE_NAME"
    else
        echo "$description - $url" >> "$URL_FILE_PATH/$URL_FILE_NAME"
    fi
}

bmks_ls() {
    bmks_check
    sort "$URL_FILE_PATH/$URL_FILE_NAME"
}

bmks_del() {
    bmks_check
    case $PREFERRED_LAUNCHER in
        dmenu)
            sed -i "/$(sort "$URL_FILE_PATH/$URL_FILE_NAME" | dmenu -c -i -l "$(wc -l < "$URL_FILE_PATH/$URL_FILE_NAME")")/d" "$URL_FILE_PATH/$URL_FILE_NAME"
            ;;
        fzf)
            sed -i "/$(sort "$URL_FILE_PATH/$URL_FILE_NAME" | fzf)/d" "$URL_FILE_PATH/$URL_FILE_NAME"
            ;;
        rofi)
            sed -i "/$(sort "$URL_FILE_PATH/$URL_FILE_NAME" | rofi -dmenu -l "$(wc -l < "$URL_FILE_PATH/$URL_FILE_NAME")")/d" "$URL_FILE_PATH/$URL_FILE_NAME"
            ;;
        fuzzel)
            sed -i "/$(sort "$URL_FILE_PATH/$URL_FILE_NAME" | fuzzel -d -l "$(wc -l < "$URL_FILE_PATH/$URL_FILE_NAME")")/d" "$URL_FILE_PATH/$URL_FILE_NAME"
            ;;
    esac
}

bmks_display() {
    bmks_check
    case $PREFERRED_LAUNCHER in
        dmenu)
            sort "$URL_FILE_PATH/$URL_FILE_NAME" | dmenu -c -i -l "$(wc -l < "$URL_FILE_PATH/$URL_FILE_NAME")" | awk '{print $NF}' | xargs -I '{}' "$BROWSER" '{}'
            ;;
        fzf)
            sort "$URL_FILE_PATH/$URL_FILE_NAME" | fzf | awk '{print $NF}' | xargs -I '{}' "$BROWSER" '{}'
            ;;
        rofi)
            sort "$URL_FILE_PATH/$URL_FILE_NAME" | rofi -dmenu -l "$(wc -l < "$URL_FILE_PATH/$URL_FILE_NAME")" | awk '{print $NF}' | xargs -I '{}' "$BROWSER" '{}'
            ;;
        fuzzel)
            sort "$URL_FILE_PATH/$URL_FILE_NAME" | fuzzel -d | awk '{print $NF}' | xargs -I '{}' "$BROWSER" '{}'
            ;;
    esac
}

bmks_check() {
    [ ! -s "$URL_FILE_PATH/$URL_FILE_NAME" ] && printf "Error: No bookmarks found to display. Try adding some!\n\n" && show_usage && exit 1
}

[ ! -d "$URL_FILE_PATH" ] && mkdir -p "$URL_FILE_PATH"
[ ! -f "$URL_FILE_PATH/$URL_FILE_NAME" ] && touch "$URL_FILE_PATH/$URL_FILE_NAME"

case "$1" in
    "help")
        show_usage
        ;;
    "add")
        url="$2"
        bmks_add
        ;;
    "del")
        bmks_del
        ;;
    "ls")
        bmks_ls
        ;;
    "dmenu")
        PREFERRED_LAUNCHER="$1"
        bmks_display
        ;;
    "rofi")
        PREFERRED_LAUNCHER="$1"
        bmks_display
        ;;
    "fuzzel")
        PREFERRED_LAUNCHER="$1"
        bmks_display
        ;;
    "fzf")
        PREFERRED_LAUNCHER="$1"
        bmks_display
        ;;
    *)
        bmks_display
        ;;
esac
