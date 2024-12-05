import 'package:flutter/material.dart';

class BillTile extends StatelessWidget {
  final int id;
  final String title;
  final String date;
  final String ministry;
  final bool isCompleted;
  final String tag1;
  final String tag2;
  final VoidCallback onTap;

  const BillTile({
    super.key,
    required this.id,
    required this.title,
    required this.date,
    required this.ministry,
    required this.isCompleted,
    required this.tag1,
    required this.tag2,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ID or Icon
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: isCompleted ? Colors.green : Colors.grey[300],
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  id.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 16),
              // Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Date and Ministry
                    Text(
                      "Date: $date",
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Ministry: $ministry",
                      style: const TextStyle(color: Colors.grey),
                    ),

                    Row(
                      children: [
                        MaterialButton(onPressed: () {}, child: Text(tag1)),
                        MaterialButton(onPressed: () {}, child: Text(tag1))
                      ],
                    )
                  ],
                ),
              ),
              // Bookmark Icon for Completion

              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: isCompleted? Colors.green : Colors.red,
                    ),
                    height: 40,
                    width: 100,
                    child: isCompleted? Center(child: Text('Bill Passed')) : Center(child: Text('Pending')),
                  )
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
