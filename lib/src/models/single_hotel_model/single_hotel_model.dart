

class SingleHotelModel {
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

  SingleHotelModel({
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

  factory SingleHotelModel.fromJson(Map<String, dynamic> json) {
    return SingleHotelModel(
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
  }

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

class About {
  String? title;
  List<Content>? content;
  List<dynamic>? tags;

  About({this.title, this.content, this.tags});

  factory About.fromJson(Map<String, dynamic> json) => About(
        title: json['title'] as String?,
        content: (json['content'] as List<dynamic>?)
            ?.map((e) => Content.fromJson(e as Map<String, dynamic>))
            .toList(),
        tags: json['tags'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content?.map((e) => e.toJson()).toList(),
        'tags': tags,
      };
}

class AttractionsNearby {
  String? sectionTitle;
  List<Content>? content;

  AttractionsNearby({this.sectionTitle, this.content});

  factory AttractionsNearby.fromJson(Map<String, dynamic> json) {
    return AttractionsNearby(
      sectionTitle: json['sectionTitle'] as String?,
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => Content.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'sectionTitle': sectionTitle,
        'content': content?.map((e) => e.toJson()).toList(),
      };
}
class Avatar {
  int? maxHeight;
  int? maxWidth;
  String? urlTemplate;

  Avatar({this.maxHeight, this.maxWidth, this.urlTemplate});

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
        maxHeight: json['maxHeight'] as int?,
        maxWidth: json['maxWidth'] as int?,
        urlTemplate: json['urlTemplate'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'maxHeight': maxHeight,
        'maxWidth': maxWidth,
        'urlTemplate': urlTemplate,
      };
}


class Average {
  int? percentage;
  String? count;

  Average({this.percentage, this.count});

  factory Average.fromJson(Map<String, dynamic> json) => Average(
        percentage: json['percentage'] as int?,
        count: json['count'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'percentage': percentage,
        'count': count,
      };
}


class BubbleRating {
  int? rating;
  String? numberReviews;

  BubbleRating({this.rating, this.numberReviews});

  factory BubbleRating.fromJson(Map<String, dynamic> json) => BubbleRating(
        rating: json['rating'] as int?,
        numberReviews: json['numberReviews'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'rating': rating,
        'numberReviews': numberReviews,
      };
}


class CardPhoto {
  int? maxHeight;
  int? maxWidth;
  String? urlTemplate;

  CardPhoto({this.maxHeight, this.maxWidth, this.urlTemplate});

  factory CardPhoto.fromJson(Map<String, dynamic> json) => CardPhoto(
        maxHeight: json['maxHeight'] as int?,
        maxWidth: json['maxWidth'] as int?,
        urlTemplate: json['urlTemplate'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'maxHeight': maxHeight,
        'maxWidth': maxWidth,
        'urlTemplate': urlTemplate,
      };
}



class Content {
  String? title;
  BubbleRating? bubbleRating;
  UserProfile? userProfile;

  Content({this.title, this.bubbleRating, this.userProfile});

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        title: json['title'] as String?,
        bubbleRating: json['bubbleRating'] == null
            ? null
            : BubbleRating.fromJson(json as Map<String, dynamic>),
        userProfile: json['userProfile'] == null
            ? null
            : UserProfile.fromJson(json as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'title': title,
      };
}


class Excellent {
  int? percentage;
  String? count;

  Excellent({this.percentage, this.count});

  factory Excellent.fromJson(Map<String, dynamic> json) => Excellent(
        percentage: json['percentage'] as int?,
        count: json['count'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'percentage': percentage,
        'count': count,
      };
}


class GeoPoint {
  double? latitude;
  double? longitude;

  GeoPoint({this.latitude, this.longitude});

  factory GeoPoint.fromJson(Map<String, dynamic> json) => GeoPoint(
        latitude: (json['latitude'] as num?)?.toDouble(),
        longitude: (json['longitude'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
      };
}


class GettingThere {
  String? title;
  List<dynamic>? content;

  GettingThere({this.title, this.content});

  factory GettingThere.fromJson(Map<String, dynamic> json) => GettingThere(
        title: json['title'] as String?,
        content: json['content'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
      };
}



class Location {
  String? title;
  String? address;
  // Neighborhood? neighborhood;
  GettingThere? gettingThere;
  dynamic walkability;

  Location({
    this.title,
    this.address,
    // this.neighborhood,
    this.gettingThere,
    this.walkability,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        title: json['title'] as String?,
        address: json['address'] as String?,
        // neighborhood: json['neighborhood'] == null
        //     ? null
        //     : Neighborhood.fromJson(
        //         json['neighborhood'] as Map<String, dynamic>),
        gettingThere: json['gettingThere'] == null
            ? null
            : GettingThere.fromJson(
                json['gettingThere'] as Map<String, dynamic>),
        walkability: json['walkability'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'address': address,
        // 'neighborhood': neighborhood?.toJson(),
        'gettingThere': gettingThere?.toJson(),
        'walkability': walkability,
      };
}



class MemberProfile {
  ProfileImage? profileImage;

  MemberProfile({this.profileImage});

  factory MemberProfile.fromJson(Map<String, dynamic> json) => MemberProfile(
        profileImage: json['profileImage'] == null
            ? null
            : ProfileImage.fromJson(
                json['profileImage'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'profileImage': profileImage?.toJson(),
      };
}


class Photo {
  int? maxHeight;
  int? maxWidth;
  String? urlTemplate;

  Photo({this.maxHeight, this.maxWidth, this.urlTemplate});

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        maxHeight: json['maxHeight'] as int?,
        maxWidth: json['maxWidth'] as int?,
        urlTemplate: json['urlTemplate'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'maxHeight': maxHeight,
        'maxWidth': maxWidth,
        'urlTemplate': urlTemplate,
      };
}

class Poor {
  int? percentage;
  String? count;

  Poor({this.percentage, this.count});

  factory Poor.fromJson(Map<String, dynamic> json) => Poor(
        percentage: json['percentage'] as int?,
        count: json['count'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'percentage': percentage,
        'count': count,
      };
}


class Price {
  String? displayPrice;
  dynamic strikeThroughPrice;
  String? status;
  String? providerName;
  dynamic freeCancellation;
  dynamic pricingPeriod;

  Price({
    this.displayPrice,
    this.strikeThroughPrice,
    this.status,
    this.providerName,
    this.freeCancellation,
    this.pricingPeriod,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        displayPrice: json['displayPrice'] as String?,
        strikeThroughPrice: json['strikeThroughPrice'] as dynamic,
        status: json['status'] as String?,
        providerName: json['providerName'] as String?,
        freeCancellation: json['freeCancellation'] as dynamic,
        pricingPeriod: json['pricingPeriod'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'displayPrice': displayPrice,
        'strikeThroughPrice': strikeThroughPrice,
        'status': status,
        'providerName': providerName,
        'freeCancellation': freeCancellation,
        'pricingPeriod': pricingPeriod,
      };
}


class ProfileImage {
  ProfileImage();

  factory ProfileImage.fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError('ProfileImage.fromJson($json) is not implemented');
  }

  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}


class RatingCounts {
  Average? average;
  Excellent? excellent;
  Poor? poor;
  Terrible? terrible;
  VeryGood? veryGood;

  RatingCounts({
    this.average,
    this.excellent,
    this.poor,
    this.terrible,
    this.veryGood,
  });

  factory RatingCounts.fromJson(Map<String, dynamic> json) => RatingCounts(
        average: json['average'] == null
            ? null
            : Average.fromJson(json['average'] as Map<String, dynamic>),
        excellent: json['excellent'] == null
            ? null
            : Excellent.fromJson(json['excellent'] as Map<String, dynamic>),
        poor: json['poor'] == null
            ? null
            : Poor.fromJson(json['poor'] as Map<String, dynamic>),
        terrible: json['terrible'] == null
            ? null
            : Terrible.fromJson(json['terrible'] as Map<String, dynamic>),
        veryGood: json['veryGood'] == null
            ? null
            : VeryGood.fromJson(json['veryGood'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'average': average?.toJson(),
        'excellent': excellent?.toJson(),
        'poor': poor?.toJson(),
        'terrible': terrible?.toJson(),
        'veryGood': veryGood?.toJson(),
      };
}



class RestaurantsNearby {
  String? sectionTitle;
  List<Content>? content;

  RestaurantsNearby({this.sectionTitle, this.content});

  factory RestaurantsNearby.fromJson(Map<String, dynamic> json) {
    return RestaurantsNearby(
      sectionTitle: json['sectionTitle'] as String?,
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => Content.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'sectionTitle': sectionTitle,
        'content': content?.map((e) => e.toJson()).toList(),
      };
}



class Reviews {
  List<Content>? content;
  int? count;
  double? ratingValue;
  RatingCounts? ratingCounts;

  Reviews({this.content, this.count, this.ratingValue, this.ratingCounts});

  factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
        content: (json['content'] as List<dynamic>?)
            ?.map((e) => Content.fromJson(e as Map<String, dynamic>))
            .toList(),
        count: json['count'] as int?,
        ratingValue: (json['ratingValue'] as num?)?.toDouble(),
        ratingCounts: json['ratingCounts'] == null
            ? null
            : RatingCounts.fromJson(
                json['ratingCounts'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'content': content?.map((e) => e.toJson()).toList(),
        'count': count,
        'ratingValue': ratingValue,
        'ratingCounts': ratingCounts?.toJson(),
      };
}


class Terrible {
  int? percentage;
  String? count;

  Terrible({this.percentage, this.count});

  factory Terrible.fromJson(Map<String, dynamic> json) => Terrible(
        percentage: json['percentage'] as int?,
        count: json['count'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'percentage': percentage,
        'count': count,
      };
}



class TopAnswer {
  String? text;
  String? writtenDate;
  int? thumbsUpCount;
  MemberProfile? memberProfile;

  TopAnswer({
    this.text,
    this.writtenDate,
    this.thumbsUpCount,
    this.memberProfile,
  });

  factory TopAnswer.fromJson(Map<String, dynamic> json) => TopAnswer(
        text: json['text'] as String?,
        writtenDate: json['writtenDate'] as String?,
        thumbsUpCount: json['thumbsUpCount'] as int?,
        memberProfile: json['memberProfile'] == null
            ? null
            : MemberProfile.fromJson(
                json['memberProfile'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'text': text,
        'writtenDate': writtenDate,
        'thumbsUpCount': thumbsUpCount,
        'memberProfile': memberProfile?.toJson(),
      };
}



class UserProfile { 
  String? deprecatedContributionCount;
  Avatar? avatar;

  UserProfile({this.deprecatedContributionCount, this.avatar});

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        deprecatedContributionCount:
            json['deprecatedContributionCount'] as String?,
        avatar: json['avatar'] == null
            ? null
            : Avatar.fromJson(json['avatar'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'deprecatedContributionCount': deprecatedContributionCount,
        'avatar': avatar?.toJson(),
      };
}


class VeryGood {
  int? percentage;
  String? count;

  VeryGood({this.percentage, this.count});

  factory VeryGood.fromJson(Map<String, dynamic> json) => VeryGood(
        percentage: json['percentage'] as int?,
        count: json['count'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'percentage': percentage,
        'count': count,
      };
}

