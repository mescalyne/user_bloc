import 'package:userlist_app/features/user/data/models/user_model.dart';
import 'package:userlist_app/features/user/domain/entities/adapters/address_adapter.dart';
import 'package:userlist_app/features/user/domain/entities/adapters/bank_adapter.dart';
import 'package:userlist_app/features/user/domain/entities/adapters/company_adapter.dart';
import 'package:userlist_app/features/user/domain/entities/adapters/crypto_adapter.dart';
import 'package:userlist_app/features/user/domain/entities/user.dart';

extension UserAdapter on UserNetworkModel {
  User toEntity() {
    return User(
      id: id,
      firstName: firstName,
      lastName: lastName,
      maidenName: maidenName,
      age: age,
      gender: gender,
      email: email,
      phone: phone,
      username: username,
      password: password,
      birthDate: birthDate,
      image: image,
      ip: ip,
      address: address.toEntity(),
      macAddress: macAddress,
      university: university,
      bank: bank.toEntity(),
      company: company.toEntity(),
      ein: ein,
      ssn: ssn,
      userAgent: userAgent,
      crypto: crypto.toEntity(),
      role: role,
    );
  }
}
