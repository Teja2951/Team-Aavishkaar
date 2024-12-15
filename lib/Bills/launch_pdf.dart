import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class LaunchPDF extends StatelessWidget {
  final String link;
  final String heading;


  const LaunchPDF({
    required this.link,
    required this.heading,
    super.key  
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('$heading'),
      ),
      body: SfPdfViewer.network(
              '$link'
            )
    );
  }
}