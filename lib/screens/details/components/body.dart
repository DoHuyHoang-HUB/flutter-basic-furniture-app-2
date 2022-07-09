import 'package:flutter/material.dart';
import 'package:furniture_app_2/models/products.dart';
import 'package:furniture_app_2/screens/details/components/product_description.dart';
import 'package:furniture_app_2/screens/details/components/product_info.dart';
import 'package:furniture_app_2/size_config.dart';

class Body extends StatelessWidget {
  final Product product;
  const Body({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: SizeConfig.orientation == Orientation.landscape
            ? SizeConfig.screenWidth
            : SizeConfig.screenHeight,
        child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductInfo(product: product),
            Positioned(
              top: defaultSize * 37.5,
              left: 0,
              right: 0,
              child: ProductDescription(
                product: product,
                onPressed: () {},
              ),
            ),
            Positioned(
                top: defaultSize * 9.5,
                right: -defaultSize * 7.5,
                child: Hero(
                  tag: product.id,
                  child: Image.network(
                    product.image,
                    height: defaultSize * 37.8,
                    width: defaultSize * 36.4,
                    fit: BoxFit.cover,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
