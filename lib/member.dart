//new code
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Model for attendance records
class AttendanceRecord {
  final DateTime checkInTime;
   DateTime? checkOutTime; // Nullable because the member might not have checked out yet

  AttendanceRecord({required this.checkInTime, this.checkOutTime});
}

// Member model, including attendance
class Member {
  final String name;
  final LatLng currentLocation;
  List<AttendanceRecord> attendance;  // List to track attendance

  // Constructor now accepts attendance records as a parameter
  Member({
    required this.name,
    required this.currentLocation,
    required this.attendance,
  });
}


