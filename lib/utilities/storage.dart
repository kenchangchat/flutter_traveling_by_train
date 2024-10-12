
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  final storage = new FlutterSecureStorage();

  Future<void> setStorage(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  Future<void> setAuthList(dataList) async {
    await dataList.forEach(
        (key, value) => {setStorage(key.toString(), value.toString())});
  }

  Future<Map> getAuthList() async {
    Map<String, String> allValues = await storage.readAll();
    return allValues;
  }

  Future<String?> read(String _key) async {
    String? allValues = await storage.read(key: _key);
    return allValues;
  }

  Future<void> deleteAll() async {
    await storage.deleteAll();
  }
}
