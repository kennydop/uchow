import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uchow/interfaces/interfaces.dart';

class SecureStorage {
  static SecureStorage _instance = SecureStorage._internal();
  SecureStorage._internal() {
    _instance = this;
  }
  factory SecureStorage() => _instance;

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  final _secureStorage = const FlutterSecureStorage();

  Future<void> write(StorageItem newItem) async {
    await _secureStorage.write(
        key: newItem.key, value: newItem.value, aOptions: _getAndroidOptions());
  }

  Future<String?> read(String key) async {
    var readData =
        await _secureStorage.read(key: key, aOptions: _getAndroidOptions());
    return readData;
  }

  Future<void> delete(String key) async {
    await _secureStorage.delete(key: key, aOptions: _getAndroidOptions());
  }

  Future<bool> contains(String key) async {
    var containsKey = await _secureStorage.containsKey(
        key: key, aOptions: _getAndroidOptions());
    return containsKey;
  }

  Future<List<StorageItem>> readAll() async {
    var allData = await _secureStorage.readAll(aOptions: _getAndroidOptions());
    List<StorageItem> list = allData.entries
        .map((e) => StorageItem(key: e.key, value: e.value))
        .toList();
    return list;
  }

  Future<void> deleteAll() async {
    await _secureStorage.deleteAll(aOptions: _getAndroidOptions());
  }
}
