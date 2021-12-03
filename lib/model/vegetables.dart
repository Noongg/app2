class Vegetables {
  late String title;
  late String img;
  late String unit;
  late String description;
  late String review;
  late String category;
  late int price;
  late String id;

  Vegetables(
      {required this.title,
        required this.img,
        required this.unit,
        required this.description,
        required this.review,
        required this.category,
        required this.price,
        required this.id});

  Vegetables.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    img = json['img'];
    unit = json['unit'];
    description = json['description'];
    review = json['review'];
    category = json['category'];
    price = json['price'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['img'] = this.img;
    data['unit'] = this.unit;
    data['description'] = this.description;
    data['review'] = this.review;
    data['category'] = this.category;
    data['price'] = this.price;
    data['id'] = this.id;
    return data;
  }
}