class Content {
  String? title;
  List<dynamic>? content;

  Content({this.title, this.content});

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        title: json['title'] as String?,
        content: json['content'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
      };
}
