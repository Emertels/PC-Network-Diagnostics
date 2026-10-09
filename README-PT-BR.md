# Diagnóstico do PC e da Rede

**Versão:** 1.0.0  
**Idiomas da interface:** PT-BR, inglês, espanhol, francês, alemão, italiano, japonês, coreano, chinês simplificado e russo. O programa detecta a região do Windows automaticamente e usa PT-BR para regiões não listadas.

## O que faz

Coleta relatório detalhado de hardware, Windows e rede.

## Arquivos

PC-Network-Diagnostics.bat (arquivo único; coletor integrado)

## Como usar

1. Baixe ou clone o repositório completo.
2. Execute `PC-Network-Diagnostics.bat` para gerar o relatório. A coleta não redefine a rede.

## Requisitos

Windows 7 ou posterior e Windows PowerShell 2.0 ou posterior, já integrado ao arquivo Batch. O script usa WMI como caminho compatível e aproveita cmdlets de armazenamento/CIM quando disponíveis. Alguns campos variam conforme o hardware, os drivers e a versão do Windows; sistemas sem PowerShell instalado precisam instalá-lo antes.

## Segurança e limitações

O projeto não deve apagar dados pessoais, credenciais ou conteúdo fora dos caminhos definidos pela ferramenta. A disponibilidade de comandos e recursos depende da edição e versão do Windows. Revise CHANGELOG.md antes de atualizar.

## Desenvolvimento

Consulte AGENTS-PT-BR.md e AGENTS-EN.md. O idioma padrão da interface é detectado pela cultura do Windows; quando ela não for compatível, use PT-BR como fallback.

## Idiomas, finalidade e dicas

A interface está disponível em PT-BR, inglês, espanhol, francês, alemão, italiano, japonês, coreano, chinês simplificado e russo. O idioma é detectado pela região do Windows; PT-BR é o fallback.

Coleta informações de sistema, hardware e rede; alguns campos dependem da versão do Windows e dos drivers. A coleta do IP público consulta api.ipify.org. Execute como administrador para ampliar a coleta e oculte identificadores/IP público antes de compartilhar.

### Idiomas disponíveis / Available languages

| Idioma | Código | Indicação |
|---|---|---|
| Português (Brasil) | pt-BR | Brasil |
| Inglês | en | Sistemas em inglês |
| Espanhol | es | Sistemas em espanhol |
| Francês | fr | Sistemas em francês |
| Alemão | de | Sistemas em alemão |
| Italiano | it | Sistemas em italiano |
| Japonês | ja | Sistemas em japonês |
| Coreano | ko | Sistemas em coreano |
| Chinês simplificado | zh-CN | Sistemas em chinês simplificado |
| Russo | ru | Sistemas em russo |

Para descobrir o IP público, a ferramenta consulta api.ipify.org; somente a solicitação necessária para obter esse endereço é enviada ao serviço, sem enviar o relatório local.



## Sobre Emerson Teles

Emerson Teles (Emertels) desenvolve ferramentas para Windows, automação, emulação e localização de software. Veja os projetos e acompanhe os canais oficiais:

- [Site oficial](https://emertels.github.io) · [GitHub](https://github.com/Emertels) · [Discord](https://emertels.github.io/discord)
- [YouTube](https://www.youtube.com/@emersonteles2379) · [X](https://x.com/emertels) · [Telegram](https://t.me/apksmodsandroid) · [Ko-fi](https://ko-fi.com/emertels)

### Outros projetos

- [AI-Chat-Vault](https://github.com/Emertels/AI-Chat-Vault) — backup portátil e recuperação de conversas locais de ferramentas de IA.
- [Suite-Emuladores](https://github.com/Emertels/Suite-Emuladores) — gerenciamento de download e atualização de emuladores e frontends no Windows.
- [Microsoft-Photos-Fix](https://github.com/Emertels/Microsoft-Photos-Fix) — correção de inicialização e papel de parede do app Fotos do Windows.
- [PSBBN-Translator](https://github.com/Emertels/PSBBN-Translator) — localização do PSBBN Definitive Project em 40 idiomas.
- [GPU-Tweak-III-Traducao-PTBR](https://github.com/Emertels/GPU-Tweak-III-Traducao-PTBR), [Cursor-Traducao-PTBR](https://github.com/Emertels/Cursor-Traducao-PTBR), [CodexRouter-Traducao-PTBR](https://github.com/Emertels/CodexRouter-Traducao-PTBR), [Antigravity-Traducao-PTBR](https://github.com/Emertels/Antigravity-Traducao-PTBR) e [ZCode-Traducao-PTBR](https://github.com/Emertels/ZCode-Traducao-PTBR) — projetos de localização para PT-BR.
- [Silent-Hill-Homecoming-Traducao-PTBR](https://github.com/Emertels/Silent-Hill-Homecoming-Traducao-PTBR) — tradução e revisão para PC.

