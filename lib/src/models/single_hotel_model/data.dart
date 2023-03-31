import 'about.dart';
import 'attractions_nearby.dart';
import 'geo_point.dart';
import 'location.dart';
import 'photo.dart';
import 'price.dart';
import 'restaurants_nearby.dart';
import 'reviews.dart';

class Data {
  List<Photo>? photos;
  String? title;
  double? rating;
  int? numberReviews;
  String? rankingDetails;
  Price? price;
  About? about;
  Reviews? reviews;
  Location? location;
  GeoPoint? geoPoint;
  RestaurantsNearby? restaurantsNearby;
  AttractionsNearby? attractionsNearby;

  Data({
    this.photos,
    this.title,
    this.rating,
    this.numberReviews,
    this.rankingDetails,
    this.price,
    this.about,
    this.reviews,
    this.location,
    this.geoPoint,
    this.restaurantsNearby,
    this.attractionsNearby,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        photos: (json['photos'] as List<dynamic>?)
            ?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
            .toList(),
        title: json['title'] as String?,
        rating: (json['rating'] as num?)?.toDouble(),
        numberReviews: json['numberReviews'] as int?,
        rankingDetails: json['rankingDetails'] as String?,
        price: json['price'] == null
            ? null
            : Price.fromJson(json['price'] as Map<String, dynamic>),
        about: json['about'] == null
            ? null
            : About.fromJson(json['about'] as Map<String, dynamic>),
        reviews: json['reviews'] == null
            ? null
            : Reviews.fromJson(json['reviews'] as Map<String, dynamic>),
        location: json['location'] == null
            ? null
            : Location.fromJson(json['location'] as Map<String, dynamic>),
        geoPoint: json['geoPoint'] == null
            ? null
            : GeoPoint.fromJson(json['geoPoint'] as Map<String, dynamic>),
        restaurantsNearby: json['restaurantsNearby'] == null
            ? null
            : RestaurantsNearby.fromJson(
                json['restaurantsNearby'] as Map<String, dynamic>),
        attractionsNearby: json['attractionsNearby'] == null
            ? null
            : AttractionsNearby.fromJson(
                json['attractionsNearby'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'photos': photos?.map((e) => e.toJson()).toList(),
        'title': title,
        'rating': rating,
        'numberReviews': numberReviews,
        'rankingDetails': rankingDetails,
        'price': price?.toJson(),
        'about': about?.toJson(),
        'reviews': reviews?.toJson(),
        'location': location?.toJson(),
        'geoPoint': geoPoint?.toJson(),
        'restaurantsNearby': restaurantsNearby?.toJson(),
        'attractionsNearby': attractionsNearby?.toJson(),
      };
}
