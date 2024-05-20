import 'package:widgets_image/data/model.dart';
// create data with amount

createDataList(int amount) {
  List<ProductModel> lstProduct = [];
  for (int i= 1; i<= amount; i++) {
    lstProduct.add(ProductModel(
      id:i,
      name:"Smartphone new version $i",
      price:(i * 10000000),
      img:"img_$i.jpg",
      des:"Iphone"
    )); 
  }
  return lstProduct;
}