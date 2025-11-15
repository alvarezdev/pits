import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:infrastructure/storage/repository/secure_storage_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SecureStorageRepository)
class SecureStorageImpl implements SecureStorageRepository {
  final FlutterSecureStorage _storage;

  SecureStorageImpl({
    required FlutterSecureStorage flutterSecureStorage,
  }) : _storage = flutterSecureStorage;


  @override
  Future<void> saveObject(String key, String token) async {
    await _storage.write(key: key, value: token);
  }

  @override
  Future<String?> getObject() async {
    return await _storage.read(key: 'token');
  }

  @override
  Future<void> deleteObject(String key) async {
    await _storage.delete(key: key);
  }
}