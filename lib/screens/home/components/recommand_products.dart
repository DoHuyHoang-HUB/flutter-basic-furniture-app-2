import 'package:flutter/material.dart';
import 'package:furniture_app_2/models/products.dart';
import 'package:furniture_app_2/screens/details/details_screen.dart';
import 'package:furniture_app_2/screens/home/components/product_card.dart';
import 'package:furniture_app_2/size_config.dart';

class RecommandProducts extends StatefulWidget {
  final List<Product> products;
  const RecommandProducts({Key? key, required this.products}) : super(key: key);

  @override
  State<RecommandProducts> createState() => _RecommandProductsState();
}

class _RecommandProductsState extends State<RecommandProducts> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.defaultSize * 2),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              SizeConfig.orientation == Orientation.portrait ? 2 : 4,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 0.693,
        ),
        itemBuilder: (context, index) => ProductCard(
          product: widget.products[index],
          onPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(
                  product: widget.products[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
