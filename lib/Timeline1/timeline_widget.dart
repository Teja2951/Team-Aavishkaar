import 'package:aavishkaar/constitutional_event.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineEventWidget extends StatefulWidget {
  final ConstitutionEvent event;
  final bool isFirst;
  final bool isLast;

  const TimelineEventWidget({
    super.key,
    required this.event,
    required this.isFirst,
    required this.isLast,
  });

  @override
  State<TimelineEventWidget> createState() => _TimelineEventWidgetState();
}

class _TimelineEventWidgetState extends State<TimelineEventWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: widget.isFirst,
      isLast: widget.isLast,
      beforeLineStyle: const LineStyle(
        color: Colors.deepOrange,
        thickness: 2,
      ),
      indicatorStyle: IndicatorStyle(
        width: 30,
        height: 30,
        indicator: Container(
          decoration: const BoxDecoration(
            color: Colors.deepOrange,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              Icons.event,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
      endChild: GestureDetector(
        onTap: () {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
        child: Card(
          margin: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          elevation: 4,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.event.date,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                    Icon(
                      _isExpanded ? Icons.expand_less : Icons.expand_more,
                      color: Colors.grey,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  widget.event.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                if (_isExpanded) ...[
                  const SizedBox(height: 8),
                  Text(
                    widget.event.description,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}