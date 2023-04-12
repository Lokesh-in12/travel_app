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

  // ignore: non_constant_identifier_names
  RxList<PopularHotelModel> SearchHotels = <PopularHotelModel>[].obs;

  TextEditingController searchController = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool hasMoreData = true.obs;
  // ignore: non_constant_identifier_names
  RxInt Page = 1.obs;
  // ignore: non_constant_identifier_names
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
        Hotels.shuffle();
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
    if (kDebugMode) {
      print("ciyName in controller = > $cityName");
    }
    try {
      TabHotels.clear();
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
    if (kDebugMode) {
      print("id => $id");
    }
    List<PopularHotelModel> data =
        Hotels.where((elem) => elem.id.toString() == id).toList();
    List<PopularHotelModel> alterData =
        TabHotels.where((elem) => elem.id.toString() == id).toList();
    List<PopularHotelModel> fromSearchArr =
        SearchHotels.where((elem) => elem.id.toString() == id).toList();

    SingleHotel.value = data.isNotEmpty
        ? data
        : alterData.isNotEmpty
            ? alterData
            : fromSearchArr.isNotEmpty
                ? fromSearchArr
                : [];
  }

  Future<void> handleSeachHotel() async {
    try {
      if (searchController.text.trim().isNotEmpty) {
        List<PopularHotelModel>? result = await hotelServices.getSearchHotels(
            searchController.text.trim(), TotalDataLength.value);
        if (kDebugMode) {
          print("res of searchHotel in contr => $result");
        }
        if (result != null) {
          SearchHotels.value = result;
        } else {
          SearchHotels.value = [];
        }
      } else {
        if (kDebugMode) {
          print("kch to likh bhai");
        }
        SearchHotels.value = [];
      }
    } catch (e) {
      if (kDebugMode) {
        print("err in handleSeachHotel => $e ");
      }
    }
  }
}
