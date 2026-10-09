# Histórico de alterações

## 1.0.0 — 2026-10-09

- Reorganiza a documentação: README principal em PT-BR, versão independente em inglês e instruções específicas das opções/etapas deste projeto.

- Corrige as instruções de execução para apontar diretamente para o arquivo correto do projeto.

- Consolida o diagnóstico e o coletor em um único arquivo .bat, aproxima a apresentação do relatório ao formato original e mantém as cores.
- Evita o aviso genérico quando campos opcionais de hardware não estão disponíveis.

- Amplia compatibilidade com WMI e PowerShell legado, mantendo cmdlets modernos como caminho preferencial quando disponíveis.
- Corrige coleta da unidade do sistema e tráfego da interface; limita a consulta de IP público.
- Restaura o relatório numerado do original, com dados alinhados à esquerda e valores longos quebrados em linhas legíveis.

- Usa WMI como alternativa quando cmdlets CIM ou de armazenamento não estão disponíveis.
- Limita a cinco segundos a consulta opcional de IP público e falha sem interromper o relatório.
- Mostra versão, sessão, data/hora e campos traduzidos em dez idiomas.
- Preserva a coleta parcial quando um campo de hardware não é fornecido.


- Corrige acentos e cedilha em textos de interface e documentação; alinha cabeçalhos de sessão e atualiza as instruções dos agentes.

- A documentação de uso, dependências e arquivos necessários foi revisada para corresponder ao comportamento atual do projeto.

- Padroniza a seção do autor, projetos e comunidades oficiais conforme o repositório de referência Antigravity.
