class PopularHotelModel {
  int? id;
  String? name;
  String? about;
  String? images;
  String? city;
  String? rating;
  String? location;
  String? price;

  PopularHotelModel(
      {this.id,
      this.name,
      this.about,
      this.images,
      this.city,
      this.rating,
      this.location,
      this.price});

  PopularHotelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    about = json['about'];
    images = json['images'];
    city = json['city'];
    rating = json['rating'];
    location = json['location'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['about'] = this.about;
    data['images'] = this.images;
    data['city'] = this.city;
    data['rating'] = this.rating;
    data['location'] = this.location;
    data['price'] = this.price;
    return data;
  }
}
