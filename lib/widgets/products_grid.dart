import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import './product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;
  ProductsGrid(this.showFavs);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context); //listner setup.
    final products =
        showFavs ? productsData.favoriteIteams : productsData.items;
    return GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, index) {
          return ChangeNotifierProvider.value(
            //this apporach is used when your are using grid or list so that the widget listning will refresh feasibly without any error.
            //this approach cleans the old data and reduces the chances of redundency of data.
            value: products[index],
            // create: (c) => products[index],
            // child: ProductItem(products[index].id, products[index].imageUrl,
            //     products[index].title),
            child: ProductItem(),
          );
        });
  }
}
