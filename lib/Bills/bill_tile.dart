import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BillTile extends StatelessWidget {
  final int id;
  final String title;
  final String date;
  final String ministry;
  final bool isCompleted;
  final String tag1;
  final String tag2;
  final String link;
  final VoidCallback onTap;

  BillTile({
    super.key,
    required this.id,
    required this.title,
    required this.date,
    required this.ministry,
    required this.isCompleted,
    required this.tag1,
    required this.tag2,
    required this.link,
    required this.onTap,
  });

  final List<Color> _darkColors = [
    const Color.fromARGB(255, 101, 24, 235),
    const Color.fromARGB(255, 22, 54, 237),
    const Color.fromARGB(255, 9, 162, 238),
    const Color.fromARGB(255, 238, 75, 15),
    const Color.fromARGB(221, 9, 238, 47),
    const Color.fromARGB(255, 245, 70, 17),
  ];

  Color _getRandomColor() {
    final random = Random();
    return _darkColors[random.nextInt(_darkColors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: _getRandomColor(),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tags row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    _buildTag(tag2, Colors.amber),
                    _buildTag(tag1, Colors.amber),
                ],
              ),
              const SizedBox(height: 10),
              // Title, Date, and Ministry
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis, // Prevent overflow
              ),
              const SizedBox(height: 4),
              Text(
                "Date : $date",
                style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
              const SizedBox(height: 2),
              Text(
                "Ministry : $ministry",
                style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
              const SizedBox(height: 10),
              // Status Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatusIndicator(isCompleted),
                  Image.network(
                    'https://i.imghippo.com/files/ICk3883jas.png',
                     height: 180,
                     width: 180,
                    )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method for tags
  Widget _buildTag(String text, Color color) {
    return Container(
      height: 40,
      width: 150,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  // Helper method for status indicator
  Widget _buildStatusIndicator(bool isCompleted) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: isCompleted
            ? const Color.fromARGB(255, 0, 255, 8)
            : Colors.red,
      ),
      height: 40,
      width: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: isCompleted
            ? [
                const Icon(Icons.done_outline_rounded),
                const SizedBox(width: 5),
                const Text(
                  'Bill Passed',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ]
            : [
                const Icon(Icons.pending),
                const SizedBox(width: 5),
                const Text(
                  'Pending',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
      ),
    );
  }
}
