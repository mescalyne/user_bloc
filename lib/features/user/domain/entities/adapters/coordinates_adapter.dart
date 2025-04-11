import 'package:userlist_app/features/user/data/models/coordinates_model.dart';
import 'package:userlist_app/features/user/domain/entities/coordinate.dart';

extension CoordinatesAdapter on CoordinatesNetworkModel {
  Coordinates toEntity() {
    return Coordinates(lat: lat, lng: lng);
  }
}
