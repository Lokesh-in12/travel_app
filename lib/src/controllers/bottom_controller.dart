import 'package:get/get.dart';

class BottomController extends GetxController {
  RxInt position = 0.obs;

  void setPosition(int index) {
    position.value = index;
  }
}
