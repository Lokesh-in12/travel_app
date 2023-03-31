import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:travel_app/core/consts/consts.dart';
import 'package:travel_app/src/models/hotel_model.dart';

class HotelServices {
  final Dio dio = Dio();

  Future<List<HotelModel>?> getHotels(String query) async {
    try {
      Response response =
          // await dio.get("${API_BASE_URL}/searchLocation?query=$query");
          await dio.get("$API_BASE_URL/searchLocation?query=$query",
              options: Options(headers: {
                "X-RapidAPI-Key":
                    "712ddbc3a2msh3bf7f699727cccdp158c75jsnb6322c603abc",
                "X-RapidAPI-Host": "tripadvisor16.p.rapidapi.com"
              }));

      if (response.statusCode == 200) {
        List data = response.data['data'];
        if (kDebugMode) {
          print("data is =>> $data");
        }
        return data.map((e) => HotelModel.fromJson(e)).toList();
      }
    } catch (e) {
      if (kDebugMode) {
        print("err in getHotels =>> $e");
      }
      rethrow;
    } finally {
      if (kDebugMode) {
        print("Hotels Data Loaded Successfully!");
      }
    }
    return null;
  }
}
