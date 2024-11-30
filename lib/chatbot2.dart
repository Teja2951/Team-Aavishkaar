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
