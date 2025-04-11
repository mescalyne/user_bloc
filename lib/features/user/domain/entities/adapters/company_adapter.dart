import 'package:userlist_app/features/user/data/models/company_model.dart';
import 'package:userlist_app/features/user/domain/entities/adapters/address_adapter.dart';
import 'package:userlist_app/features/user/domain/entities/company.dart';

extension CompanyAdapter on CompanyNetworkModel {
  Company toEntity() {
    return Company(
      department: department,
      name: name,
      title: title,
      address: address?.toEntity(),
    );
  }
}
