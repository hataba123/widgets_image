class ProductModel {
  final int? id;
  final String? img;
  final String? name;
  final String? des;
  final String? size;
  final int? price;
  final bool isBestSeller;
  final bool isNew;
  final bool isDiscounted;
  final String? category;

  ProductModel({
    this.id,
    this.img,
    this.name,
    this.des,
    this.size,
    this.price,
    this.isBestSeller = false,
    this.isNew = false,
    this.isDiscounted = false,
    this.category,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      img: json['photo'],
      category: json['category'],
      isBestSeller: json['isBestSeller'],
      isNew: json['isNew'],
      isDiscounted: json['isDiscounted'],
    );
  }

}
