class GettingThere {
  String? title;
  List<String>? content;

  GettingThere({this.title, this.content});

  factory GettingThere.fromJson(Map<String, dynamic> json) => GettingThere(
        title: json['title'] as String?,
        content: json['content'] as List<String>?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
      };
}
