import 'package:flutter/material.dart';
import 'package:furniture_app_2/models/categories.dart';
import 'package:furniture_app_2/models/products.dart';
import 'package:furniture_app_2/screens/home/components/categories.dart';
import 'package:furniture_app_2/screens/home/components/product_card.dart';
import 'package:furniture_app_2/screens/home/components/recommand_products.dart';
import 'package:furniture_app_2/screens/home/components/title_text.dart';
import 'package:furniture_app_2/services/fetch_categories.dart';
import 'package:furniture_app_2/services/fetch_products.dart';
import 'package:furniture_app_2/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(SizeConfig.defaultSize * 2),
              child: const TitleText(
                title: 'Browse by Categories',
              ),
            ),
            FutureBuilder<List<Category>>(
              future: fetchCategories(),
              builder: (context, snapshot) => snapshot.hasData
                  ? Categories(
                      categories: snapshot.data!,
                    )
                  : Center(child: Image.asset('assets/ripple.gif')),
            ),
            const Divider(height: 5),
            Padding(
              padding: EdgeInsets.all(SizeConfig.defaultSize * 2),
              child: const TitleText(title: 'Recommands For You'),
            ),
            FutureBuilder<List<Product>>(
              future: fetchProducts(),
              builder: (context, snapshot) => snapshot.hasData
                  ? RecommandProducts(products: snapshot.data!)
                  : Center(child: Image.asset('assets/ripple.gif')),
            )
          ],
        ),
      ),
    );
  }
}
