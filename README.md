# Flutter Attendance & Location Tracking App

This Flutter project is an Attendance and Location Tracking system. 
The app allows you to:
1. View a list of members.
2. Track members' current location and route traveled on a map.
3. Display attendance and check-in and check-out reports.
4. View location history with route details including start/stop locations, total distance traveled, and duration.

## Features
- *Member List*: View members with the option to track their location or check attendance.
- *Location Tracking*: Displays current location and route on Google Maps.
- *Attendance Management*: Allows checking and managing attendance records for each member.
- *Route History*: Shows a timeline of locations visited, along with details like total distance and stops.
  
## File Structure
```
.
├── android/                     # Android-specific files
├── ios/                         # iOS-specific files
├── lib/                         # Main Dart code directory
│   ├── member.dart              # Model class for Member
│   ├── member_screen.dart       # UI for the member list and actions
│   ├── location_screen.dart     # Displays location and route on a map
│   ├── attendance_screen.dart   # Displays attendance information
│   ├── main.dart                # Entry point for the Flutter app
├── test/                        # Unit and widget tests
├── pubspec.yaml                 # Project dependencies and asset declarations
└── README.md                    # This readme file
```
## File Details
1. lib/main.dart: This is the entry point of the application. It initializes the app and routes to the MemberScreen.

2. lib/member.dart: Contains the Member class, which defines the properties of each member, including their name, current location (as LatLng coordinates), and attendance 
   records.

3. lib/member_screen.dart: Displays a list of members, each with two actions:
    a. View location and route traveled.
    b. View and manage attendance.
   
4. lib/location_screen.dart: Displays the current location and route traveled on Google Maps, with a timeline view of all visited locations. The map shows the start/stop 
   points and indicates stop times on the route.

5. lib/attendance_screen.dart: Handles attendance data for each member, allowing the user to view and manage attendance records.

 ## Steps to Run the Project:
	1.	Create a new Flutter project in Android Studio.
	2.	Place the above code files into the lib/ folder of your project.
	3.	Install the required dependencies (google_maps_flutter, flutter_polyline_points, etc.) in your pubspec.yaml.
	4.	Run the project on an Android device or emulator.
    NOTE : Make sure that you have installed the flutter and dart in your system.

 ## SCREENSHOTS
   1. ![image](https://github.com/user-attachments/assets/0a35d087-c9e1-4fc5-a71f-e8de5fbe792f)
   2. ![image](https://github.com/user-attachments/assets/00ae6069-bed0-431c-a4e1-47da3dbdf647)
   3. ![image](https://github.com/user-attachments/assets/68698709-004c-469b-adbc-b3a3732f7292)
   4. ![image](https://github.com/user-attachments/assets/48ea81f1-8a0f-4699-a620-c2b450bcacec)
   5. ![image](https://github.com/user-attachments/assets/6d1cdcb3-4da9-43d8-8808-670414636054)
   6. ![image](https://github.com/user-attachments/assets/0f191295-c0b7-421f-bbbd-bbbec3da5ba3)

```
FOR INSTALLATION OF FLUTTER AND DART IN ANDROID STUDIO REFER - https://youtu.be/BqHOtlh3Dd4?si=TsazyUifsAXCVEAJ
For help getting started with Flutter development, view thE online documentation-https://docs.flutter.dev/,
which offers tutorials,samples, guidance on mobile development, and a full API reference.
```
