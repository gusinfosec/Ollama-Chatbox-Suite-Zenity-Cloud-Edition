 #!/bin/bash
# Ollama Chatbox Suite – Zenity & Cloud Edition © 2025 Cyber Global Technologies LLC

BOLD='\033[1m'; RESET='\033[0m'; CYAN='\033[1;36m'; GREEN='\033[1;32m'; YELLOW='\033[1;33m'; BLUE='\033[1;34m'; GRAY='\033[0;37m'

draw_header() {
  clear
  local cols=$(tput cols 2>/dev/null || echo 80)
  local width=$((cols < 80 ? 80 : cols))
  local logo="🤖"
  local title="Ollama Chatbox Suite — Zenity & Cloud Edition"
  local pad=$(( (width - ${#title}) / 2 ))
  echo -e "${BLUE}${BOLD}$(printf '=%.0s' $(seq 1 $width))${RESET}"
  printf "%*s${CYAN}${BOLD}%s${RESET}\n" $pad "" "$title"
  echo -e "${BLUE}${BOLD}$(printf '=%.0s' $(seq 1 $width))${RESET}\n"
}

check_ollama() {
  if ! pgrep -x "ollama" >/dev/null; then
    echo -e "${YELLOW}⚠️ Ollama is not running.${RESET}"
    if command -v zenity >/dev/null 2>&1; then
      zenity --question --title="Start Ollama?" --text="Ollama is not running. Start it now?" && ollama serve &
    else
      read -rp "$(echo -e "${YELLOW}Start Ollama now? [y/N]: ${RESET}")" yn
      [[ "$yn" =~ ^[Yy]$ ]] && ollama serve &
    fi
  fi
}

select_model() {
  if command -v zenity >/dev/null 2>&1; then
    MODEL=$(zenity --list --title="🤖 Select Ollama Model" --text="Choose a model:" \
      --width=420 --height=260 --column="Model" \
      "phi3:mini" "gemma:2b" "deepseek-v3.1:671b-cloud" "qwen3-vl:235b-cloud" "gpt-oss:20b-cloud" --hide-header)
  fi
  [[ -z "$MODEL" ]] && MODEL="phi3:mini"
}

confirm_popup() {
  local msg="$1"
  if command -v zenity >/dev/null 2>&1; then
    zenity --question --title="Confirm" --text="$msg" --width=360
  else
    read -rp "$(echo -e "${YELLOW}${msg} [y/N]: ${RESET}")" yn
    [[ "$yn" =~ ^[Yy]$ ]]
  fi
}

run_chat() {
  echo -e "${GRAY}Chatting with model:${RESET} ${GREEN}${BOLD}$MODEL${RESET}"
  echo -e "${GRAY}Commands:${RESET} ${YELLOW}:file <path>${GRAY}, ${YELLOW}:model${GRAY}, ${YELLOW}:stop${RESET}\n"

  while true; do
    echo -ne "${BLUE}${BOLD}You 💭:${RESET} "; IFS= read -er INPUT
    case "$INPUT" in
      :quit|:stop)
        confirm_popup "Exit chat now?" && echo -e "${GRAY}👋 Bye!${RESET}" && exit 0
        ;;
      :model)
        echo -e "${YELLOW}🔁 Switching model...${RESET}"; select_model
        echo -e "${CYAN}${BOLD}Now chatting with:${RESET} ${GREEN}${BOLD}$MODEL${RESET}\n"
        ;;
      :file*)
        FILE=$(echo "$INPUT" | awk '{print $2}')
        if [[ -f "$FILE" ]]; then
          confirm_popup "Attach file?\n$FILE" && {
            EXT="${FILE##*.}"
            BASE64=$(base64 -w 0 "$FILE")
            PROMPT+="\n\n[File: $FILE] ($EXT, base64 below)\n$BASE64"
            echo -e "${YELLOW}📎 Attached:${RESET} $FILE"
          }
        else
          echo -e "${YELLOW}⚠️ File not found:${RESET} $FILE"
        fi
        ;;
      *)
        PROMPT+="\n\n$INPUT"
        echo -e "${GRAY}🤔 Thinking...${RESET}"
        RESPONSE=$(ollama run "$MODEL" <<< "$PROMPT")
        echo -e "\n${GREEN}${BOLD}🤖 $MODEL:${RESET}\n${GRAY}$(printf -- '-%.0s' $(seq 1 60))${RESET}\n$RESPONSE\n${GRAY}$(printf -- '-%.0s' $(seq 1 60))${RESET}\n"
        PROMPT=""
        ;;
    esac
  done
}

draw_header
check_ollama
select_model
run_chat

echo -e "\n${GRAY}© 2025 Cyber Global Technologies LLC${RESET}"
