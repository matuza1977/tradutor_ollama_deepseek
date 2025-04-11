from flask import Flask, render_template, request, jsonify
import requests
import os
from dotenv import load_dotenv

app = Flask(__name__)
load_dotenv()

OLLAMA_API_URL = "http://localhost:11434/api/generate"

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/translate', methods=['POST'])
def translate():
    data = request.json
    text = data.get('text', '')
    source_lang = data.get('source_lang', 'en')
    target_lang = data.get('target_lang', 'pt')

    prompt = f"""Translate the following text from {source_lang} to {target_lang}. 
    Only provide the translation, without any additional text or explanations.
    
    Text to translate: {text}"""

    try:
        response = requests.post(
            OLLAMA_API_URL,
            json={
                "model": "deepseek-coder",
                "prompt": prompt,
                "stream": False
            }
        )
        
        if response.status_code == 200:
            result = response.json()
            translation = result.get('response', '')
            return jsonify({'translation': translation})
        else:
            return jsonify({'error': 'Failed to get translation'}), 500

    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True) 