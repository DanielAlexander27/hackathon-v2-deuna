import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hackathon_v2_deuna/port/service/chat_bot_service.dart';
import 'package:http/http.dart' as http;

class ChatBotServiceGemini implements ChatBotService {
  static const String _baseUrl = 'https://generativelanguage.googleapis.com/v1';

  final List<String> _apiKeys = [
    'AIzaSyBnSi710eXz-A3J_gbfsqW8pttV2HmExFE',
    'AIzaSyDaQK1X8mTEXSfSPuV1KU_Z4xqXnsaQxVA',
    'AIzaSyBMcOzrTkXo97uTNvX0IkPEQJiZvZlEIWE',
    'AIzaSyCzFc8WxEUgzqhbUwe8fe_s5EBd-47DvkA',
  ];

  final List<String> _conversationHistory = [];

  @override
  Future<String> generateMessage(String prompt) async {
    for (final apiKey in _apiKeys) {
      try {
        final url =
            '$_baseUrl/models/gemini-1.5-pro:generateContent?key=$apiKey';

        // Agregar el mensaje actual al historial
        _conversationHistory.add("Usuario: $prompt");

        // Limitar el historial a los últimos 5 mensajes para no sobrecargar la solicitud
        if (_conversationHistory.length > 5) {
          _conversationHistory.removeAt(0);
        }

        // Crear el contexto de la conversación
        final String fullPrompt = """
        Instrucciones: Eres un asistente financiero experto llamado Chasium. Ten en cuenta el contexto de Ecuador. Solo debes responder preguntas relacionadas con finanzas, inversiones, presupuestos, ahorro, impuestos, banca, seguros, planificación financiera, mercados financieros, economía, contabilidad o temas similares. 
        Si la pregunta no está relacionada con finanzas, responde educadamente: "Lo siento, solo puedo ayudarte con temas financieros. ¿Tienes alguna pregunta sobre finanzas, inversiones, presupuestos u otros temas financieros?" 
        Excepción: Si el usuario envía un saludo (como "hola"), responde con "Hola, Soy Chasium, tu asistente financiero con IA. ¿En qué te puedo ayudar?

        Conversación hasta ahora:
        ${_conversationHistory.join("\n")}

        Responde al usuario basándote en la conversación previa.
        """;

        final response = await http.post(
          Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'contents': [
              {
                'parts': [
                  {'text': fullPrompt},
                ],
              }, // Enviar el historial completo
            ],
            'generationConfig': {
              'temperature': 0.7,
              'topK': 40,
              'topP': 0.95,
              'maxOutputTokens': 1024,
            },
          }),
        );

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          final reply =
              data['candidates'][0]['content']['parts'][0]['text'] as String;

          // Agregar la respuesta de Chasium al historial
          _conversationHistory.add("Chasium: $reply");

          return reply;
        } else {
          debugPrint('Error en la API con key $apiKey: ${response.body}');
        }
      } catch (e) {
        debugPrint('Fallo con key $apiKey: $e');
      }
    }
    throw Exception('Todas las claves API fallaron.');
  }
}
