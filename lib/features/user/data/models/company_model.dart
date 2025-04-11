import 'package:userlist_app/features/user/data/models/address_model.dart';

class CompanyNetworkModel {
  CompanyNetworkModel({
    required this.department,
    required this.name,
    required this.title,
    required this.address,
  });
  factory CompanyNetworkModel.fromJson(Map<String, dynamic> json) {
    return CompanyNetworkModel(
      department: json['department'] as String?,
      name: json['name'] as String?,
      title: json['title'] as String?,
      address:
          json['address'] == null
              ? null
              : AddressNetworkModel.fromJson(
                json['address'] as Map<String, dynamic>,
              ),
    );
  }

  final String? department;
  final String? name;
  final String? title;
  final AddressNetworkModel? address;

  CompanyNetworkModel copyWith({
    String? department,
    String? name,
    String? title,
    AddressNetworkModel? address,
  }) {
    return CompanyNetworkModel(
      department: department ?? this.department,
      name: name ?? this.name,
      title: title ?? this.title,
      address: address ?? this.address,
    );
  }

  @override
  String toString() {
    return '$department, $name, $title, $address';
  }
}
