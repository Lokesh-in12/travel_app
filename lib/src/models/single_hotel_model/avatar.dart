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
