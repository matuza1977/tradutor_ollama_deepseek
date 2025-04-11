#!/bin/bash

# Verifica se o Python está instalado
if ! command -v python3 &> /dev/null; then
    echo "Python3 não encontrado. Instalando Python3..."
    brew install python
else
    echo "Python3 já está instalado."
fi

# Verifica se o pip está instalado
if ! command -v pip3 &> /dev/null; then
    echo "pip3 não encontrado. Instalando pip3..."
    python3 -m ensurepip --upgrade
else
    echo "pip3 já está instalado."
fi

# Verifica se o Ollama está instalado
if ! command -v ollama &> /dev/null; then
    echo "Ollama não encontrado. Instalando Ollama..."
    brew install ollama
else
    echo "Ollama já está instalado."
fi

# Baixa o modelo DeepSeek
echo "Baixando o modelo DeepSeek..."
ollama pull deepseek-coder

# Instala as dependências do projeto
echo "Instalando dependências do projeto..."
pip3 install -r requirements.txt

# Inicia o servidor Flask
echo "Iniciando o servidor Flask..."
python3 app.py