import 'package:flutter_app/controllers/AuthController.dart';
import 'package:flutter_app/services/LocalStorageService.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }

  static Future<void> init() async {
    await LocalStorageService.init();
  }
}
