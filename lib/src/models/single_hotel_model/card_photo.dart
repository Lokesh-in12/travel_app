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
