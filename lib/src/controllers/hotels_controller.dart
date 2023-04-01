import 'package:get/get.dart';
import 'package:travel_app/src/models/hotel_model.dart';
import 'package:travel_app/src/models/single_hotel_model/single_hotel_model.dart';
import 'package:travel_app/src/services/rapidapi/hotels_services.dart';

class HotelsController extends GetxController {
  // ignore: non_constant_identifier_names
  RxList<HotelModel> Hotels = <HotelModel>[].obs;
  // ignore: non_constant_identifier_names
  RxList<SingleHotelModel> SingleHotel = <SingleHotelModel>[].obs;

  RxBool isLoading = false.obs;

  final HotelServices hotelServices = HotelServices();

  Future<void> handleHotels(String query) async {
    try {
      isLoading(true);
      List<HotelModel>? hotelsList = await hotelServices.getHotels(query);
      if (hotelsList != null) {
        Hotels.value = hotelsList;
      } else {
        Hotels.value = [];
      }
    } catch (e) {
      print("error in  handleHotels =>> $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> handleSingleHotel(String id) async {
    try {
      isLoading(true);
      List<SingleHotelModel>? singleHotel =
          await hotelServices.getSingleHotelDets(id);
      print("loeksh is here =>> $singleHotel");
      if (singleHotel != null) {
        print("hehehehhehhe");
        SingleHotel.value = singleHotel;
        print(
            "the value of singleHOtel inc controller ==>> ${SingleHotel.value}");
      } else {
        print("shit");

        SingleHotel.value = [];
      }
    } catch (e) {
    } finally {
      isLoading(false);
    }
  }
}
