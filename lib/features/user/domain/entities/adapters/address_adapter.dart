
import 'package:userlist_app/features/user/data/models/address_model.dart';
import 'package:userlist_app/features/user/domain/entities/adapters/coordinates_adapter.dart';
import 'package:userlist_app/features/user/domain/entities/address.dart';

extension AddressAdapter on AddressNetworkModel {
  Address toEntity() {
    return Address(
      address: address,
      city: city,
      state: state,
      stateCode: stateCode,
      postalCode: postalCode,
      coordinates: coordinates?.toEntity(),
      country: country,
    );
  }
}
