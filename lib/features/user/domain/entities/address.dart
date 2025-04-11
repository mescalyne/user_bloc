import 'package:userlist_app/features/user/domain/entities/coordinate.dart';

class Address {
  Address({
    required this.address,
    required this.city,
    required this.state,
    required this.stateCode,
    required this.postalCode,
    required this.country,
    this.coordinates,
  });

  final String address;
  final String city;
  final String state;
  final String stateCode;
  final String postalCode;
  final Coordinates? coordinates;
  final String country;
}
