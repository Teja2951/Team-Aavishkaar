import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Chatbot2Screen extends StatefulWidget {
  @override
  _Chatbot2ScreenState createState() => _Chatbot2ScreenState();
}

class _Chatbot2ScreenState extends State<Chatbot2Screen> {
  final TextEditingController _inputController = TextEditingController();
  String _response = "";
  bool _isLoading = false;

  // Replace with your actual API key
  static const String _apiKey = "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";
  static const String _endpoint = "https://api.openai.com/v1/chat/completions";

  Future<void> _sendMessage(String message) async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse(_endpoint),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $_apiKey",
        },
        body: json.encode({
          "model": "whisper-1", // Use your desired model
          "messages": [
            {"role": "user", "content": message}
          ]
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _response = data['choices'][0]['message']['content'];
        });
      } else {
        setState(() {
          _response = "Error: ${response.body}";
        });
      }
    } catch (e) {
      setState(() {
        _response = "Error: $e";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chatbot"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _inputController,
              decoration: InputDecoration(
                labelText: "Enter your message",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                final message = _inputController.text;
                if (message.isNotEmpty) {
                  _sendMessage(message);
                  _inputController.clear();
                }
              },
              child: Text("Send"),
            ),
            const SizedBox(height: 20),
            _isLoading
                ? CircularProgressIndicator()
                : Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        _response,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
