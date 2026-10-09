# 🌐 PC and Network Diagnostics

Collect a detailed Windows hardware, operating system, and network report.

[![Português (Brasil)](https://img.shields.io/badge/DOCUMENTA%C3%87%C3%83O-PORTUGU%C3%8AS%20(BRASIL)-green?style=for-the-badge)](README.md) [![Documentation](https://img.shields.io/badge/DOCUMENTATION-ENGLISH-0070F3?style=for-the-badge)](README-EN.md)

![Version](https://img.shields.io/badge/Version-v1.0.0-blue?style=flat-square) ![License](https://img.shields.io/badge/License-MIT-green?style=flat-square) ![Platform](https://img.shields.io/badge/Platform-Windows-0078D4?style=flat-square) ![Languages](https://img.shields.io/badge/Languages-10%20auto--detected-2ea44f?style=flat-square)

[Portuguese changelog](CHANGELOG-PT-BR.md) · [English changelog](CHANGELOG-EN.md) · [MIT License](LICENSE)

---
## Files

PC-Network-Diagnostics.bat (single file; collector embedded)

## Usage

1. Download or clone the complete repository.
2. Run `PC-Network-Diagnostics.bat` to generate the report. It does not reset network settings.

## Requirements

Windows 7 or later and Windows PowerShell 2.0 or later, embedded in the Batch file. The script uses WMI for compatibility and uses CIM/storage cmdlets when available. Some fields vary by hardware, drivers, and Windows version; systems without PowerShell installed must install it first.

## Report sections

Collection is informational and does not change network settings. The report shows: **1)** Windows and hardware (motherboard/BIOS, CPU, graphics, memory, drives, monitor); **2)** active adapter, IPv4, mask, gateway, MAC; **3)** connection type and link speed; **4)** DNS resolution; **5–6)** four pings to `1.1.1.1` and `8.8.8.8`, with available loss/statistics; **7)** sent/received traffic; **8)** a quality summary. Public IP lookup depends on an external service. Missing fields mean unavailable data, not necessarily a failed report. DNS, ICMP, and network state affect results.

### Available languages

Detected from Windows settings; Brazilian Portuguese is the fallback.

| Language | Locale | Typical system |
|---|---|
| Brazilian Portuguese | pt-BR | Brazilian Windows; also the fallback language. |
| English | en | English Windows. |
| Spanish | es | Spanish Windows. |
| French | fr | French Windows. |
| German | de | German Windows. |
| Italian | it | Italian Windows. |
| Japanese | ja | Japanese Windows. |
| Korean | ko | Korean Windows. |
| Simplified Chinese | zh-CN | Simplified Chinese Windows. |
| Russian | ru | Russian Windows. |

## 👨‍💻 About the Author

Developed and maintained by **Emerson Teles** (known in the community as **Emertels**).

Technology, computing, gaming, system maintenance, and software translation/localization enthusiast. Focused on practical utilities, productivity tools, intelligent PowerShell automation, and technical localization solutions that make modern tools more accessible to Brazilian users.

### 🛠️ Projects & Contributions

- [AI-Chat-Vault](https://github.com/Emertels/AI-Chat-Vault) — Portable backup and recovery for local conversations from 20+ AI tools and assistants.
- [Antigravity — Brazilian Portuguese Translation](https://github.com/Emertels/Antigravity-Traducao-PTBR) — Complete localization of Google Antigravity Desktop into Brazilian Portuguese.
- [Codex Router — Brazilian Portuguese Translation](https://github.com/Emertels/CodexRouter-Traducao-PTBR) — Translation and localization package for Codex Router Control Center.
- [Cursor AI — Brazilian Portuguese Translation](https://github.com/Emertels/Cursor-Traducao-PTBR) — Complete, in-depth localization of Cursor AI into Brazilian Portuguese.
- [GPU Tweak III — Brazilian Portuguese Translation](https://github.com/Emertels/GPU-Tweak-III-Traducao-PTBR) — Brazilian Portuguese translation and automated installer for ASUS GPU Tweak III.
- [Microsoft Photos Fix](https://github.com/Emertels/Microsoft-Photos-Fix) — PowerShell and C# fix for startup routing and image viewing in Windows Photos.
- [PSBBN-Translator](https://github.com/Emertels/PSBBN-Translator) — Localization suite for the PSBBN Definitive Project (PlayStation 2) in 40 languages.
- [Silent Hill: Homecoming — Brazilian Portuguese Translation](https://github.com/Emertels/Silent-Hill-Homecoming-Traducao-PTBR) — Complete PC translation and review into Brazilian Portuguese.
- [Suite-Emuladores](https://github.com/Emertels/Suite-Emuladores) — PowerShell suite for downloading and updating 56 emulators and frontends on Windows.
- [ZCode — Brazilian Portuguese Translation](https://github.com/Emertels/ZCode-Traducao-PTBR) — Complete localization of ZCode Desktop into Brazilian Portuguese.

### 🌐 Connect with me & Official Communities

<div align="left">

[![GitHub](https://img.shields.io/badge/GitHub-Emertels-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/emertels)
[![Website](https://img.shields.io/badge/Website-Emerson_Teles-0070F3?style=for-the-badge&logo=googlechrome&logoColor=white)](https://emertels.github.io)
[![Discord](https://img.shields.io/badge/Discord-Emertels%20Server-5865F2?style=for-the-badge&logo=discord&logoColor=white)](https://emertels.github.io/discord)
[![X / Twitter](https://img.shields.io/badge/X_Twitter-@emertels-000000?style=for-the-badge&logo=x&logoColor=white)](https://x.com/emertels)
[![YouTube](https://img.shields.io/badge/YouTube-Emerson_Teles-FF0000?style=for-the-badge&logo=youtube&logoColor=white)](https://www.youtube.com/@emersonteles2379)
[![Telegram](https://img.shields.io/badge/Telegram-Aplicativos%20Mods-2CA5E0?style=for-the-badge&logo=telegram&logoColor=white)](https://t.me/apksmodsandroid)
[![Ko-fi](https://img.shields.io/badge/Ko--fi-Support_the_Project-FF5E5B?style=for-the-badge&logo=kofi&logoColor=white)](https://ko-fi.com/emertels)

</div>
