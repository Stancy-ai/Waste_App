// ignore_for_file: unnecessary_new, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, import_of_legacy_library_into_null_safe, avoid_web_libraries_in_flutter, unused_import

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GetLocation extends StatefulWidget {
  const GetLocation({Key? key,this.username}) : super(key: key);
final String? username;
  @override
  State<GetLocation> createState() => _GetLocationState();
}

class _GetLocationState extends State<GetLocation> {
  Position? _currentPosition;
  String? _currentAddress;
  bool isLoading = false;

  Future<Position> _getPosition() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location not available');
      }
    } else {
      print('Location not available');
    }

    return await Geolocator.getCurrentPosition();
  }

  void _getAddress(latitude, longitude) async {
    try {
      List<Placemark> placemark = await GeocodingPlatform.instance
          .placemarkFromCoordinates(latitude, longitude);
      Placemark place = placemark[0];
      setState(() {
        _currentAddress =
            "${place.locality}, ${place.street}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(27, 51, 51, 1),
        leading: CircleAvatar(
          backgroundColor: Color.fromRGBO(0, 204, 255, 1),
          child: Text(
            'S',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text(
              'Hi',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              widget.username!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
      body: Padding(

        padding: const EdgeInsets.symmetric(
          horizontal: 80,
        ),
        child: GestureDetector(
          onTap: () async {
            setState(() {
              isLoading = true;
            });
            _currentPosition = await _getPosition();
            _getAddress(_currentPosition!.latitude, _currentPosition!.longitude);
    
            setState(() {
              isLoading = false;
            });
          },
          child: Center(
            child: isLoading
                ? CircularProgressIndicator()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (_currentAddress != null) Icon(Icons.location_on),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Text(
                          '''Click here to automatically                                         detect your current location''',
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                      Text(
                        _currentAddress?.toString() ?? '',
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
