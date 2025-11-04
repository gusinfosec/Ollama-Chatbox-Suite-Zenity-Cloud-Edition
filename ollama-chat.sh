#!/bin/bash
ollama signin >/dev/null 2>&1 || zenity --info --text="Please run 'ollama signin' in a terminal to access cloud models."

MODEL=$(zenity --list --title="Select Model" --column="Models" qwen3-vl qwen3-coder gpt-oss nomic-embed-text qwen3-vl:235b-cloud --height=300 --width=300)
[ -z "$MODEL" ] && exit 0

zenity --info --text="Starting chat with model: $MODEL"
while true; do
  PROMPT=$(zenity --entry --title="Ollama Chat ($MODEL)" --text="Type your message (or :quit to exit):")
  [ "$PROMPT" = ":quit" ] && break
  [ -z "$PROMPT" ] && continue
  RESPONSE=$(ollama run "$MODEL" "$PROMPT")
  zenity --text-info --title="Response ($MODEL)" --width=600 --height=400 --filename=<(echo "$RESPONSE")
done
