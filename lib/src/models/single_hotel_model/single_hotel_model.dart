import 'data.dart';

class SingleHotelModel {
  bool? status;
  String? message;
  int? timestamp;
  Data? data;

  SingleHotelModel({this.status, this.message, this.timestamp, this.data});

  factory SingleHotelModel.fromJson(Map<String, dynamic> json) {
    return SingleHotelModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      timestamp: json['timestamp'] as int?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'timestamp': timestamp,
        'data': data?.toJson(),
      };
}
