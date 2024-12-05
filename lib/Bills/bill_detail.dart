import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:http/http.dart' as http;


// add ai generated summary
// improve the ui 
// add elememts to show infographics
// add yt links
// open pdf in the app itself

class BillDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> bill;

  const BillDetailsScreen({super.key, required this.bill});

  @override
  State<BillDetailsScreen> createState() => _BillDetailsScreenState();
}

class _BillDetailsScreenState extends State<BillDetailsScreen> {


  String _response = "";
  bool _isLoading = true;
  String link = "";

  void initState() {
    super.initState();
    _sendMessage();
  }



  static const String _apiKey = 'AIzaSyAiiK5e3IczRDfbb-wz59_m2x0XQ12Vnno';

  Future<void> _sendMessage() async {
    final model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: _apiKey,
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
    return Scaffold(
      appBar: AppBar(title: Text(widget.bill['title'] ?? 'Bill Details')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            // Date
            Text(
              "Date: ${widget.bill['date'] ?? 'Unknown Date'}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            // Ministry
            Text(
              "Ministry: ${widget.bill['ministry'] ?? 'No Ministry Info'}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            // Status
            Text(
              "Status: ${widget.bill['isCompleted'] == true ? 'Completed' : 'Pending'}",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 16),
            // Summary
            Text(
              "Summary:",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              _response ?? 'No summary available.',
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            // Tags
            if (widget.bill['tag1'] != null || widget.bill['tag2'] != null) ...[
              Text(
                "Tags:",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              if (widget.bill['tag1'] != null)
                Chip(
                  label: Text(widget.bill['tag1']),
                  backgroundColor: Colors.grey[200],
                ),
              if (widget.bill['tag2'] != null)
                Chip(
                  label: Text(widget.bill['tag2']),
                  backgroundColor: Colors.grey[200],
                ),
            ],
            const SizedBox(height: 16),
            // PDF URL
            if (widget.bill['pdf_url'] != null)
              TextButton.icon(
                onPressed: () {
                  // Open the PDF URL in a browser or WebView
                  // Use `url_launcher` for handling this action
                  launchPDF(widget.bill['pdf_url']);
                },
                icon: const Icon(Icons.picture_as_pdf, color: Colors.red),
                label: const Text(
                  "View PDF",
                  style: TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void launchPDF(String pdfUrl) {
    // Import url_launcher and add logic to open the URL
    // Example: `launchUrl(Uri.parse(pdfUrl));`
  }
}
