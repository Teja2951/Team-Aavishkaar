// import 'package:flutter/material.dart';
// import 'package:google_generative_ai/google_generative_ai.dart';

// class Chatbot extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Tuned Model Example'),
//         ),
//         body: Center(
//           child: TunedModelButton(),
//         ),
//       ),
//     );
//   }
// }

// class TunedModelButton extends StatelessWidget {
//   // Replace 'your-api-key' with your actual API key.
//   final String apiKey = 'AIzaSyAiiK5e3IczRDfbb-wz59_m2x0XQ12Vnno';

//   Future<void> _generateContent() async {
//     final model = GenerativeModel(
//       model: 'tunedModels/newset-ugmlye56xffp', // --NEW SET WALA MODEL--
//       apiKey: apiKey,
//     );

//     final prompt = 'What is the name of the user in this chatbot?';
//     try {
//       final response = await model.generateContent([Content.text(prompt)]);
//       print('Generated Response: ${response.text}');
//     } catch (e) {
//       print('Error generating content: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: _generateContent,
//       child: Text('what is capital of india'),
//     );
//   }
// }



import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class Chatbot extends StatefulWidget {
  const Chatbot({super.key});

  @override
  State<Chatbot> createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  final Gemini gemini = Gemini.instance;

  List<ChatMessage> messages = [];

  ChatUser currentUser = ChatUser(id: '0', firstName: 'You');
  ChatUser geminiUser = ChatUser(id: '1', firstName: 'Gemini');

  final TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatSaathi'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: DashChat(
              currentUser: currentUser,
              onSend: _sendMessage,
              messages: messages,
              messageOptions: const MessageOptions(
                containerColor: Colors.blue,
                textColor: Colors.black,
              ),
              inputOptions: InputOptions(
                sendButtonBuilder: (function) => IconButton(
                  icon: const Icon(Icons.send, color: Colors.blue),
                  onPressed: function,
                ),
                inputDecoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintText: 'Type your message...',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage(ChatMessage chatMessage) {
  setState(() {
    messages = [chatMessage, ...messages];
  });

  try {
    String question =  chatMessage.text;

    // Specify your fine-tuned model ID here
    gemini
        .streamGenerateContent(
          question,
          modelName:  'tunedModels/modifiedarticles-24rk5uxrc6i', // Use your fine-tuned model
          generationConfig: GenerationConfig(
            temperature: 1,
            topK: 40,
            topP: 0.95,
            maxOutputTokens: 8192,
            stopSequences: ["if asked anything other than indian constitution say i dont know"]
          )
        )
        .listen((event) {
      String response = event.content?.parts?.fold("", (previous, current) => "$previous${current.text}") ?? "";
      ChatMessage botMessage = ChatMessage(
        user: geminiUser,
        createdAt: DateTime.now(),
        text: response,
      );
      setState(() {
        messages = [botMessage, ...messages];
        print(response);
      });
    });
  } catch (e) {
    print(e);
  }
}
}