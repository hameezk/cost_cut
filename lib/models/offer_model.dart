class OfferModel {
  String? id;
  String? name;
  String? image;
  String? description;
  String? category;
  String? title;
  String? url;
  String? longitude;
  String? latitude;

  OfferModel({
    required this.id,
    required this.category,
    required this.name,
    required this.image,
    required this.description,
    required this.url,
    required this.title,
    required this.longitude,
    required this.latitude,
  });

  OfferModel.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    name = map["name"];
    image = map["image"];
    description = map["description"];
    category = map["category"];
    title = map["title"];
    url = map["url"];
    latitude = map["latitude"];
    longitude = map["longitude"];
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "image": image,
      "description": description,
      "category": category,
      "title": title,
      "url": url,
      "latitude": latitude,
      "longitude": longitude,
    };
  }

  static List<OfferModel> offers = [];
}
