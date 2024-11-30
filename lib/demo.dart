// import 'dart:io';

// import 'package:google_generative_ai/google_generative_ai.dart';

// void main() async {
//   final apiKey = 'AIzaSyAiiK5e3IczRDfbb-wz59_m2x0XQ12Vnno';
//   if (apiKey == null) {
//     stderr.writeln(r'No GEMINI_API_KEY environment variable');
//     exit(1);
//   }

//   // Configure the generative model
//   final model = GenerativeModel(
//     model: 'gemini-1.5-flash',
//     apiKey: apiKey,
//     generationConfig: GenerationConfig(
//       temperature: 1.0,
//       maxOutputTokens: 800,
//       topP: 0.8,
//       topK: 10,
//       stopSequences: ['Title'],
//       responseMimeType: 'text/plain',
//     ),
//   );

//   // Use concrete implementation of Part (e.g., TextPart)
//   final response = await model.generateContent([
//     Content(
//       'input',
//       [TextPart('What is SIH Team Aavishkaar?')],
//     ),
//     Content(
//       'output',
//       [TextPart('Yes, absolutely! You are talking to Team Aavishkaar, SIH 2024.')],
//     ),
//     Content(
//       'input',
//       [TextPart('What is SIH Team Aavishkaar?')],
//     ),
//     Content(
//       'output',
//       [], // Empty parts for response
//     ),
//   ]);

//   // Print the response
//   print(response.text);
// }