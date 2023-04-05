import 'package:flutter/cupertino.dart';
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

  RxList<PopularHotelModel> SearchHotels = <PopularHotelModel>[].obs;

  TextEditingController searchController = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool hasMoreData = true.obs;
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
        Hotels.length > TotalDataLength.value
            ? hasMoreData(false)
            : hasMoreData(true);
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
        isLoading(false);
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
    isLoading(true);
    print("id => $id");
    List<PopularHotelModel> data =
        Hotels.where((elem) => elem.id.toString() == id).toList();
    List<PopularHotelModel> alterData =
        TabHotels.where((elem) => elem.id.toString() == id).toList();
    List<PopularHotelModel> fromSearchArr =
        SearchHotels.where((elem) => elem.id.toString() == id).toList();

    SingleHotel.value = data.length != 0
        ? data
        : alterData.length != 0
            ? alterData
            : fromSearchArr.length != 0
                ? fromSearchArr
                : [];
  }

  Future<void> handleSeachHotel() async {
    try {
      if (searchController.text.trim().length != 0) {
        List<PopularHotelModel>? result = await hotelServices.getSearchHotels(
            searchController.text.trim(), TotalDataLength.value);
        print("res of searchHotel in contr => $result");
        if (result != null) {
          SearchHotels.value = result;
        } else {
          SearchHotels.value = [];
        }
      } else {
        print("kch to likh bhai");
        SearchHotels.value = [];
      }
    } catch (e) {
      print("err in handleSeachHotel => $e ");
    }
  }
}
