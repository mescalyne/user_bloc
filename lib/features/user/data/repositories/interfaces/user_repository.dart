import 'package:userlist_app/features/user/domain/entities/user.dart';

abstract class UserRepository {
  Future<List<User>?> getUserList({required int page, required int limit});
}
