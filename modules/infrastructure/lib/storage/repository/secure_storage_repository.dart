abstract class SecureStorageRepository {
  Future<void> saveObject(String key, String token);
  Future<String?> getObject();
  Future<void> deleteObject(String key);
}
