// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class ScheduleGrid extends StatelessWidget {
  final List<String> users = ['Dalia Roushdy', 'Zeina ElNemr'];
  final List<DateTime> dates = List.generate(
    30,
    (index) => DateTime(2025, 7, 7).add(Duration(days: index)),
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          // Top row: Dates
          Row(
            children: [
              Container(width: 120), // Empty corner cell
              ...dates.map((date) {
                final isWeekend = date.weekday == DateTime.saturday ||
                    date.weekday == DateTime.sunday;
                return Container(
                  width: 100,
                  padding: EdgeInsets.all(8),
                  color: isWeekend ? Colors.grey.shade200 : Colors.white,
                  child: Column(
                    children: [
                      Text(_weekday(date.weekday),
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('${date.day}'),
                    ],
                  ),
                );
              }).toList(),
            ],
          ),

          // User rows
          ...users.map((user) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left column: User name with avatar
                Container(
                  width: 120,
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 16,
                        child: Text(
                          _initials(user),
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          user,
                          style: TextStyle(fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),

                // Right grid row (per date)
                ...dates.map((date) {
                  return Container(
                    width: 100,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      color: (date.weekday == DateTime.saturday ||
                              date.weekday == DateTime.sunday)
                          ? Colors.grey.shade100
                          : Colors.white,
                    ),
                    padding: EdgeInsets.all(4),
                    child: _buildCellContent(user, date),
                  );
                }).toList(),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildCellContent(String user, DateTime date) {
    // Example: Add allocations only for Dalia Roushdy on July 8
    if (user == 'Dalia Roushdy' && date.day == 8 && date.month == 7) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 18,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(4),
            ),
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Text('2h Glint (C)',
                style: TextStyle(fontSize: 10, color: Colors.white)),
          ),
          SizedBox(height: 4),
          Container(
            height: 18,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(4),
            ),
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Text('1h GV GX',
                style: TextStyle(fontSize: 10, color: Colors.white)),
          ),
        ],
      );
    }
    return SizedBox.shrink();
  }

  String _weekday(int weekday) {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[weekday % 7];
  }

  String _initials(String name) {
    final parts = name.split(' ');
    if (parts.length >= 2) {
      return parts[0][0] + parts[1][0];
    }
    return name.substring(0, 2);
  }
}
