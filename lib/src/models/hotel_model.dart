class HotelModel {
  String? title;
  String? geoId;
  String? documentId;
  String? trackingItems;
  String? secondaryText;
  Image? image;

  HotelModel(
      {this.title,
      this.geoId,
      this.documentId,
      this.trackingItems,
      this.secondaryText,
      this.image});

  HotelModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    geoId = json['geoId'];
    documentId = json['documentId'];
    trackingItems = json['trackingItems'];
    secondaryText = json['secondaryText'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['geoId'] = geoId;
    data['documentId'] = documentId;
    data['trackingItems'] = trackingItems;
    data['secondaryText'] = secondaryText;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    return data;
  }
}

class Image {
  String? sTypename;
  int? maxHeight;
  int? maxWidth;
  String? urlTemplate;

  Image({this.sTypename, this.maxHeight, this.maxWidth, this.urlTemplate});

  Image.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    maxHeight = json['maxHeight'];
    maxWidth = json['maxWidth'];
    urlTemplate = json['urlTemplate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['__typename'] = sTypename;
    data['maxHeight'] = maxHeight;
    data['maxWidth'] = maxWidth;
    data['urlTemplate'] = urlTemplate;
    return data;
  }
}
