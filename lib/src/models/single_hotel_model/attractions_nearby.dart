import 'content.dart';

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
