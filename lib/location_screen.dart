//new code
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/FlutterMap.dart';
// import 'package:flutter_map/flutter_map.dart';
import 'member.dart';
import 'route_screen.dart';

class LocationScreen extends StatefulWidget {
  final Member member;

  LocationScreen({required this.member});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  GoogleMapController? _mapController;
  Set<Marker> _markers = {};
  List<LatLng> visitedLocations = [];
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _initializeLocations();
    _createMarkers();
  }

  // Initialize visited locations (for demo purposes)
  void _initializeLocations() {
    visitedLocations = [
      LatLng(37.42796133580664, -122.085749655962),
      LatLng(37.42996133580664, -122.083749655962),
      LatLng(37.42696133580664, -122.080749655962),
    ];
  }

  // Create markers for visited locations
  void _createMarkers() {
    setState(() {
      for (var location in visitedLocations) {
        _markers.add(
          Marker(
            markerId: MarkerId(location.toString()),
            position: location,
            infoWindow: InfoWindow(title: 'Visited Location'),
          ),
        );
      }
    });
  }

  // Select date for past data
  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        // TODO: Fetch locations for the selected date
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location for ${widget.member.name}'),
      ),
      body: Column(
        children: [
          // Map showing current and visited locations

          // Expanded(
          //   child: GoogleMap(
          //     onMapCreated: (GoogleMapController controller) {
          //       _mapController = controller;
          //     },
          //     initialCameraPosition: CameraPosition(
          //       target: widget.member.currentLocation,
          //       zoom: 14.0,
          //     ),
          //     markers: _markers,
          //   ),
          // ),
          // // Date filter and timeline
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       ElevatedButton(
          //         onPressed: () => _selectDate(context),
          //         child: Text('Select Date'),
          //       ),
          //       Text("Selected Date: ${selectedDate.toLocal()}".split(' ')[0]),
          //     ],
          //   ),
          // ),
          Expanded(child: MyApp()),

          // Display visited locations as a timeline
          Expanded(
            child: ListView.builder(
              itemCount: visitedLocations.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Visited Location ${index + 1}'),
                  subtitle: Text(
                      'Lat: ${visitedLocations[index].latitude}, Lng: ${visitedLocations[index].longitude}'),
                  trailing: Icon(Icons.directions),
                  onTap: () {
                    // Navigate to route screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RouteScreen(
                          startLocation: visitedLocations.first,
                          stopLocation: visitedLocations[index],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
