import 'package:userlist_app/features/user/data/models/address_model.dart';
import 'package:userlist_app/features/user/data/models/bank_model.dart';
import 'package:userlist_app/features/user/data/models/company_model.dart';
import 'package:userlist_app/features/user/data/models/crypto_model.dart';

class UserResponseNetworkModel {
  UserResponseNetworkModel({
    required this.users,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory UserResponseNetworkModel.fromJson(Map<String, dynamic> json) {
    return UserResponseNetworkModel(
      users:
          json['users'] == null
              ? []
              : List<UserNetworkModel>.from(
                (json['users'] as List).map(
                  (x) => UserNetworkModel.fromJson(x as Map<String, dynamic>),
                ),
              ),
      total: json['total'] as int?,
      skip: json['skip'] as int?,
      limit: json['limit'] as int?,
    );
  }

  final List<UserNetworkModel> users;
  final int? total;
  final int? skip;
  final int? limit;

  UserResponseNetworkModel copyWith({
    List<UserNetworkModel>? users,
    int? total,
    int? skip,
    int? limit,
  }) {
    return UserResponseNetworkModel(
      users: users ?? this.users,
      total: total ?? this.total,
      skip: skip ?? this.skip,
      limit: limit ?? this.limit,
    );
  }

  @override
  String toString() {
    return '$users, $total, $skip, $limit, ';
  }
}

class UserNetworkModel {
  UserNetworkModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.maidenName,
    required this.age,
    required this.gender,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
    required this.birthDate,
    required this.image,
    required this.ip,
    required this.address,
    required this.macAddress,
    required this.university,
    required this.bank,
    required this.company,
    required this.ein,
    required this.ssn,
    required this.userAgent,
    required this.crypto,
    required this.role,
  });
  factory UserNetworkModel.fromJson(Map<String, dynamic> json) {
    return UserNetworkModel(
      id: json['id'] as int,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      maidenName: json['maidenName'] as String,
      age: json['age'] as int,
      gender: json['gender'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      birthDate: json['birthDate'] as String,
      image: json['image'] as String,
      ip: json['ip'] as String,
      address: AddressNetworkModel.fromJson(
        json['address'] as Map<String, dynamic>,
      ),
      macAddress: json['macAddress'] as String,
      university: json['university'] as String,
      bank: BankNetworkModel.fromJson(json['bank'] as Map<String, dynamic>),
      company: CompanyNetworkModel.fromJson(
        json['company'] as Map<String, dynamic>,
      ),
      ein: json['ein'] as String,
      ssn: json['ssn'] as String,
      userAgent: json['userAgent'] as String,
      crypto: CryptoNetworkModel.fromJson(
        json['crypto'] as Map<String, dynamic>,
      ),
      role: json['role'] as String,
    );
  }

  final int id;
  final String firstName;
  final String lastName;
  final String maidenName;
  final int age;
  final String gender;
  final String email;
  final String phone;
  final String username;
  final String password;
  final String birthDate;
  final String image;
  final String ip;
  final AddressNetworkModel address;
  final String macAddress;
  final String university;
  final BankNetworkModel bank;
  final CompanyNetworkModel company;
  final String ein;
  final String ssn;
  final String userAgent;
  final CryptoNetworkModel crypto;
  final String role;

  UserNetworkModel copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? maidenName,
    int? age,
    String? gender,
    String? email,
    String? phone,
    String? username,
    String? password,
    String? birthDate,
    String? image,
    String? ip,
    AddressNetworkModel? address,
    String? macAddress,
    String? university,
    BankNetworkModel? bank,
    CompanyNetworkModel? company,
    String? ein,
    String? ssn,
    String? userAgent,
    CryptoNetworkModel? crypto,
    String? role,
  }) {
    return UserNetworkModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      maidenName: maidenName ?? this.maidenName,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      username: username ?? this.username,
      password: password ?? this.password,
      birthDate: birthDate ?? this.birthDate,
      image: image ?? this.image,
      ip: ip ?? this.ip,
      address: address ?? this.address,
      macAddress: macAddress ?? this.macAddress,
      university: university ?? this.university,
      bank: bank ?? this.bank,
      company: company ?? this.company,
      ein: ein ?? this.ein,
      ssn: ssn ?? this.ssn,
      userAgent: userAgent ?? this.userAgent,
      crypto: crypto ?? this.crypto,
      role: role ?? this.role,
    );
  }

  @override
  String toString() {
    return '$id, $firstName, $lastName, $maidenName, $age, $gender, $email, '
        '$phone, $username, $password, $birthDate, $image, $ip, $address, '
        '$macAddress, $university, $bank, $company, $ein, $ssn, $userAgent, '
        '$crypto, $role, ';
  }
}
