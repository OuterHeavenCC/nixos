selected="$(ps -u "$USER" -o pid,%cpu,comm --sort=-%cpu | \
            tail -n +2 | \
            column -t | \
            sed 's/ *$//' | \
            fuzzel -d -w 100 -p "Rechercher le processus à terminer : ")"

if [[ -n $selected ]]; then

    answer="$(echo -e "Oui\nNon" | \
            fuzzel -d -w 100 -p "$selected va être terminé, êtes-vous sûr ? ")"

  if [[ $answer == "Oui" ]]; then
      selpid="$(echo "$selected" | cut -d' ' -f1)"
      kill -9 "$selpid"
  fi
fi

exit 0
