import 'package:get/get.dart';
import 'package:travel_app/src/models/hotel_model.dart';
import 'package:travel_app/src/services/rapidapi/hotels_services.dart';

class HotelsController extends GetxController {
  // ignore: non_constant_identifier_names
  RxList<HotelModel> Hotels = <HotelModel>[].obs;

  final HotelServices hotelServices = HotelServices();

  Future<void> handleHotels(String query) async {
    List<HotelModel>? hotelsList = await hotelServices.getHotels(query);
    if (hotelsList != null) {
      Hotels.value = hotelsList;
    } else {
      Hotels.value = [];
    }
  }
}
