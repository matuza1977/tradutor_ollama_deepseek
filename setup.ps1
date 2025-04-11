# Função para verificar se um comando existe
function Test-CommandExists {
    param ($command)
    $oldPreference = $ErrorActionPreference
    $ErrorActionPreference = 'stop'
    try {
        if (Get-Command $command) { return $true }
    } catch {
        return $false
    } finally {
        $ErrorActionPreference = $oldPreference
    }
}

# Função para verificar se o Python está instalado
function Test-PythonInstalled {
    try {
        $pythonVersion = python --version 2>&1
        if ($pythonVersion -match "Python 3\.\d+") {
            Write-Host "Python está instalado: $pythonVersion" -ForegroundColor Green
            return $true
        }
    } catch {
        return $false
    }
}

# Função para verificar se o Ollama está instalado
function Test-OllamaInstalled {
    try {
        $ollamaVersion = ollama --version 2>&1
        if ($ollamaVersion) {
            Write-Host "Ollama está instalado: $ollamaVersion" -ForegroundColor Green
            return $true
        }
    } catch {
        return $false
    }
}

# Função para verificar se o modelo DeepSeek está instalado
function Test-DeepSeekModelInstalled {
    try {
        $models = ollama list 2>&1
        if ($models -match "deepseek-coder") {
            Write-Host "Modelo DeepSeek está instalado" -ForegroundColor Green
            return $true
        }
    } catch {
        return $false
    }
}

# Função para instalar Python
function Install-Python {
    Write-Host "Instalando Python..." -ForegroundColor Yellow
    winget install Python.Python.3.11
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Python instalado com sucesso!" -ForegroundColor Green
        return $true
    } else {
        Write-Host "Falha ao instalar Python" -ForegroundColor Red
        return $false
    }
}

# Função para instalar Ollama
function Install-Ollama {
    Write-Host "Instalando Ollama..." -ForegroundColor Yellow
    winget install Ollama.Ollama
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Ollama instalado com sucesso!" -ForegroundColor Green
        return $true
    } else {
        Write-Host "Falha ao instalar Ollama" -ForegroundColor Red
        return $false
    }
}

# Função para instalar o modelo DeepSeek
function Install-DeepSeekModel {
    Write-Host "Instalando modelo DeepSeek..." -ForegroundColor Yellow
    ollama pull deepseek-coder
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Modelo DeepSeek instalado com sucesso!" -ForegroundColor Green
        return $true
    } else {
        Write-Host "Falha ao instalar modelo DeepSeek" -ForegroundColor Red
        return $false
    }
}

# Função para instalar dependências Python
function Install-PythonDependencies {
    Write-Host "Instalando dependências Python..." -ForegroundColor Yellow
    pip install -r requirements.txt
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Dependências Python instaladas com sucesso!" -ForegroundColor Green
        return $true
    } else {
        Write-Host "Falha ao instalar dependências Python" -ForegroundColor Red
        return $false
    }
}

# Função para iniciar o servidor Flask
function Start-FlaskServer {
    Write-Host "Iniciando servidor Flask..." -ForegroundColor Yellow
    python app.py
}

# Verificar e instalar Python
if (-not (Test-PythonInstalled)) {
    if (-not (Install-Python)) {
        Write-Host "Erro: Python é necessário para executar este projeto" -ForegroundColor Red
        exit 1
    }
}

# Verificar e instalar Ollama
if (-not (Test-OllamaInstalled)) {
    if (-not (Install-Ollama)) {
        Write-Host "Erro: Ollama é necessário para executar este projeto" -ForegroundColor Red
        exit 1
    }
}

# Verificar e instalar o modelo DeepSeek
if (-not (Test-DeepSeekModelInstalled)) {
    if (-not (Install-DeepSeekModel)) {
        Write-Host "Erro: Modelo DeepSeek é necessário para executar este projeto" -ForegroundColor Red
        exit 1
    }
}

# Instalar dependências Python
if (-not (Install-PythonDependencies)) {
    Write-Host "Erro: Falha ao instalar dependências Python" -ForegroundColor Red
    exit 1
}

# Iniciar o servidor Flask
Start-FlaskServer 