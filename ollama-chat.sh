
#!/usr/bin/env bash
set -e

# Ollama Chatbox Suite — Zenity & Cloud Edition
# Part of Cyber Global Technologies LLC (2025)

# Colors
BBLUE="\033[1;34m"; BWHITE="\033[1;37m"; GRAY="\033[0;37m"; RESET="\033[0m"

MODELS_LOCAL=("phi3:mini" "gemma:2b")
MODELS_CLOUD=("deepseek-v3.1:671b-cloud" "qwen3-vl:235b-cloud" "gpt-oss:20b-cloud")

ICON_PATH="assets/icon.png"

banner(){
  echo -e "${BBLUE}┌──────────────────────────────────────────────────────────┐${RESET}"
  echo -e "${BBLUE}│${RESET} 🤖  ${BWHITE}Ollama Chatbox Suite — Zenity & Cloud Edition${RESET}        ${BBLUE}│${RESET}"
  echo -e "${BBLUE}│${RESET}     ${GRAY}Part of Cyber Global Technologies LLC (2025)${RESET}     ${BBLUE}│${RESET}"
  echo -e "${BBLUE}└──────────────────────────────────────────────────────────┘${RESET}"
}

has_zenity(){ command -v zenity >/dev/null 2>&1; }

select_model_terminal(){
  echo "Select a model:"
  i=1
  for m in "${MODELS_LOCAL[@]}"; do
    printf "  %d) %s (local)\n" "$i" "$m"; i=$((i+1))
  done
  for m in "${MODELS_CLOUD[@]}"; do
    printf "  %d) %s (cloud)\n" "$i" "$m"; i=$((i+1))
  done
  read -rp "Enter number: " choice
  local idx=$((choice-1))
  local all=( "${MODELS_LOCAL[@]}" "${MODELS_CLOUD[@]}" )
  echo "${all[$idx]}"
}

select_model_zenity(){
  local list=()
  for m in "${MODELS_LOCAL[@]}"; do list+=("Local" "$m"); done
  for m in "${MODELS_CLOUD[@]}"; do list+=("Cloud" "$m"); done
  zenity --list     --title="Ollama Chatbox Suite — Cyber Global Technologies LLC"     --window-icon="${ICON_PATH}"     --text="Select a model. Cloud models require: ollama signin + ollama pull <model>"     --column="Type" --column="Model"     "${list[@]}" 2>/dev/null | awk -F'|' '{print $2}'
}

is_cloud_model(){
  case "$1" in
    *-cloud* ) return 0 ;;
    *:671b-cloud* ) return 0 ;;
    *:235b-cloud* ) return 0 ;;
    *:20b-cloud* ) return 0 ;;
    * ) return 1 ;;
  esac
}

ensure_cloud_ready(){
  local model="$1"
  if is_cloud_model "$model"; then
    echo "[info] Cloud model detected: $model"
    echo "[info] Verifying account and pulling model if needed..."
    if ! ollama pull "$model"; then
      echo "[error] Could not pull cloud model. Make sure you've run: ollama signin"
      exit 1
    fi
  fi
}

chat_loop(){
  local model="$1"
  echo ""
  echo "Commands: /switch (change model), /quit (exit)"
  echo "--------------------------------------------------"
  while true; do
    read -rp "> " prompt
    case "$prompt" in
      "/quit" ) exit 0 ;;
      "/switch" )
        model=$(choose_model)
        ensure_cloud_ready "$model"
        echo "[switched] Using model: $model"
        ;;
      * )
        printf "%s" "$prompt" | ollama run "$model"
        echo ""
        ;;
    esac
  done
}

choose_model(){
  if has_zenity; then
    local pick
    pick=$(select_model_zenity)
    if [[ -n "$pick" ]]; then
      echo "$pick"; return 0
    fi
  fi
  select_model_terminal
}

main(){
  banner
  local model
  model=$(choose_model)
  if [[ -z "$model" ]]; then
    echo "No model selected. Exiting."
    exit 1
  fi
  ensure_cloud_ready "$model"
  chat_loop "$model"
}

main "$@"
