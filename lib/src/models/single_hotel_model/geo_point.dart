class GeoPoint {
  double? latitude;
  double? longitude;

  GeoPoint({this.latitude, this.longitude});

  factory GeoPoint.fromJson(Map<String, dynamic> json) => GeoPoint(
        latitude: (json['latitude'] as num?)?.toDouble(),
        longitude: (json['longitude'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
      };
}
