import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:userlist_app/core/services/implementations/dio_network_service.dart';
import 'package:userlist_app/features/user/data/models/user_model.dart';
import 'package:userlist_app/features/user/data/repositories/interfaces/user_repository.dart';
import 'package:userlist_app/features/user/domain/entities/adapters/user_adapter.dart';
import 'package:userlist_app/features/user/domain/entities/user.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl(this.networkService);

  final DioNetworkService networkService;

  @override
  Future<List<User>?> getUserList({
    required int page,
    required int limit,
  }) async {
    try {
      final response = await networkService.get(
        'users',
        queryParameters: {'limit': limit, 'page': page},
      );
      if (response.statusCode == 200) {
        final result = UserResponseNetworkModel.fromJson(
          response.data as Map<String, dynamic>,
        );
        return result.users.map((user) => user.toEntity()).toList();
      } else {
        throw Exception('status code ${response.statusCode}');
      }
    } on Exception catch (ex) {
      log('UserRepository getUserList error: $ex');
      return null;
    }
  }
}
