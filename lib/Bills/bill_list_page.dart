import 'package:aavishkaar/Bills/bill_detail.dart';
import 'package:aavishkaar/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'bill_tile.dart';
class BillsListScreen extends StatelessWidget {
  const BillsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SupabaseClient supabase = Supabase.instance.client;

    // Stream to listen to updates in the 'bills' table
    final Stream<List<Map<String, dynamic>>> billStream = supabase
        .from('bills')
        .stream(primaryKey: ['id'])
        .execute()
        .map((event) => List<Map<String, dynamic>>.from(event));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bills of 2024'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LandingPage())
            );
          },
        ),
        ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: billStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error loading bills: ${snapshot.error}'),
            );
          }

          final bills = snapshot.data ?? [];

          if (bills.isEmpty) {
            return const Center(child: Text('No bills found.'));
          }

          return ListView.builder(
            itemCount: bills.length,
            itemBuilder: (context, index) {
              final bill = bills[index];
              return BillTile(
                id: bill['id'],
                title: bill['title'] ?? 'No Title',
                date: bill['date'] ?? 'Unknown Date',
                ministry: bill['ministry'] ?? 'No Ministry',
                tag1:  bill['tag1']  ?? 'na',
                tag2:  bill['tag2'] ?? 'na',
                isCompleted: bill['isCompleted'],
                link: bill['pdf_url'],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BillDetailsScreen(bill: bill),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
