
class CoordinatesNetworkModel {
  CoordinatesNetworkModel({required this.lat, required this.lng});
  factory CoordinatesNetworkModel.fromJson(Map<String, dynamic> json) {
    return CoordinatesNetworkModel(
      lat: json['lat'] as double?,
      lng: json['lng'] as double?,
    );
  }

  final double? lat;
  final double? lng;

  CoordinatesNetworkModel copyWith({double? lat, double? lng}) {
    return CoordinatesNetworkModel(lat: lat ?? this.lat, lng: lng ?? this.lng);
  }

  @override
  String toString() {
    return '$lat, $lng, ';
  }
}
