import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

final String apiKey = dotenv.env['GEMINI_API_KEY'] ?? "";
const String baseUrl =
    "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent";

Future<String> fetchGeminiResponse(String prompt) async {
  if (apiKey.isEmpty) {
    return "Erreur : clé API manquante ⚠️";
  }

  try {
    final response = await http.post(
      Uri.parse("$baseUrl?key=$apiKey"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {"text": prompt}
            ]
          }
        ]
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final text = data["candidates"][0]["content"]["parts"][0]["text"];
      return text ?? "Pas de réponse 🤔";
    } else {
      return "Erreur API : ${response.statusCode}";
    }
  } catch (e) {
    return "Erreur réseau : $e";
  }
}
