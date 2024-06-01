class Plant {
  String title;
  String image;
  String description;
  int quantity;
  double rating;
  bool isFav;
  String price;

  Plant({
    required this.title,
    required this.image,
    required this.description,
    required this.quantity,
    required this.rating,
    required this.isFav,
    required this.price,
  });

  // Factory method to create a Plant object from JSON
  factory Plant.fromJson(Map<String, dynamic> json) {
    return Plant(
      title: json['title'] as String,
      image: json['image'] as String,
      description: json['description'] as String,
      quantity: json['quantity'] as int,
      rating: json['rating'] as double,
      isFav: json['isFav'] as bool,
      price: json['price'] as String,
    );
  }

  // Method to convert a Plant object to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'image': image,
      'description': description,
      'quantity': quantity,
      'rating': rating,
      'isFav': isFav,
      'price': price,
    };
  }

}
class PlantData {
  final List<Plant> data;

  PlantData({required this.data});

  factory PlantData.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<Plant> dataList = list.map((i) => Plant.fromJson(i)).toList();
    return PlantData(data: dataList);
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((v) => v.toJson()).toList(),
    };
  }
}