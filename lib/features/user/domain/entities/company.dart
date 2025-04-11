import 'package:userlist_app/features/user/domain/entities/address.dart';

class Company {
  Company({this.department, this.name, this.title, this.address});

  final String? department;
  final String? name;
  final String? title;
  final Address? address;
}
