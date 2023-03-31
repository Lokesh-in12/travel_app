import 'getting_there.dart';
import 'neighborhood.dart';

class Location {
  String? title;
  String? address;
  Neighborhood? neighborhood;
  GettingThere? gettingThere;
  dynamic walkability;

  Location({
    this.title,
    this.address,
    this.neighborhood,
    this.gettingThere,
    this.walkability,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        title: json['title'] as String?,
        address: json['address'] as String?,
        neighborhood: json['neighborhood'] == null
            ? null
            : Neighborhood.fromJson(
                json['neighborhood'] as Map<String, dynamic>),
        gettingThere: json['gettingThere'] == null
            ? null
            : GettingThere.fromJson(
                json['gettingThere'] as Map<String, dynamic>),
        walkability: json['walkability'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'address': address,
        'neighborhood': neighborhood?.toJson(),
        'gettingThere': gettingThere?.toJson(),
        'walkability': walkability,
      };
}
