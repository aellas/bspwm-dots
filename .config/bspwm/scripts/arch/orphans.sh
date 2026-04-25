#!/usr/bin/env sh

orphans=$(paru -Qtdq)

if [[ -z $orphans ]]; then
  echo "No orphaned packages found."
  exit 0
fi

selected=$(echo "$orphans" | fzf \
  --multi \
  --preview 'paru -Qi {1}' \
  --preview-window 'down:65%:wrap' \
  --preview-label='tab: multi-select, enter: remove selected' \
  --color 'pointer:red,marker:red')

if [[ -n $selected ]]; then
  echo "$selected" | xargs paru -Rns
fi
