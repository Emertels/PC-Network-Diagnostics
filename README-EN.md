# PC and Network Diagnostics

**Version:** 1.0.0  
**Interface languages:** Brazilian Portuguese, English, Spanish, French, German, Italian, Japanese, Korean, Simplified Chinese, and Russian. The program detects Windows UI culture and uses Brazilian Portuguese for unsupported locales.

## What it does

Collect a detailed Windows hardware, operating system, and network report.

## Files

PC-Network-Diagnostics.bat (single file; collector embedded)

## Usage

1. Download or clone the complete repository.
2. Run `PC-Network-Diagnostics.bat` to generate the report. It does not reset network settings.

## Requirements

Windows 7 or later and Windows PowerShell 2.0 or later, embedded in the Batch file. The script uses WMI for compatibility and uses CIM/storage cmdlets when available. Some fields vary by hardware, drivers, and Windows version; systems without PowerShell installed must install it first.

## Safety and limitations

The project must not remove personal data, credentials, or content outside paths defined by the tool. Command and feature availability depends on Windows edition and version. Review CHANGELOG.md before updating.

## Development

See AGENTS-PT-BR.md and AGENTS-EN.md. The default interface language follows Windows UI culture; Brazilian Portuguese is the fallback.

## Languages, purpose, and tips

The interface supports Brazilian Portuguese, English, Spanish, French, German, Italian, Japanese, Korean, Simplified Chinese, and Russian. It detects Windows UI culture and uses Brazilian Portuguese as the fallback.

Collects system, hardware, and network details; fields depend on Windows and drivers. Public IP lookup queries api.ipify.org. Run as administrator for broader collection and redact identifiers/public IP before sharing.

### Idiomas disponíveis / Available languages

| Language | Locale | Used for |
|---|---|---|
| Brazilian Portuguese | pt-BR | Brazilian Windows; fallback for unsupported locales |
| English | en | English Windows |
| Spanish | es | Spanish Windows |
| French | fr | French Windows |
| German | de | German Windows |
| Italian | it | Italian Windows |
| Japanese | ja | Japanese Windows |
| Korean | ko | Korean Windows |
| Simplified Chinese | zh-CN | Simplified Chinese Windows |
| Russian | ru | Russian Windows |

To detect the public IP, the tool queries api.ipify.org; it sends only the request needed to retrieve that address, not the local diagnostic report.



## About Emerson Teles

Emerson Teles (Emertels) builds Windows tools for automation, emulation, and software localization. Explore his projects and official channels:

- [Official website](https://emertels.github.io) · [GitHub](https://github.com/Emertels) · [Discord](https://emertels.github.io/discord)
- [YouTube](https://www.youtube.com/@emersonteles2379) · [X](https://x.com/emertels) · [Telegram](https://t.me/apksmodsandroid) · [Ko-fi](https://ko-fi.com/emertels)

### Other projects

- [AI-Chat-Vault](https://github.com/Emertels/AI-Chat-Vault) — portable backup and recovery for local AI assistant conversations.
- [Suite-Emuladores](https://github.com/Emertels/Suite-Emuladores) — Windows download and update management for emulators and frontends.
- [Microsoft-Photos-Fix](https://github.com/Emertels/Microsoft-Photos-Fix) — startup and wallpaper fixes for the Windows Photos app.
- [PSBBN-Translator](https://github.com/Emertels/PSBBN-Translator) — localization of the PSBBN Definitive Project into 40 languages.
- [GPU-Tweak-III-Traducao-PTBR](https://github.com/Emertels/GPU-Tweak-III-Traducao-PTBR), [Cursor-Traducao-PTBR](https://github.com/Emertels/Cursor-Traducao-PTBR), [CodexRouter-Traducao-PTBR](https://github.com/Emertels/CodexRouter-Traducao-PTBR), [Antigravity-Traducao-PTBR](https://github.com/Emertels/Antigravity-Traducao-PTBR), and [ZCode-Traducao-PTBR](https://github.com/Emertels/ZCode-Traducao-PTBR) — Brazilian Portuguese localization projects.
- [Silent-Hill-Homecoming-Traducao-PTBR](https://github.com/Emertels/Silent-Hill-Homecoming-Traducao-PTBR) — PC translation and review project.

