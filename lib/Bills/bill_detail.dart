import 'package:flutter/material.dart';


// add ai generated summary
// improve the ui 
// add elememts to show infographics
// add yt links
// open pdf in the app itself

class BillDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> bill;

  const BillDetailsScreen({super.key, required this.bill});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(bill['title'] ?? 'Bill Details')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              "Title: ${bill['title'] ?? 'N/A'}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Date
            Text(
              "Date: ${bill['date'] ?? 'Unknown Date'}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            // Ministry
            Text(
              "Ministry: ${bill['ministry'] ?? 'No Ministry Info'}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            // Status
            Text(
              "Status: ${bill['isCompleted'] == true ? 'Completed' : 'Pending'}",
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
              bill['summary'] ?? 'No summary available.',
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            // Tags
            if (bill['tag1'] != null || bill['tag2'] != null) ...[
              Text(
                "Tags:",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              if (bill['tag1'] != null)
                Chip(
                  label: Text(bill['tag1']),
                  backgroundColor: Colors.grey[200],
                ),
              if (bill['tag2'] != null)
                Chip(
                  label: Text(bill['tag2']),
                  backgroundColor: Colors.grey[200],
                ),
            ],
            const SizedBox(height: 16),
            // PDF URL
            if (bill['pdf_url'] != null)
              TextButton.icon(
                onPressed: () {
                  // Open the PDF URL in a browser or WebView
                  // Use `url_launcher` for handling this action
                  launchPDF(bill['pdf_url']);
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
