import 'dart:convert';
import 'package:aavishkaar/Bills/launch_pdf.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:lottie/lottie.dart';

class BillDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> bill;

  const BillDetailsScreen({super.key, required this.bill});

  @override
  State<BillDetailsScreen> createState() => _BillDetailsScreenState();
}

class _BillDetailsScreenState extends State<BillDetailsScreen> {
  String _response = "";
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _sendMessage();
  }

  Future<void> _sendMessage() async {
    final model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: 'AIzaSyAiiK5e3IczRDfbb-wz59_m2x0XQ12Vnno', // Replace with a valid API key
    );

    final prompt = 'Generate a Summary understandable dont make it too long just able to understand and a the bottom write what are its impacts on the Following bill of the heres a text regarding it ${widget.bill['summary']}';

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await model.generateContent([Content.text(prompt)]);
      final responseText = response.text ?? "Failed to generate summary.";
      setState(() {
        _response = responseText;
        _isLoading = false;
      });
      print(responseText);
    } catch (e) {
      setState(() {
        _response = "Error generating summary.";
        _isLoading = false;
      });
      print('Error generating summary: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> steps = ['Lok Sabha Proposed', 'Lok Sabha Passed', 'Rajya Sabha Passed'];
  String status = widget.bill['status'] ?? '';

  int getVisitedIndex(String status) {
    if (status == 'Rajya Sabha Passed') return 3;
    if (status == 'Lok Sabha Passed') return 2;
    if (status == 'Lok Sabha Proposed') return 1;
    return 0;
  }

  int visitedIndex = getVisitedIndex(status);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(widget.bill['title'] ?? 'Bill Details'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 70),
              Text(
                widget.bill['title'] ?? 'Bill Details',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Date: ${widget.bill['date'] ?? 'Unknown Date'}",
                style: const TextStyle(fontSize: 16, color: Colors.white70),
              ),
              const SizedBox(height: 8),
              Text(
                "Ministry: ${widget.bill['ministry'] ?? 'No Ministry Info'}",
                style: const TextStyle(fontSize: 16, color: Colors.white70),
              ),
              const SizedBox(height: 8),
              Text(
                "Status: ${widget.bill['isCompleted'] == true ? 'Completed' : 'Pending'}",
                style: const TextStyle(fontSize: 16, color: Colors.white70),
              ),

              SizedBox(height: 20,),

              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(steps.length, (index) {
                bool isVisited = index < visitedIndex;
                return Column(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: isVisited ? Colors.green : Colors.grey,
                      child: Icon(
                        Icons.check,
                        color: isVisited ? Colors.white : Colors.black26,
                        size: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      steps[index],
                      style: TextStyle(
                        fontSize: 12,
                        color: isVisited ? Colors.green : Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              }),
            ),


              const SizedBox(height: 24),
              Text(
                "Summary:",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              _isLoading
                  ? Center(child: Lottie.asset('assets/StoryLoad.json', height: 150))
                  : Text(
                      _response,
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
              const SizedBox(height: 24),
              if (widget.bill['tag1'] != null || widget.bill['tag2'] != null) ...[
                Text(
                  "Related Articles:",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: [
                    if (widget.bill['tag1'] != null)
                      Chip(
                        label: Text(widget.bill['tag1']),
                        backgroundColor: Colors.lightBlue[200],
                      ),
                    if (widget.bill['tag2'] != null)
                      Chip(
                        label: Text(widget.bill['tag2']),
                        backgroundColor: Colors.purple[200],
                      ),
                  ],
                ),
              ],
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  print('Opening PDF');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LaunchPDF(
                      link: widget.bill['pdf_url'],
                      heading: widget.bill['title'],
                    ))
                  );
                },
                child: const Text("View PDF"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
