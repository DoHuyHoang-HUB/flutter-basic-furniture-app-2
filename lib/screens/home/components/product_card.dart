import 'package:flutter/material.dart';
import 'package:furniture_app_2/constants.dart';
import 'package:furniture_app_2/models/products.dart';
import 'package:furniture_app_2/screens/home/components/title_text.dart';
import 'package:furniture_app_2/size_config.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final Function onPress;
  const ProductCard({
    Key? key,
    required this.product,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress.call(),
      child: Container(
        width: SizeConfig.defaultSize * 14.5,
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: AspectRatio(
          aspectRatio: 0.693,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Hero(
                  tag: product.id,
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/spinner.gif',
                    image: product.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize),
                child: TitleText(title: product.title),
              ),
              SizedBox(height: SizeConfig.defaultSize / 2),
              Text('\$${product.price}'),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
