import 'package:flutter/material.dart';
import 'package:http/http.dart as http;
import 'dart:convert';

class TranslationService {
  final String apiKey;

  TranslationService(this.apiKey);

  Future<String> translateText(String text, String targetLanguage) async {
    final response = await http.post(
      Uri.parse('https://translation.googleapis.com/language/translate/v2'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'q': text,
        'target': targetLanguage,
        'key': apiKey,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['data']['translations'][0]['translatedText'];
    } else {
      throw Exception('Failed to translate text');
    }
  }
}

class TranslationScreen extends StatefulWidget {
  final TranslationService translationService;

  TranslationScreen(this.translationService);

  @override
  _TranslationScreenState createState() => _TranslationScreenState();
}

class _TranslationScreenState extends State<TranslationScreen> {
  String translatedText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Translation App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Translate this text:', style: TextStyle(fontSize: 20)),
            Text(
              'Hello, World!',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () async {
                final translation = await widget.translationService.translateText('Hello, World!', 'es');
                setState(() {
                  translatedText = translation;
                });
              },
              child: Text('Translate'),
            ),
            if (translatedText.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Translated Text: $translatedText',
                  style: TextStyle(fontSize: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TranslationScreen(
      TranslationService('AIzaSyCA33eA4vQlTuh14zmZOm3or4js3F-TvQ8'), // Replace with your actual API key
    ),
  ));
}
