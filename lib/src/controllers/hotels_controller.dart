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
  RxInt Page = 1.obs;
  RxInt TotalDataLength = 0.obs;

  final HotelServices hotelServices = HotelServices();

  Future<void> setTotalLength() async {
    int? length = await hotelServices.totalLengthOfData();
    if (length != null) {
      TotalDataLength.value = length;
    } else {
      TotalDataLength.value = 0;
    }
  }

  Future<void> fetchAllHotels() async {
    try {
      List<PopularHotelModel>? data =
          await hotelServices.getPopularHotels(Page);
      if (kDebugMode) {
        print("allhotelsData => is $data");
      }
      if (data != null) {
        Hotels.addAll(data);
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
    print("ciyName in controller = > $cityName");
    try {
      isLoading(true);
      List<PopularHotelModel>? data =
          await hotelServices.getHotelByCity(cityName);
      if (data != null) {
        TabHotels.value = data;
      }
      if (data == []) {
        print("No data received");
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
