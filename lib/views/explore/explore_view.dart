import 'dart:async';
import 'dart:developer';

import 'package:care_connect/utils/routes/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.terrain,
        initialCameraPosition: _kGooglePlex,
        // myLocationButtonEnabled: true,
        // myLocationEnabled: true,
        compassEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: Set<Marker>.of(_markers),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // var checkPermission = await Geolocator.checkPermission();
          // log("permission ${checkPermission.index}");
          UtilsClass.getCurrentLocation().then((value) async {
            log("my current location is : ${value.latitude} lat , ${value.longitude} lon");

            // Create a new marker
            var newMarker = Marker(
                markerId: const MarkerId("1"),
                position: LatLng(value.latitude, value.longitude),
                infoWindow: const InfoWindow(title: "My Location"));

            // Add the new marker to the list of markers
            _markers.add(newMarker);

            CameraPosition cameraPosition = CameraPosition(
                target: LatLng(value.latitude, value.longitude), zoom: 14);
            final GoogleMapController controller = await _controller.future;
            controller
                .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
            setState(() {});
          });
        },
        child: const Icon(Icons.directions_boat),
      ),
    );
  }

  // ignore: unused_element
  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  final List<Marker> _markers = <Marker>[];
}
