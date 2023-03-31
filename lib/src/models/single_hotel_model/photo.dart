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
