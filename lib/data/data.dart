import 'package:widgets_image/data/model.dart';

List<ProductModel> createDataList(int count) {
  return List.generate(count, (index) {
    return ProductModel(
      img: 'img_${index + 1}.jpg',
      name: 'Quần áo $index',
      price: 100000 + index * 5000,
      isBestSeller: index % 3 == 0,
      isNew: index % 2 == 0,
      isDiscounted: index % 4 == 0,
    );
  });
}
