from flask import Flask, request, jsonify
import fitz  # PyMuPDF
import pytesseract
from PIL import Image
import io
import re
import requests
import languagemodels as lm

text = ''' 
'''

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
            extracted_medicine = set()

            if file.filename.lower().endswith('.pdf'):
                pdf_document = fitz.open(stream=io.BytesIO(file.read()))
                for page_num in range(pdf_document.page_count):
                    page = pdf_document.load_page(page_num)
                    pix = page.get_pixmap(alpha=False)
                    img = Image.frombytes("RGB", [pix.width, pix.height], pix.samples)
                    text = pytesseract.image_to_string(img)
                pdf_document.close()
            else:
                img = Image.open(file)
                text = pytesseract.image_to_string(img)
            #get_data(text)
            #extracted_medicine_list = get_data(text)
            # Convert the set of extracted medicine names to a list for sending to the API
            extracted_medicine_list = list(extracted_medicine)
            print(text)
            response = get_data(text)

            print(response);
            return jsonify({'extracted_medicine': response})

    except Exception as e:
        return jsonify({'error': str(e)})

    return jsonify({'error': 'File format not supported or processing failed'})


def extract_doctors_name_simple(text):
    words = text.split()
    # Find the index of the word that contains "Dr."
    for i, word in enumerate(words):
        if "Dr." in word:
            # Return the next two words joined by a space
            return ' '.join(words[i:i + 3])


def extract_date(text):
    pattern = r'(\b\d{1,2}[-/]\d{1,2}[-/]\d{2,4}\b)'
    matches = re.findall(pattern, text)
    return matches


def get_data(text):
    med = lm.do(
        "I'm going to provide a sentence describing certain medicines to be taken and what meals they should be taken at, I want you to extract the medicine names and their corresponding meal times of consumption and return it as a python dictionary Simplify it, just give the medicine name folowed by a colon and the meal time. Sentence: " + text)
    doc_name = lm.do(
        "get the doctor's name in the sentence (as a pyton string, just the name don\'t give anything else in your response): " + text)
    doc_name = extract_doctors_name_simple(doc_name)
    follow_date = lm.do(
        "get the date of follow up from the sentence, just give the date and nothing else in your response: " + text)
    follow_date = extract_date(follow_date)
    phno = extract_mobile_number(text)

    data = {
        'name': doc_name,
        'ph_no': phno[0],
        'meds': med,
        'follow_up': follow_date
    }

    return data


def extract_mobile_number(text):
    # This pattern assumes that mobile numbers are 10 digits long
    # and may or may not start with a country code prefix (+91 for Bharat, for example)
    pattern = r'(?:\+91[\-\s]?)?[789]\d{9}'

    # Find all matches in the text
    matches = re.findall(pattern, text)

    # Remove any non-digit characters from the matches
    mobile_numbers = [''.join(filter(str.isdigit, match)) for match in matches]

    # Return the list of mobile numbers
    return mobile_numbers


def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in {'pdf', 'png', 'jpg', 'jpeg', 'gif'}


if __name__ == '__main__':
    app.run(debug=True)