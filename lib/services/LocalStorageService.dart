import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalStorageService {
  static late Box _box;

  static Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox('offline_data');
  }

  static void saveData(String key, dynamic value) {
    _box.put(key, value);
  }

  static dynamic getData(String key) {
    return _box.get(key);
  }
}
