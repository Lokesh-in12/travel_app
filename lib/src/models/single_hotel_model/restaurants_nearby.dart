import 'content.dart';

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
