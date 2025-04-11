# Tradutor com IA Local

Esta é uma aplicação web para tradução de textos usando o Ollama e o modelo DeepSeek localmente.

## Pré-requisitos

1. Windows 10 ou superior
2. PowerShell 5.1 ou superior
3. Winget (geralmente já instalado no Windows 10/11)

## Instalação Automática

Para instalar todas as dependências e iniciar o projeto automaticamente, execute o script de instalação:

```powershell
.\setup.ps1
```

O script irá:
1. Verificar e instalar o Python 3.11 (se necessário)
2. Verificar e instalar o Ollama (se necessário)
3. Verificar e instalar o modelo DeepSeek (se necessário)
4. Instalar as dependências Python do projeto
5. Iniciar o servidor Flask

## Instalação Manual

Se preferir instalar manualmente:

1. Instale o Python 3.8 ou superior
2. Instale o Ollama
3. Instale o modelo DeepSeek:
```bash
ollama pull deepseek-coder
```

4. Instale as dependências Python:
```bash
pip install -r requirements.txt
```

5. Inicie o servidor Flask:
```bash
python app.py
```

## Uso

1. Acesse a aplicação no navegador:
```
http://localhost:5000
```

2. Selecione os idiomas de origem e destino
3. Digite o texto que deseja traduzir
4. Clique em "Traduzir"

## Idiomas Suportados

- Inglês (en)
- Português (pt)
- Espanhol (es)
- Francês (fr)

## Observações

- A tradução é feita localmente usando o modelo DeepSeek através do Ollama
- O tempo de resposta pode variar dependendo do tamanho do texto e da capacidade do seu hardware
- Certifique-se de ter memória RAM suficiente para rodar o modelo
- O script de instalação requer privilégios de administrador para instalar o Python e o Ollama 