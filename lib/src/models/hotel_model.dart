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
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['geoId'] = this.geoId;
    data['documentId'] = this.documentId;
    data['trackingItems'] = this.trackingItems;
    data['secondaryText'] = this.secondaryText;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__typename'] = this.sTypename;
    data['maxHeight'] = this.maxHeight;
    data['maxWidth'] = this.maxWidth;
    data['urlTemplate'] = this.urlTemplate;
    return data;
  }
}
