import 'package:flutter/material.dart';
import 'package:test_app/models/product.model.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  'FROM',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 10),
                Text('\$' + product.price.toStringAsFixed(2)),
                SizedBox(height: 10),
                InkWell(
                  child: Container(
                    width: width / 8,
                    height: height / 18,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 20),
            Image.network(
              product.image!,
              height: height / 3.3,
              width: width/ 2,
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          children: [
            Text(
              product.category,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Colors.blue,
              ),
            ),
            Spacer(),
            Container(
              width: width / 11,
              height: height / 25,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Center(
                child: Text(
                  product.rating.rate.toStringAsFixed(1),
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Container(
              width: width / 12,
              height: height / 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Center(
                child: Text(
                  product.rating.count.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          product.title,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 7),
        Text(
          product.description!,
          style: TextStyle(fontSize: 15),
        ),
        SizedBox(height: 10),
        Container(height: 1, color: Colors.grey.shade400),
      ],
    );
  }
}
