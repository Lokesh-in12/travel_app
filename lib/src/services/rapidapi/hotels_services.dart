import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:travel_app/core/consts/consts.dart';
import 'package:travel_app/src/models/hotel_model.dart';
import 'package:travel_app/src/models/single_hotel_model/single_hotel_model.dart';

class HotelServices {
  final Dio dio = Dio();

  Future<List<HotelModel>?> getHotels(String query) async {
    try {
      Response response =
          // await dio.get("${API_BASE_URL}/searchLocation?query=$query");
          await dio.get("$API_BASE_URL/searchLocation?query=$query",
              options: Options(headers: {
                "X-RapidAPI-Key":
                    // "8e730eeba4mshdc5c16d29213d54p133562jsnf508647d4bfd",
                    "eca8c5ef86mshe3ca5102bccca54p10dde0jsn7675e809bc4c",
                "X-RapidAPI-Host": "tripadvisor16.p.rapidapi.com"
              }));

      if (response.statusCode == 200) {
        List data = response.data['data'];
        if (kDebugMode) {
          print("data is =>> $data");
        }
        print(data.where((element) => element["image"] != null));
        List FilteredData =
            data.where((element) => element["image"] != null).toList();
        return FilteredData.map((e) => HotelModel.fromJson(e)).toList();
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

  Future<List<SingleHotelModel>?> getSingleHotelDets(String id) async {
    print("in getSingleHotelDets and id => $id");
    try {
      Response response =
          // await dio.get("${API_BASE_URL}/searchLocation?query=$query");
          await dio.get(
              "$API_BASE_URL/getHotelDetails?id=$id&checkIn=2023-03-28&checkOut=2023-03-31&currency=Rs",
              options: Options(headers: {
                "X-RapidAPI-Key":
                    // "8e730eeba4mshdc5c16d29213d54p133562jsnf508647d4bfd",
                    "eca8c5ef86mshe3ca5102bccca54p10dde0jsn7675e809bc4c",
                "X-RapidAPI-Host": "tripadvisor16.p.rapidapi.com"
              }));

      if (response.statusCode == 200) {
        List data = [response.data['data']];
        if (kDebugMode) {
          print("data is =>> $data");
        }

        return data.map((e) => SingleHotelModel.fromJson(e)).toList();
      } else {
        print("in else of getSingleHotelDets");
      }
    } catch (e) {
      if (kDebugMode) {
        print("err in getSingleHotelDets =>> $e");
      }
      rethrow;
    } finally {
      if (kDebugMode) {
        print("getSingleHotelDets Data Loaded Successfully!");
      }
    }
    return null;
  }
}
