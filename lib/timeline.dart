import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

class ConstitutionTimelineScreen extends StatelessWidget {
  final List<Map<String, dynamic>> timelineEvents = [
    {
      'date': '1947-08-15',
      'event': 'Independence of India',
      'description': 'India gains independence from British rule.',
      'image': 'assets/landingBanner.png',
      'animation': 'assets/lottie/independence.json',  // Example Lottie animation
    },
    {
      'date': '1950-01-26',
      'event': 'Adoption of the Constitution',
      'description': 'The Constitution of India was formally adopted.',
      'image': 'assets/landingBanner.png',
      'animation': 'assets/lottie/constitution_adopted.json',
    },
    {
      'date': '1976',
      'event': '42nd Amendment',
      'description': 'The 42nd Amendment to the Constitution was passed.',
      'image': 'assets/landingBanner.png',
      'animation': 'assets/lottie/amendment.json',
    },
    // Add more events
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timeline of the Indian Constitution'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'Historical Timeline',
                style: GoogleFonts.lora(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              GradientTimelineWidget(events: timelineEvents),
            ],
          ),
        ),
      ),
    );
  }
}

class GradientTimelineWidget extends StatelessWidget {
  final List<Map<String, dynamic>> events;

  GradientTimelineWidget({required this.events});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Add animated gradient background
        Positioned.fill(
          child: AnimatedContainer(
            duration: Duration(seconds: 5),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.blueAccent, Colors.greenAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        // Timeline list
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: events.length,
          itemBuilder: (context, index) {
            final event = events[index];

            return GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return EventDetailDialog(event: event);
                  },
                );
              },
              child: TimelineEventCard(event: event),
            );
          },
        ),
      ],
    );
  }
}

class TimelineEventCard extends StatelessWidget {
  final Map<String, dynamic> event;

  TimelineEventCard({required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(vertical: 15),
      color: Colors.white.withOpacity(0.85),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            event['image'],
            height: 55,
            width: 55,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          event['event'],
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.deepPurple,
          ),
        ),
        subtitle: Text(
          event['date'],
          style: GoogleFonts.roboto(fontSize: 14, color: Colors.grey[600]),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 20),
      ),
    );
  }
}

class EventDetailDialog extends StatelessWidget {
  final Map<String, dynamic> event;

  EventDetailDialog({required this.event});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(event['event'], style: GoogleFonts.lora(fontSize: 22)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(event['image']),
          ),
          SizedBox(height: 15),
          Text(
            event['description'],
            style: GoogleFonts.roboto(fontSize: 16),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 15),
          // Lottie animation for each event
          Lottie.asset(
            event['animation'],
            height: 120,
            width: 120,
            repeat: false, // Animation will play once
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Close',
            style: GoogleFonts.roboto(color: Colors.deepPurple),
          ),
        ),
      ],
    );
  }
}
