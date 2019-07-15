import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:floating_bubble/floating_bubble.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();
  Geolocator geolocator = Geolocator();
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  Position userLocation;
    final InputDecoration decoration = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserLocation().then((position) {
      userLocation = position;
    });
  }

  Future<Position> locateUser() async {
    return Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  final Set<Marker> _markers = {};
  LatLng _center ;

  static const LatLng _center1 = const LatLng(45.521563, -122.677433);

  LatLng _lastMapPosition = _center1;

  MapType _currentMapType = MapType.normal;

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Really cool place',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }
  TextEditingController _textFieldController = TextEditingController();
   _onClear() {
    setState(() {
      _textFieldController.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      bottomSheet: Container(
        height: 300,
        decoration: BoxDecoration(
          color: Colors.black
        ),
        child: Column(

        ),
      ),
        drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.orange),
              accountName: Text("Francielly Charleaux"),
              accountEmail: Row(
                children: <Widget>[
                  Text("5.0"),
                  Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 12,
                  )
                ],
              ),
              currentAccountPicture: ClipOval(
                child: Image.asset(
                  "../assets/images/pp.jpg",
                  width: 10,
                  height: 10,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  linkMenuDrawer('Ver amigas proximas', () {
                    Navigator.pushNamed(context, '/payment');
                  }),
                  linkMenuDrawer('Chats com amigas', () {
                    Navigator.pushNamed(context, '/your_trip');
                  }),
                  linkMenuDrawer('Compartilhe e ganhe', () {
                    Navigator.pushNamed(context, '/free_rides');
                  }),
                  linkMenuDrawer('Ajuda', () {
                    Navigator.pushNamed(context, '/help');
                  }),
                  linkMenuDrawer('Configurações', () {
                    Navigator.pushNamed(context, '/settings');
                  }),
                  /*Divider(
                    color: Colors.black45,
                  ),
                  linkMenuDrawer('Drive With Uber', () {}),
                  linkMenuDrawer('Legal', () {}),*/
                ]),
          ],
        ),
      ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 16.0,
              ),
              mapType: _currentMapType,
              markers: _markers,
              onCameraMove: _onCameraMove,
              myLocationButtonEnabled: true,
              scrollGesturesEnabled: true,
              tiltGesturesEnabled: true,
              rotateGesturesEnabled: true,
              myLocationEnabled: true,
              compassEnabled: true,
              zoomGesturesEnabled: true,        
            ),
            Positioned(
            top: 100.0,
            right: 15.0,
            left: 15.0,
            child: Container(
              height: 50.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1.0, 5.0),
                      blurRadius: 15,
                      spreadRadius: 3)
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  icon: Container(margin: EdgeInsets.only(left: 20, top: 18), width: 10, height: 10, decoration: BoxDecoration(color: Colors.black)),
                  hintText: "Aonde você quer ir?",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15.0, top: 16.0),
                  // suffix: IconButton(
                  //   icon: Icon(Icons.cancel),
                  //   onPressed: _onClear,
                  // ),
                ),
              ),
            ),
          ),
          Positioned(
              top: 30,
              left: 6,
              child: IconButton(
                icon: Icon(Icons.menu),
                color: Colors.black,
                onPressed: () {
                  _scaffoldKey.currentState.openDrawer();
                },
              )),
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Align(
            //     alignment: Alignment.topRight,
            //     child: Column(
            //       children: <Widget> [
            //         FloatingActionButton(
            //           onPressed: _onMapTypeButtonPressed,
            //           materialTapTargetSize: MaterialTapTargetSize.padded,
            //           backgroundColor: Colors.green,
            //           child: const Icon(Icons.map, size: 36.0),
            //         ),
            //         SizedBox(height: 16.0),
            //         FloatingActionButton(
            //           onPressed: _onAddMarkerButtonPressed,
            //           materialTapTargetSize: MaterialTapTargetSize.padded,
            //           backgroundColor: Colors.green,
            //           child: const Icon(Icons.add_location, size: 36.0),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }


  getUserLocation() async {
    userLocation = await locateUser();
    setState(() {
      _center = LatLng(userLocation.latitude, userLocation.longitude);
    });
    print('center $_center');
  }

  Widget linkMenuDrawer(String title, Function onPressed) {
  return InkWell(
    onTap: onPressed,
    splashColor: Colors.black,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 13, horizontal: 15),
      width: double.infinity,
      child: Text(
        title,
        style: TextStyle(fontSize: 15.0),
      ),
    ),
  );
}


}
