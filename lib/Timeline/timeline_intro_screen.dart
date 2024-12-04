import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TimelineDisplayScreen extends StatelessWidget {
  final String timelineId;
  final supabase = Supabase.instance.client;

  TimelineDisplayScreen({required this.timelineId});

  // Stream for fetching events related to the timeline
  Stream<List<dynamic>> streamEvents() {
    return supabase
        .from('timeline_events')
        .stream(primaryKey: ['id']) // Use primary key for updates
        .eq('parent_id', timelineId); // Filter by parent_id (directly using the timelineId)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Timeline Details')),
      body: StreamBuilder<List<dynamic>>(
        stream: streamEvents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No events available.'));
          }

          final events = snapshot.data!;

          // Local variables to store event details
          List<String> eventTitles = [];
          List<String> eventDescriptions = [];
          List<String> eventDates = [];
          List<String> eventImages = [];
          List<String> eventVideos = [];

          // Populate the local variables with event data
          for (var event in events) {
            eventTitles.add(event['name']);
            eventDescriptions.add(event['description']);
            eventDates.add(event['date']);
            eventImages.add(event['media_url'] != null && event['media_type'] == 'image' ? event['media_url'] : '');
            eventVideos.add(event['media_url'] != null && event['media_type'] == 'video' ? event['media_url'] : '');
          }

          return ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(eventTitles[index]),
                  subtitle: Text(eventDescriptions[index]),
                  trailing: eventImages[index].isNotEmpty
                      ? Image.network(eventImages[index])
                      : (eventVideos[index].isNotEmpty
                          ? Icon(Icons.video_label)
                          : null),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
