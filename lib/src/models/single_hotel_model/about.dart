import 'content.dart';

class About {
  String? title;
  List<Content>? content;
  List<String>? tags;

  About({this.title, this.content, this.tags});

  factory About.fromJson(Map<String, dynamic> json) => About(
        title: json['title'] as String?,
        content: (json['content'] as List<dynamic>?)
            ?.map((e) => Content.fromJson(e as Map<String, dynamic>))
            .toList(),
        tags: json['tags'] as List<String>?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content?.map((e) => e.toJson()).toList(),
        'tags': tags,
      };
}
