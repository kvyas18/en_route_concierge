import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:en_route_concierge/widgets/app_drawer.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  LatLng? myLocation;
  List<Marker> _markers = [
    Marker(
      width: 60.0,
      height: 60.0,
      point: LatLng(51.32, -0.083),
      child: Image.asset("assets/images/luxury-car.png", width: 60.0, height: 60.0),
    ),
    Marker(
      width: 60.0,
      height: 60.0,
      point: LatLng(51.3, -0.08),
      child: Image.asset("assets/images/luxury-car.png", width: 60.0, height: 60.0),
    ),
    Marker(
      width: 60.0,
      height: 60.0,
      point: LatLng(51.29, -0.077),
      child: Image.asset("assets/images/luxury-car.png", width: 60.0, height: 60.0),
    ),
  ];

  @override
  void initState() {
    super.initState();
    getMyLocation();
  }

  Future<void> getMyLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.always && permission != LocationPermission.whileInUse) {
        print('Location permission denied');
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    setState(() {
      myLocation = LatLng(position.latitude, position.longitude);
      _markers.add(
        Marker(
          width: 60.0,
          height: 60.0,
          point: myLocation!,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.person_pin_circle, size: 30.0, color: Colors.blue),
              SizedBox(width: 4),
              Text("Pick Up Here"),
            ],
          ),
        ),
      );
    });

    print(position);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: AppDrawer(),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  FlutterMap(
                    options: MapOptions(
                      center: LatLng(51.3, -0.08),
                      zoom: 13.0,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate: "https://cartodb-basemaps-{s}.global.ssl.fastly.net/light_all/{z}/{x}/{y}.png",
                        subdomains: ['a', 'b', 'c'],
                      ),
                      MarkerLayer(markers: _markers),
                    ],
                  ),

                  // App bar (menu)
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Builder(
                      builder: (BuildContext context) {
                        return IconButton(
                          icon: Icon(Icons.menu, size: 35.0),
                          onPressed: () => Scaffold.of(context).openDrawer(),
                        );
                      },
                    ),
                  ),

                  
                ],
              ),
            ),

            // Bottom panel
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 10,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(context).viewPadding.bottom + 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.95),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 10),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Where are you going to?", style: theme.textTheme.titleLarge),
                  SizedBox(height: 10),
                  Text("Book on demand or pre-scheduled rides", style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 15),
                  InkWell(
                    onTap: () {},
                    child: Hero(
                      tag: "search",
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Enter Destination",
                                style: TextStyle(color: Colors.grey[600], fontSize: 16),
                              ),
                            ),
                            Icon(Icons.search, color: theme.primaryColor),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
