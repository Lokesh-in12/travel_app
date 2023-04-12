import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/src/controllers/bottom_controller.dart';
import 'package:travel_app/src/controllers/hotels_controller.dart';

class Injections {
  static void inject() {
    _injectDio();
    _injectControllers();
  }

  static void _injectDio() {
    final dio = Dio(BaseOptions());
    Get.lazyPut<Dio>(() => dio);
    debugPrint("Dio injected");
  }

  static void _injectControllers() {
    final dio = Get.find<Dio>();
    BottomController bottomController = Get.put(BottomController(dio));
    HotelsController hotelsController = Get.put(HotelsController());
    debugPrint("Controllers injected");
  }
}
