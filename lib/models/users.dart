class UserLocation {
  final String id;
  final String name;
  final String avatar;
  final double latitude;
  final double longitude;
  final String place;
  final List<Street> street; // Updated to List<Street>

  UserLocation({
    required this.id,
    required this.name,
    required this.avatar,
    required this.latitude,
    required this.longitude,
    required this.place,
    required this.street

  });

  factory UserLocation.fromJson(Map<String, dynamic> json) {
    return UserLocation(
      id: json['id'],
      name: json['name'],
      avatar: json['avatar'],
      latitude: json['latitude'] ?? 0.0,
      longitude: json['longitude'] ?? 0.0,
      place: json['place'],
      street: (json['street'] as List<dynamic>?)
          ?.map((streetJson) => Street.fromJson(streetJson))
          .toList() ?? [],
    );
  }
}

  class Street {
  final String name;
  final String time;

  Street({required this.name, required this.time});

  factory Street.fromJson(Map<String, dynamic> json) {
  return Street(
  name: json['name'],
  time: json['time'],
  );
  }
  }

