import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:travel_app/src/models/popular_hotel_model.dart';
import 'package:travel_app/core/consts/consts.dart';

class HotelServices {
  final Dio dio = Dio();

  Future<int?> totalLengthOfData() async {
    try {
      Response response = await dio.get(
        "$API_BASE_URL/allPopularHotels",
      );

      if (response.statusCode == 200) {
        int data = response.data;
        if (kDebugMode) {
          print("myapi data is =>> $data");
          print("totalLengthOfData Data Loaded Successfully!");
        }

        return data;
      } else {
        if (kDebugMode) {
          print("in else of totalLengthOfData");
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<PopularHotelModel>?> getPopularHotels(page) async {
    try {
      print("page is =>> $page");
      Response response = await dio.get(
        "$API_BASE_URL/popularHotels?page=$page",
      );

      if (response.statusCode == 200) {
        List data = response.data;
        if (kDebugMode) {
          print("myapi data is =>> $data");
          print("getPopularHotels Data Loaded Successfully!");
        }

        return data.map((e) => PopularHotelModel.fromJson(e)).toList();
      } else {
        if (kDebugMode) {
          print("in else of getPopularHotels");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("err in getPopularHotels =>> $e");
      }
      rethrow;
    } finally {}
    return null;
  }

  //handle Hotels by cityName
  Future<List<PopularHotelModel>?> getHotelByCity(String city) async {
    print("ciyName in services = > $city");
    try {
      Response response = await dio.get(
        "$API_BASE_URL/hotelByCity?city=$city",
      );

      if (response.statusCode == 200) {
        List data = response.data;
        if (kDebugMode) {
          print("getHotelByCity =>> $data");
          print("getHotelByCity Data Loaded Successfully!");
        }

        return data.map((e) => PopularHotelModel.fromJson(e)).toList();
      } else {
        if (kDebugMode) {
          print("in else of getHotelByCity");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("err in getHotelByCity =>> $e");
      }
      rethrow;
    } finally {}
    return null;
  }

  //handle Search Hotels
  Future<List<PopularHotelModel>?> getSearchHotels(
      String keyword, totalLengthOfData) async {
    try {
      print("keyword is =>> $keyword");
      Response response = await dio.get(
        "$API_BASE_URL/popularHotels?page=1?limit=$totalLengthOfData",
      );

      if (response.statusCode == 200) {
        List data = response.data;
        if (kDebugMode) {  
          print("getSearchHotels $data");
          print("getSearchHotels Data Loaded Successfully!");         
        }

        String toLowerCaseKeyword = keyword.toLowerCase();

        List filteredData = data
            .where((e) =>
                e['name'].toString().toLowerCase().contains(toLowerCaseKeyword))
            .toList();

        print("aaya kya => $filteredData");

        return filteredData.map((e) => PopularHotelModel.fromJson(e)).toList();
      } else {
        if (kDebugMode) {
          print("in else of getSearchHotels");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("err in getSearchHotels =>> $e");
      }
      rethrow;
    } finally {}
    return null;
  }
}
