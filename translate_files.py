import os
import requests

# Diretórios
SOURCE_DIR = "text_files"
TARGET_DIR = "text_files_pt"

# Endpoint do backend
TRANSLATE_URL = "http://127.0.0.1:5000/translate"

def translate_text(source_lang, target_lang, text):
    """Envia o texto para o backend para tradução."""
    try:
        response = requests.post(TRANSLATE_URL, json={
            "source_lang": source_lang,
            "target_lang": target_lang,
            "text": text
        })
        response.raise_for_status()
        return response.json().get("translation", "")
    except requests.RequestException as e:
        print(f"Erro ao traduzir o texto: {e}")
        return ""

def process_file(file_path, source_lang, target_lang):
    """Lê o arquivo, traduz o conteúdo e retorna o texto traduzido."""
    with open(file_path, "r", encoding="utf-8") as file:
        lines = file.readlines()

    translated_lines = []
    for line in lines:
        # Mantém a estrutura de tags e traduz apenas o conteúdo
        if line.strip().startswith("<") and line.strip().endswith(">"):
            translated_lines.append(line)
        else:
            translated_text = translate_text(source_lang, target_lang, line.strip())
            translated_lines.append(translated_text + "\n")

    return translated_lines

def main():
    # Solicita os idiomas ao usuário
    source_lang = input("Digite o idioma de origem (ex: en): ").strip()
    target_lang = input("Digite o idioma de destino (ex: pt): ").strip()

    # Cria o diretório de destino, se não existir
    os.makedirs(TARGET_DIR, exist_ok=True)

    # Processa cada arquivo na pasta de origem
    for file_name in os.listdir(SOURCE_DIR):
        source_file_path = os.path.join(SOURCE_DIR, file_name)
        target_file_path = os.path.join(TARGET_DIR, file_name)

        if os.path.isfile(source_file_path):
            print(f"Traduzindo arquivo: {file_name}")
            translated_content = process_file(source_file_path, source_lang, target_lang)

            # Salva o arquivo traduzido
            with open(target_file_path, "w", encoding="utf-8") as target_file:
                target_file.writelines(translated_content)

            print(f"Arquivo traduzido salvo em: {target_file_path}")

if __name__ == "__main__":
    main()