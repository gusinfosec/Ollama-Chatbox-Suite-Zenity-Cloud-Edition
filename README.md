
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
- **Zenity GUI** – model selector with quick workflow pop-ups  
- **Terminal Chat** – colorized, keyboard-friendly interface  
- **Mini Web Chat** – lightweight local server with a glowing UI  

Instantly switch between local and cloud models such as **Qwen**, **GPT-OSS**, and **Deepseek**, all through one consistent workflow.  

Part of the **Cyber Global Technologies LLC** ecosystem — secure, practical, and human-focused AI tools for professionals and teams.  
Commercial projects like **Compliance AI** are available via monthly Stripe subscriptions.

---

## ☁️ Cloud Access
To use cloud-based models sign in with your Ollama account first:
```bash
ollama signin
```
Then **pull** the cloud model you want to use:
```bash
ollama pull deepseek-v3.1:latest
```
Once authenticated and pulled, cloud model access works in both Zenity and Web interfaces.

---

## 🚀 Features

### 🪟 Zenity GUI Chat
- Pop-up model selector with multiple interface options  
- Seamless integration with local Ollama models  
- Works instantly after signing in for cloud access  

### 🧠 Terminal Chat (CLI)
- Interactive model menu with icons and colors  
- File attachment support (`:file <path>`)  
- Restart or switch models without closing  

### 🖥️ Web Mini Chat
- Modern UI with glowing gradient design  
- File/image upload and model switching  
- Runs on a local Python server (`http.server`)  

---

## 🧩 Supported Models
- `qwen3-vl`  
- `qwen3-coder`  
- `deepseek-v3.1:latest`  
- `gpt-oss`  
- `qwen3-vl:235b-cloud`

---

## ⚙️ Model Usage
| Mode | Command | Example |
|------|---------|---------|
| **Local models** | `ollama run <model>` | `ollama run gpt-oss` |
| **Cloud models** | `ollama pull <model>` *(requires login)* | `ollama pull deepseek-v3.1:latest` |

> 🔐 Tip: Always run `ollama signin` first to access cloud-hosted models.  

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
Then open:
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
├── ollama-suite.desktop
├── LICENSE.md
├── README.md
└── assets/
    └── icon.png
```
> Pro launcher (`start-server-pro.sh`) is distributed via Ko-fi and not included in this repo.

---

## 🪙 Editions
| Edition | Description | Access |
|----------|--------------|:------:|
| **Community Edition** | Free version — includes Zenity, Terminal, and Web Mini Chat | GitHub Release |
| **Pro Edition** | Adds automation and secure launcher (`pro.sh`) | Ko-fi Store |
| **Enterprise Bundle** | Includes **Compliance AI Preview** and premium integrations | Contact via CyberGlobal.ai |

---

## ⚖️ License
MIT License © 2025 **Cyber Global Technologies LLC**  
Use permitted for personal and educational projects.  
Commercial licensing available via Ko-fi.

---

<p align="center"><strong>Part of the Cyber Global Technologies ecosystem — secure, practical, human-focused tools for professionals and teams.</strong></p>
