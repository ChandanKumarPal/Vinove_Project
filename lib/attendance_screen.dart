// new code
import 'package:flutter/material.dart';
import 'member.dart';

class AttendanceScreen extends StatelessWidget {
  final Member member;

  AttendanceScreen({required this.member});

  // Method to format DateTime for display
  String _formatDateTime(DateTime dateTime) {
    return "${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}";
  }

  // Function to calculate attendance percentage
  double _calculateAttendancePercentage() {
    int totalDays = 30; // Example: Total days to consider for percentage
    int presentDays = member.attendance
        .where((record) => record.checkOutTime != null)
        .length;  // Count days with both check-in and check-out

    return (presentDays / totalDays) * 100;  // Calculate percentage
  }

  @override
  Widget build(BuildContext context) {
    double attendancePercentage = _calculateAttendancePercentage();

    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance for ${member.name}'),
      ),
      body: Column(
        children: [
          // Display attendance percentage
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Attendance Percentage: ${attendancePercentage.toStringAsFixed(2)}%',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: member.attendance.length,
              itemBuilder: (context, index) {
                final record = member.attendance[index];
                return ListTile(
                  title: Text('Check-in: ${_formatDateTime(record.checkInTime)}'),
                  subtitle: record.checkOutTime != null
                      ? Text('Check-out: ${_formatDateTime(record.checkOutTime!)}')
                      : Text('Still checked in'),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _handleAttendance(context);
        },
        child: Icon(Icons.check),
        tooltip: 'Add Attendance',
      ),
    );
  }

  // Method to handle check-in/check-out toggle
  void _handleAttendance(BuildContext context) {
    final now = DateTime.now();
    // If the member has an open attendance record, check them out
    if (member.attendance.isNotEmpty && member.attendance.last.checkOutTime == null) {
      member.attendance.last.checkOutTime = now;  // Update checkOutTime
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Checked out!')));
    } else {
      // If no open record, check them in
      member.attendance.add(AttendanceRecord(checkInTime: now));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Checked in!')));
    }
  }
}

