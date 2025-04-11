import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:userlist_app/core/services/interfaces/storage_service.dart';

@Injectable(as: StorageService)
class SecureStorageService implements StorageService {
  final secureStorage = const FlutterSecureStorage();

  @override
  Future<void> clear() async {
    await secureStorage.deleteAll();
  }

  @override
  Future<bool> has(String key) async {
    return secureStorage.containsKey(key: key);
  }

  @override
  Future<bool> remove(String key) async {
    try {
      await secureStorage.delete(key: key);
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  @override
  Future<bool> set(String key, String data) async {
    try {
      await secureStorage.write(key: key, value: data);
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  @override
  Future<Object?> get(String key) async {
    try {
      await secureStorage.read(key: key);
      return true;
    } on Exception catch (_) {
      return false;
    }
  }
}
