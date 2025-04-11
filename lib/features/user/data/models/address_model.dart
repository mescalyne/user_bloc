import 'package:userlist_app/features/user/data/models/coordinates_model.dart';

class AddressNetworkModel {
  AddressNetworkModel({
    required this.address,
    required this.city,
    required this.state,
    required this.stateCode,
    required this.postalCode,
    required this.coordinates,
    required this.country,
  });
  factory AddressNetworkModel.fromJson(Map<String, dynamic> json) {
    return AddressNetworkModel(
      address: json['address'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      stateCode: json['stateCode'] as String,
      postalCode: json['postalCode'] as String,
      coordinates:
          json['coordinates'] == null
              ? null
              : CoordinatesNetworkModel.fromJson(
                json['coordinates'] as Map<String, dynamic>,
              ),
      country: json['country'] as String,
    );
  }

  final String address;
  final String city;
  final String state;
  final String stateCode;
  final String postalCode;
  final CoordinatesNetworkModel? coordinates;
  final String country;

  AddressNetworkModel copyWith({
    String? address,
    String? city,
    String? state,
    String? stateCode,
    String? postalCode,
    CoordinatesNetworkModel? coordinates,
    String? country,
  }) {
    return AddressNetworkModel(
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      stateCode: stateCode ?? this.stateCode,
      postalCode: postalCode ?? this.postalCode,
      coordinates: coordinates ?? this.coordinates,
      country: country ?? this.country,
    );
  }

  @override
  String toString() {
    return '$address, $city, $state, $stateCode, $postalCode, $country';
  }
}
