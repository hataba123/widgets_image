class ProductModel {
  final String? img;
  final String? name;
  final int? price;
  final bool isBestSeller;
  final bool isNew;
  final bool isDiscounted;

  ProductModel({
    this.img,
    this.name,
    this.price,
    this.isBestSeller = false,
    this.isNew = false,
    this.isDiscounted = false,
  });
}
