<p align="center">
  <img src="assets/ollama-suite-banner.png" alt="Ollama Chatbox Suite – Zenity & Cloud Edition" width="100%" />
</p>

<h1 align="center">💬 Ollama Chatbox Suite – Zenity & Cloud Edition</h1>
<p align="center">
  <strong>A multi-interface AI suite for Ollama built by <a href="https://www.cyberglobal.ai">Cyber Global Technologies LLC</a>.</strong><br>
  Zenity GUI • Terminal Chat • Web Mini Chat — all in one lightweight suite for Linux.<br>
  <a href="https://ko-fi.com/gusinfosec">Ko-fi</a> • <a href="https://github.com/gusinfosec">GitHub</a> • <a href="https://www.linkedin.com/in/gusinfosec">LinkedIn</a>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/status-active-brightgreen" alt="Status: active" />
  <img src="https://img.shields.io/badge/license-MIT-blue" alt="License: MIT" />
  <img src="https://img.shields.io/badge/built%20for-Linux-lightgrey" alt="Built for: Linux" />
</p>

---

## 🧩 Overview
**Ollama Chatbox Suite** unifies AI interaction on Linux through three interfaces:  
- A **Zenity-based GUI model selector** for quick workflows  
- A **colorized terminal chat client** with file and model support  
- A **lightweight web mini chat** with gradient visuals and local hosting  

Switch between local and cloud models such as **Qwen**, **GPT-OSS**, and **Deepseek** with one consistent experience.  
Part of the **Cyber Global Technologies LLC** ecosystem — secure, practical, and human-focused AI tools for professionals and teams.

---

## 🚀 Features

### 🪟 Zenity GUI Chat
- Pop-up model selector with multi-model support  
- Seamless integration with local Ollama models  
- Optional license verification for commercial users  

### 🧠 Terminal Chat (CLI)
- Interactive model menu with icons and colors  
- File attachment support (`:file <path>`)  
- Restart or switch model without closing  

### 🖥️ Web Mini Chat
- Modern UI with gradient glow and branding  
- File/image upload and model selection  
- Lightweight — runs on a local Python server  

---

## 🧩 Supported Models
- `qwen3-vl`  
- `qwen3-coder`  
- `TinyLlama`  
- `gpt-oss`  
- `qwen3-vl:235b-cloud`

---

## 🛠️ Setup

### 1️⃣ Install Ollama
```bash
curl -fsSL https://ollama.com/install.sh | sh
```

Start the service:
```bash
ollama serve &
```

(Optional – make persistent)
```bash
sudo systemctl enable ollama
sudo systemctl start ollama
```

---

### 2️⃣ Terminal Chat Installation
```bash
chmod +x ollama-chat.sh
./ollama-chat.sh
```

(Optional – make global)
```bash
mv ollama-chat.sh ~/bin/chat
```

---

### 3️⃣ Web Mini Chat Launch
```bash
python3 -m http.server 11435
```

Then visit:
```
http://localhost:11435/ollama-mini.html
```

🟢 Works automatically with `ollama serve` on port `11434`.

---

## 🧱 Folder Structure
```
ollama-chatbox-suite/
├── ollama-chat.sh
├── ollama-mini.html
├── assets/
│   ├── zenity-model-selector.png
│   ├── terminal-response.png
│   └── mini-chat-cloud.png
└── README.md
```

---

## 🪙 Editions
| Edition | Description | Price |
|----------|--------------|------:|
| **Pro Edition** | Full suite (Web + Zenity + Terminal) | **$29** |
| **Commercial Bundle** | Includes Compliance AI Preview | **$49** |

Explore more tools at  
[☕ Ko-fi.com/gusinfosec](https://ko-fi.com/gusinfosec)

---

## ⚖️ License
MIT License © 2025 **Cyber Global Technologies LLC**  
Use permitted for personal and educational projects.  
Commercial licensing available via [Ko-fi](https://ko-fi.com/gusinfosec).

---

<p align="center"><strong>Part of the Cyber Global Technologies ecosystem — secure, practical, human-focused tools for professionals and teams.</strong></p>
