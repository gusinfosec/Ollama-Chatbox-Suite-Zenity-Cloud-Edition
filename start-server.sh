#!/bin/bash
# Ollama Chatbox Suite – Zenity Edition (Personal & Pro Editions)
# © 2025 Cyber Global Technologies LLC

LICENSE_FILE="$HOME/.ollama_license"
PORT="${1:-11435}"

if [ ! -f "$LICENSE_FILE" ]; then
  zenity --warning --title="License Required" \
    --text="⚠️ This copy of Ollama Suite Zenity is licensed for personal and non-commercial use only.\n\nTo unlock commercial use, please purchase a license at:\nhttps://ko-fi.com/gusinfosec"
fi

echo "🚀 Starting Ollama Chatbox Suite (Zenity Edition)..."
ollama serve & disown
sleep 3

echo "🌐 Launching local web server on http://localhost:${PORT}/ollama-mini.html ..."
python3 -m http.server "${PORT}" & disown
sleep 2

xdg-open "http://localhost:${PORT}/ollama-mini.html" >/dev/null 2>&1
wait
