import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:travel_app/src/models/popular_hotel_model.dart';
import 'package:travel_app/core/consts/consts.dart';

class HotelServices {
  final Dio dio = Dio();

  Future<List<PopularHotelModel>?> getPopularHotels() async {
    try {
      Response response = await dio.get(
        "$API_BASE_URL/popularHotels",
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
}
