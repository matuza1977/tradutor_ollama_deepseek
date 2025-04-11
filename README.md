# Tradutor com IA Local

Esta é uma aplicação web para tradução de textos usando o Ollama e o modelo DeepSeek localmente.

## Clonando o Repositório

```bash
git clone https://github.com/seu-usuario/tradutor_ollama_deepseek.git
cd tradutor_ollama_deepseek
```

## Pré-requisitos

### Windows
- Windows 10 ou superior
- PowerShell 5.1 ou superior
- Winget (geralmente já instalado no Windows 10/11)

### macOS
- macOS 11 (Big Sur) ou superior
- Homebrew (para instalação do Ollama)
- Terminal

## Instalação Automática

### Windows
Para instalar todas as dependências e iniciar o projeto automaticamente no Windows, execute o script de instalação no PowerShell:

```powershell
.\setup.ps1
```

O script irá:
1. Verificar e instalar o Python 3.11 (se necessário)
2. Verificar e instalar o Ollama (se necessário)
3. Verificar e instalar o modelo DeepSeek (se necessário)
4. Instalar as dependências Python do projeto
5. Iniciar o servidor Flask

### macOS
Para instalar todas as dependências e iniciar o projeto no macOS, execute o script de instalação:

```bash
chmod +x setup.sh
./setup.sh
```

## Instalação Manual

### Windows

1. Instale o Python 3.8 ou superior do [site oficial](https://www.python.org/downloads/)
2. Instale o Ollama do [site oficial](https://ollama.ai/download)
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

### macOS

1. Instale o Homebrew (se ainda não tiver):
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Instale o Python e o Ollama:
```bash
brew install python@3.11
brew install ollama
```

3. Instale o modelo DeepSeek:
```bash
ollama pull deepseek-coder
```

4. Instale as dependências Python:
```bash
pip3 install -r requirements.txt
```

5. Inicie o servidor Flask:
```bash
python3 app.py
```

## Uso

1. Acesse a aplicação no navegador:


http://localhost:5000

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
- Certifique-se de ter memória RAM suficiente para rodar o modelo (recomendado mínimo de 8GB)
- O script de instalação pode requerer privilégios de administrador para instalar algumas dependências
- No macOS, certifique-se de que o Ollama está em execução antes de iniciar a aplicação

