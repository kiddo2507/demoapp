import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  Set<Marker> _markers = {};

  Marker _origin = const Marker(
    markerId: MarkerId('Current location'),
  );
  Marker _destination = const Marker(
    markerId: MarkerId('On tap location'),
  );

  late GoogleMapController mapController;

  final LatLng _center = const LatLng(28.5355, 77.3910);

  final Location _locationTracker = Location();

  late StreamSubscription _locationSubscription;

  late BottomNavigationBarItem items;

  Future<Uint8List> getMarker() async {
    ByteData byteData =
        await DefaultAssetBundle.of(context).load("assets/current.jpg");
    return byteData.buffer.asUint8List();
  }

  // void updateMarker(LocationData newLocalData, Uint8List imageData) {
  //   LatLng latlng = LatLng(
  //       newLocalData.latitude as double, newLocalData.longitude as double);
  //   setState(() {
  //     _markers = Marker(
  //         markerId: const MarkerId("Current Location"),
  //         position: latlng,
  //         draggable: false,
  //         flat: true,
  //         anchor: const Offset(0.5, 0.5),
  //         icon: BitmapDescriptor.fromBytes(imageData)) as Set<Marker>;
  //   });
  // }

  // void getCurrentLocation() async {
  //   try {
  //     Uint8List imageData = await getMarker();
  //     var location = await _locationTracker.getLocation();

  //     updateMarker(location, imageData);

  //     _locationSubscription.cancel();

  //     _locationSubscription =
  //         _locationTracker.onLocationChanged.listen((newLocalData) {
  //       mapController.animateCamera(CameraUpdate.newCameraPosition(
  //           CameraPosition(
  //               bearing: 192.8334901395799,
  //               target: LatLng(newLocalData.latitude as double,
  //                   newLocalData.longitude as double),
  //               tilt: 0,
  //               zoom: 18.00)));
  //       updateMarker(newLocalData, imageData);
  //     });
  //   } on PlatformException catch (e) {
  //     if (e.code == 'PERMISSION_DENIED') {
  //       debugPrint("Permission Denied");
  //     }
  //   }
  // }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(
        Marker(
          markerId: const MarkerId('id-1'),
          position: _center,
          infoWindow:
              const InfoWindow(title: 'Noida', snippet: 'A place in NCR'),
        ),
      );
    });
  }

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(28.5355, 77.3910),
    zoom: 11.5,
  );

  @override
  void dispose() {
    _locationSubscription.cancel();
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Google Maps'),
        actions: [
          if (_origin != null)
            TextButton(
              onPressed: () => mapController.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                      target: _origin.position, zoom: 15, tilt: 50.0),
                ),
              ),
              child: const Text('Your Location'),
              style: TextButton.styleFrom(
                primary: Colors.green,
                textStyle: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          if (_destination != null)
            TextButton(
              onPressed: () => mapController.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                      target: _destination.position, zoom: 15, tilt: 50.0),
                ),
              ),
              child: const Text('Tapped location'),
              style: TextButton.styleFrom(
                primary: Colors.green,
                textStyle: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
        ],
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: {
          if (_center != null) _origin,
          if (_destination != null) _destination
        },
        onLongPress: _addMarker,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        //   initialCameraPosition: const CameraPosition(
        //     target: LatLng(28.5355, 77.3910),
        //     zoom: 15.0,
        //   ),
        // ),
        initialCameraPosition: _initialCameraPosition,
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(
      //     Icons.location_searching,
      //   ),
      //   onPressed: () => getCurrentLocation(),
      // ),
    );
  }

  void _addMarker(LatLng pos) {
    if ((_origin == null) || (_origin != null)) {
      setState(() {
        _origin = Marker(
          markerId: const MarkerId('Origin'),
          infoWindow: const InfoWindow(title: 'Your location'),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: pos,
        );
        _destination = null as Marker;
      });
    } else {
      setState(() {
        _destination = Marker(
            markerId: const MarkerId('Tapped location'),
            infoWindow: const InfoWindow(title: 'The tapped location'),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            position: pos);
      });
    }
    ;
  }
}
