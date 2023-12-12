import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:locator/bloc/repository/user_location_state.dart';
import 'dart:convert';

import 'package:locator/models/users.dart';
import 'package:locator/services/app_urls.dart';

class UserLocationCubit extends Cubit<UserLocationState> {
  UserLocationCubit() : super(LocationInitial());

//Fetch the payload from api
  Future<void> fetchUserLocation() async {
    try {
      String url = AppUrl.devBaseURL;


      http.Response response =
      await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        List<UserLocation> userLocations = data
            .map((json) => UserLocation.fromJson(json))
            .toList(); // Map each item in the list to UserLocation

        List<Marker> markers = [];
        for (var location in data) {
          double latitude = location['latitude'];
          double longitude = location['longitude'];

          markers.add(
            Marker(
              markerId: MarkerId(location['id']),
              position: LatLng(latitude, longitude),
              infoWindow: InfoWindow(
                title: location['name'],
                snippet: location['place'],
              ),
              // icon: BitmapDescriptor.defaultMarker
              icon: await getMarkerIcon(location['avatar'], width: 20, height: 20),
            ),
          );
        }

        emit(LocationLoaded(userLocation: userLocations, markers: markers));
      } else {
        print(" second Failed");
        emit(LocationError(message: 'Failed to load user location'));
      }
    } catch (e) {
      print(" last Failed");

      emit(LocationError(message: 'An error occurred: $e'));
    }
  }


// GOOGLE MARGKER ICON TO BITMAP
  Future<BitmapDescriptor> getMarkerIcon(String avatarUrl,{double width = 20, double height = 20} ) async {
    try {
      final Uint8List markerIconBytes = await getBytesFromUrl(avatarUrl, width: width.toInt(), height: height.toInt());
      return BitmapDescriptor.fromBytes(markerIconBytes, size: Size(20, 20));

    } catch (e) {
      // Handle errors...
      print('Error loading marker icon: $e');
      // Return a default icon or handle the error case accordingly
      return BitmapDescriptor.defaultMarker;
    }
  }

  Future<Uint8List> getBytesFromUrl(String url, {required int width, required int height}) async {
    final http.Response response = await http.get(Uri.parse(url));
    return response.bodyBytes;
  }
}