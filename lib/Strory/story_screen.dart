import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;

class StoryScreen extends StatefulWidget {
  final String articleText;

  const StoryScreen({required this.articleText});

  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  String story = "";
  String imageUrl = ""; 
  bool isLoading = true;
  final String apiKey = 'AIzaSyAiiK5e3IczRDfbb-wz59_m2x0XQ12Vnno'; 
  final String unsplashAccessKey = 'dw6XGrGTYcs6vZk8zZA73QQgmDbh28IB1SvZswUEtgY'; 
  List<String> storyTypes = ['Creative', 'Informative', 'Adventure','Humourous'];

  String selectedStoryType = 'Creative';
  String selectedStoryLength = 'Short';
  double temp = 2;
  double t_k = 40;
  double t_p = 0.95;

  void resetSettings() {
    setState(() {
      temp = 1.0;
      t_p = 0.95;
      t_k = 40;
    });
  }


  @override
  void initState() {
    super.initState();
    generateStory(widget.articleText, selectedStoryType, selectedStoryLength, temp, t_p, t_k);
  }

  Future<void> generateStory(String text, String storyType, String length,double temp , double t_p , double t_k) async {
    final model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: apiKey,
      generationConfig: GenerationConfig(
      temperature: temp,
      topK: t_k.toInt(),
      topP: t_p,
      maxOutputTokens: 8192,
      responseMimeType: 'text/plain',
    ),
    );

    final prompt =
        'create a Indian Constitutional based story on the article $text so that the following article is easily understandable after reading this story keep the english simple'
        'story type: $storyType'
        'story length: $length'
        'also after the story ends write a small summary of the same article'
        //'Create a $storyType story of $length length based on the following article of the Indian Constitution: $text. after reading the story one should be able to understand the whole article $text of tht indian constitution and add a summary of that article at the last'
        'Also, generate a concise image prompt which should state whats happening in the story like seeing the funny humorous image u can relate to the sstory, surrounded by *** at the start, describing a suitable image for this story.';

    setState(() {
      isLoading = true;
    });

    try {
      final response = await model.generateContent([Content.text(prompt)]);
      final responseText = response.text ?? "Failed to generate story.";
      parseResponse(responseText);
      print(responseText);
    } catch (e) {
      setState(() {
        story = "Error generating story.";
        isLoading = false;
      });
      print('Error generating story: $e');
    }
  }

  void parseResponse(String responseText) {
    print(responseText);
  final match = RegExp(r'\*\*\*(.*?)\*\*\*').firstMatch(responseText);
  var imagePrompt = match?.group(1)?.trim() ?? '';
  final storyText = responseText.replaceAll(RegExp(r'\*\*\*.*?\*\*\*'), '').trim();

  imagePrompt +=
      " a realastic focused on education, learning, and the Indian Constitution. Avoid inappropriate content, swimsuits, or irrelevant objects.";

  setState(() {
    story = storyText;
  });

  fetchImage(imagePrompt);
}


  Future<void> fetchImage(String prompt) async {
    final unsplashUrl =
        'https://api.unsplash.com/photos/random?query=$prompt&client_id=$unsplashAccessKey';

    try {
      final response = await http.get(Uri.parse(unsplashUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          imageUrl = data['urls']['regular'];
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load image');
      }
    } catch (e) {
      print('Error fetching image: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

void _showSettings() {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setModalState) {
          final List<String> storyLengths = ['Short', 'Medium', 'Long'];

          void resetSettings() {
    setState(() {
      temp = 1.0;
      t_p = 0.95;
      t_k = 40;
    });
     setModalState((){
                temp = 1;
                t_k = 40;
                t_p = 0.95;
              });
  }
          

          return DraggableScrollableSheet(
            expand: false,
            maxChildSize: 0.8,
            minChildSize: 0.5,
            builder: (context, scrollController) {
              return DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    
                    const SizedBox(height: 10),
                    // Drag Handle
                    Container(
                      width: 50,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Settings",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    TabBar(
                      indicatorColor: Colors.blueAccent,
                      labelColor: Colors.blueAccent,
                      unselectedLabelColor: Colors.grey,
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                      tabs: const [
                        Tab(text: "Story Mode"),
                        Tab(text: "Advanced Selection"),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          ListView(
                            padding: const EdgeInsets.all(10),
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Dropdown for Story Type
                                  const Text(
                                    "Story Type",
                                    style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  DropdownButtonFormField<String>(
                                    value: selectedStoryType,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      filled: true,
                                      fillColor: Colors.grey[200],
                                    ),
                                    onChanged: (value) {
                                      setModalState(() {
                                        selectedStoryType = value!;
                                      });
                                    },
                                    items: storyTypes
                                        .map(
                                          (type) => DropdownMenuItem(
                                            value: type,
                                            child: Text(type),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                  const SizedBox(height: 20),
                                  // Dropdown for Story Length
                                  const Text(
                                    "Story Length",
                                    style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  DropdownButtonFormField<String>(
                                    value: selectedStoryLength,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      filled: true,
                                      fillColor: Colors.grey[200],
                                    ),
                                    onChanged: (value) {
                                      setModalState(() {
                                        selectedStoryLength = value!;
                                      });
                                    },
                                    items: storyLengths
                                        .map(
                                          (length) => DropdownMenuItem(
                                            value: length,
                                            child: Text(length),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                  const SizedBox(height: 30),
                                  
                                ],
                              ),
                            ],
                          ),
                          
                          ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MaterialButton(
                onPressed: resetSettings,
                child: Icon(Icons.refresh)
              ),
            ],
          ),
          // Temperature Control
          ListTile(
            title: Text("Temperature Control"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Slider(
                  value: temp,
                  min: 0.0,
                  max: 2.0,
                  divisions: 200,
                  label: temp.toStringAsFixed(2),
                  onChanged: (value) {
                    setModalState(() {
                      temp = value;
                    });
                  },
                ),
                Text("Current Value: ${temp.toStringAsFixed(2)}"),
              ],
            ),
          ),
          Divider(),

          // Top-P Control
          ListTile(
            title: Text("Top-P Control"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Slider(
                  value: t_p,
                  min: 0.0,
                  max: 1.0,
                  divisions: 100,
                  label: t_p.toStringAsFixed(2),
                  onChanged: (value) {
                    setModalState(() {
                      t_p = value;
                    });
                  },
                ),
                Text("Current Value: ${t_p.toStringAsFixed(2)}"),
              ],
            ),
          ),
          Divider(),

          // K Control
          ListTile(
            title: Text("K Control"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Slider(
                  value: t_k,
                  min: 0.0,
                  max: 100.0,
                  divisions: 100,
                  label: t_k.toStringAsFixed(0),
                  onChanged: (value) {
                    setModalState(() {
                      t_k = value;
                    });
                  },
                ),
                Text("Current Value: ${t_k.toStringAsFixed(0)}"),
              ],
            ),
          ),
          Divider(),
        ],
      ),

                        ],
                        
                      ),
                    ),
                  
                Center(
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor:  Colors.deepPurple, // Background color
      foregroundColor: Colors.white, // Text color
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16), // Button padding
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      elevation: 5, // Shadow effect
      textStyle: TextStyle(
        fontSize: 16, // Font size
        fontWeight: FontWeight.bold, // Text weight
      ),
    ),
    onPressed: () {
      // Apply selected settings
      Navigator.pop(context);
      generateStory(
        widget.articleText,
        selectedStoryType!,
        selectedStoryLength,
        temp,
        t_p,
        t_k,
      );
    },
    child: const Text("Apply Settings"),
  ),
),

                  ],
                ),
              );
            },
          );
        },
      );
    },
  );
}

final FlutterTts flutterTts = FlutterTts();
bool _isSpeaking = false;

Future<void> _speakText() async {
  await flutterTts.setLanguage("en-IN"); // Set the desired language
  await flutterTts.setPitch(1.0); // Set the pitch (default: 1.0)
  await flutterTts.setSpeechRate(0.5); // Set the speech rate (default: 1.0)
  setState(() {
    _isSpeaking = true;
  });
  await flutterTts.speak(story); // Ensure `generatedText` is used here
}

Future<void> _stopSpeak() async {
  await flutterTts.pause(); // Pause the TTS
  setState(() {
    _isSpeaking = false;
  });
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        if (_isSpeaking) {
          _stopSpeak();
        } else {
          _speakText();
        }
      },
      child: Icon(_isSpeaking ? Icons.pause : Icons.play_arrow),
    ),
    body: Stack(
      children: [
        // Background
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.purpleAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        // Custom "AppBar"
        Positioned(
          top: 40,
          left: 20,
          right: 20,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
                const Text(
                  'Story',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.refresh, color: Colors.black),
                      onPressed: () {
                        generateStory(widget.articleText, selectedStoryType, selectedStoryLength, temp, t_p, t_k);
                      },
                    ),
                    IconButton(
                      onPressed: _showSettings,
                      icon: const Icon(Icons.settings, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // Main Content
        Positioned.fill(
          top: 100,
          child: isLoading
              ? Center(child: Lottie.asset('assets/StoryLoad.json'))
              : SingleChildScrollView(  // Wrap the whole content in a SingleChildScrollView
                  child: Column(
                    children: [
                      // Image
                      Container(
                        height: 300,
                        width: double.infinity,
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: NetworkImage(imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Story Text
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          story,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ],
    ),
  );
}
}