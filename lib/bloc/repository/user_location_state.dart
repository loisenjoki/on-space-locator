

import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:locator/models/users.dart';


abstract class UserLocationState extends Equatable {
  const UserLocationState();

  @override
  List<Object> get props => [];
}

class LocationInitial extends UserLocationState {}

class LocationLoaded extends UserLocationState {
  final List<UserLocation> userLocation;
  final List<Marker> markers; // Processed data for markers


  LocationLoaded({
    required this.userLocation,
    required this.markers,

  });

  @override
  List<Object> get props => [userLocation];
}

class LocationError extends UserLocationState {
  final String message;

  LocationError({required this.message});

  @override
  List<Object> get props => [message];
}
