selected="$(ps -u "$USER" -o pid,%cpu,comm --sort=-%cpu | \
            tail -n +2 | \
            column -t | \
            sed 's/ *$//' | \
            anyrun --show-results-immediately true --max-entries 10 --plugins "$ANYRUN_STDIN_PLUGIN_PATH")"

if [[ -n $selected ]]; then

    answer="$(echo -e "Oui\nNon" | \
            anyrun --show-results-immediately true --plugins "$ANYRUN_STDIN_PLUGIN_PATH")"

  if [[ $answer == "Oui" ]]; then
      selpid="$(echo "$selected" | cut -d' ' -f1)"
      kill -9 "$selpid"
  fi
fi

exit 0
