import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:travel_app/src/models/popular_hotel_model.dart';
import 'package:travel_app/src/services/rapidapi/hotels_services.dart';

class HotelsController extends GetxController {
  // ignore: non_constant_identifier_names
  RxList<PopularHotelModel> Hotels = <PopularHotelModel>[].obs;
  // ignore: non_constant_identifier_names
  RxList<PopularHotelModel> TabHotels = <PopularHotelModel>[].obs;

  // ignore: non_constant_identifier_names
  RxList<PopularHotelModel> SingleHotel = <PopularHotelModel>[].obs;

  RxBool isLoading = false.obs;

  final HotelServices hotelServices = HotelServices();

  Future<void> fetchAllHotels() async {
    try {
      isLoading(true);
      List<PopularHotelModel>? data = await hotelServices.getPopularHotels();
      if (kDebugMode) {
        print("allhotelsData => is $data");
      }
      if (data != null) {
        Hotels.value = data;
      } else {
        Hotels.value = [];
      }
    } catch (e) {
      isLoading(false);
      if (kDebugMode) {
        print("err in fetchAllHotels =>> $e");
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> handleTabHotels(String cityName) async {
    try {
      if (kDebugMode) {
        print("search city => $cityName");
      }
      isLoading(true);
      if (kDebugMode) {
        print(Hotels.where((e) => e.city == cityName));
      }
      List<PopularHotelModel> data =
          Hotels.where((element) => element.city == cityName).toList();
      if (kDebugMode) {
        print("filtered data= > $data");
      }
      TabHotels.value = data;
      if (kDebugMode) {
        print("tabs hotels loaded successfully => $TabHotels");
      }
    } catch (e) {
      isLoading(false);
      if (kDebugMode) {
        print("err in handleTabHotels =>> $e ");
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> handleSingleHotel(String id) async {
    List<PopularHotelModel> data =
        Hotels.where((elem) => elem.id == int.parse(id)).toList();
    SingleHotel.value = data;

    if (kDebugMode) {
      print("one data is =>>> $data");
    }
  }
}
