class CarModel {
  final List<String> image;
  final String name;
  final String details;
  final String price;
  final String rating;
  final String category;
  final String description;

  CarModel({
    required this.image,
    required this.name,
    required this.details,
    required this.price,
    required this.rating,
    required this.category,
    required this.description,
  });

  factory CarModel.fromMap(Map<String, dynamic> map) {
    return CarModel(
      image: List<String>.from(map['image']),
      name: map['name'],
      details: map['details'],
      price: map['price'],
      rating: map['rating'],
      category: map['category'],
      description: map['description'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'name': name,
      'details': details,
      'price': price,
      'rating': rating,
      'category': category,
      'description': description,
    };
  }
}
