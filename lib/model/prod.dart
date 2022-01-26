class Prod {
  String? id;
  String? name;
  String? description;
  String? category;
  String? price;
  DateTime? dateCreated;

  Prod(
    {
      required this.id,
      required this.name,
      required this.description,
      required this.category,
      required this.price,
      required this.dateCreated,
    }
  );

  Prod.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    category = json['category'];
    price = json['price'];
    dateCreated = DateTime.parse(json['date_created']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> prod = <String, dynamic>{};
    prod['id'] = id;
    prod['name'] = name;
    prod['description'] = description;
    prod['category'] = category;
    prod['price'] = price;
    prod['date_created'] = dateCreated;
    return prod;
  }
}
