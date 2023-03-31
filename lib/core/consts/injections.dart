import 'package:get/get.dart';
import 'package:travel_app/src/controllers/bottom_controller.dart';
import 'package:travel_app/src/controllers/hotels_controller.dart';

class Injections {
  BottomController bottomController = Get.put(BottomController());
  HotelsController hotelsController = Get.put(HotelsController());
}
