#!/bin/bash
LICENSE_FILE="$HOME/.ollama_license"

if [ ! -f "$LICENSE_FILE" ]; then
  zenity --warning --title="License Required" --text="⚠️ This copy of Ollama Suite Zenity is licensed for personal and non-commercial use only.\n\nTo unlock commercial use, please purchase a license at:\nhttps://ko-fi.com/gusinfosec"
fi

echo "Starting Ollama Suite Zenity (Personal Edition)..."
ollama serve &
sleep 3
python3 -m http.server 11435 &
sleep 2
xdg-open http://localhost:11435/ollama-mini.html
wait
