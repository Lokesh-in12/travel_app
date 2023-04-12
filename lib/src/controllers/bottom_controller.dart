import 'package:dio/dio.dart';
import 'package:get/get.dart';

class BottomController extends GetxController {
  final position = 0.obs;
  final Dio dio;
  BottomController(this.dio);

  void setPosition(int index) {
    position.value = index;
  }
}
