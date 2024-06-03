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
  });
}
