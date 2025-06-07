import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:en_route_concierge/widgets/app_drawer.dart';
import 'package:latlong2/latlong.dart'; // use latlong2 instead of latlong
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
      child: Image.asset(
          "assets/images/car2.png",
          width: 60.0,
          height: 60.0,
        ),
      ),
    Marker(
      width: 60.0,
      height: 60.0,
      point: LatLng(51.3, -0.08),
      child: Image.asset(
          "assets/images/car2.png",
          width: 60.0,
          height: 60.0,
        ),
      ),
    Marker(
      width: 60.0,
      height: 60.0,
      point: LatLng(51.29, -0.077),
      child: Image.asset(
          "assets/images/car2.png",
          width: 60.0,
          height: 60.0,
        ),
      ),

  ];

  @override
  void initState() {
    super.initState();
    getMyLocation();
  }

  Future<void> getMyLocation() async {
    // Request permission if needed
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.always &&
          permission != LocationPermission.whileInUse) {
        print('Location permission denied');
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      myLocation = LatLng(position.latitude, position.longitude);
      _markers.add(
        Marker(
          width: 60.0,
          height: 60.0,
          point: myLocation!,
          child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.person_pin_circle,
                  size: 30.0,
                  color: Colors.blue,
                ),
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
    final ThemeData _theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: AppDrawer(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height - 230.0,
                  child: FlutterMap(
                    options: MapOptions(
                      center: LatLng(51.3, -0.08),
                      zoom: 13.0,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                        "https://cartodb-basemaps-{s}.global.ssl.fastly.net/light_all/{z}/{x}/{y}.png",
                        subdomains: ['a', 'b', 'c'],
                      ),
                      MarkerLayer(markers: _markers),
                    ],
                  ),
                ),
                Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: Icon(
                        Icons.menu,
                        size: 35.0,
                      ),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    );
                  },
                ),
              ],
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.15),
                      blurRadius: 25.0,
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      "Where are you going to?",
                      style: _theme.textTheme.titleLarge,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "Book on demand or pre-scheduled rides",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15.0),
                    InkWell(
                      onTap: () {},
                      child: Hero(
                        tag: "search",
                        child: Container(
                          height: 50.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "Enter Destination",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.search,
                                color: _theme.primaryColor,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
