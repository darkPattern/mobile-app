from flask import Flask, request, jsonify
import fitz  # PyMuPDF
import pytesseract
from PIL import Image
import io
import re
import requests
import json  # Import json to handle JSON response
import languagemodels as lm

app = Flask(__name__)


@app.route('/extract_text', methods=['POST'])
def extract_text():
    if 'file' not in request.files:
        return jsonify({'error': 'No file part'})

    file = request.files['file']

    if file.filename == '':
        return jsonify({'error': 'No selected file'})

    try:
        if file and allowed_file(file.filename):
            extracted_medicine = extract_medicine(file)
            llm_response = process_with_llm(extracted_medicine)

            return jsonify({'extracted_medicine': llm_response})

    except Exception as e:
        return jsonify({'error': str(e)})

    return jsonify({'error': 'File format not supported or processing failed'})


def extract_medicine(file):
    # Your extraction logic for medicine names goes here
    # Use your existing logic for extracting medicine names
    extracted_medicine_list = []  # Replace this with your logic

    return extracted_medicine_list


def process_with_llm(text):
    try:
        # Process the text with the language model (languagemodels as lm)
        response = lm.do('make a key value paid for medicine name dosage and time')

        # Process the language model response, assuming it returns a dictionary of medicine names with their associated meal times
        processed_response = process_language_model_response(response)

        return processed_response

    except Exception as e:
        return {'error': str(e)}


def process_language_model_response(response):
    # Process the language model response to fit your desired output format
    # Assume response is a dictionary of medicine names with their associated meal times

    # Sample formatting: create a key-value pair response
    formatted_response = {'medicine_data': response}
    return formatted_response


def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in {'pdf', 'png', 'jpg', 'jpeg', 'gif'}


if __name__ == '__main__':
    app.run(debug=True)
