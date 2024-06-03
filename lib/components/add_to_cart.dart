import 'package:flutter/material.dart';
import 'package:widgets_image/constant.dart';
import 'package:widgets_image/data/model.dart';

class AddToCart extends StatelessWidget {
  final ProductModel product;

  const AddToCart({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: kDefaultPaddin),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
             
            ),
            child: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {},
            ),
          ),
         Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)), 
                            backgroundColor: Colors.redAccent
              ),
                child: Text(
                  "Mua ngay".toUpperCase(),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                   
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
