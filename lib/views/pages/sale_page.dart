import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/database_controller.dart';
import '../../models/product.dart';
import '../widgets/list_item_favorite.dart';

class SalePage extends StatelessWidget {
  const SalePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [

              StreamBuilder<List<ProductModel>>(
                  stream: database.newProductsStream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      final products = snapshot.data;
                      if (products == null || products.isEmpty) {
                        return const Center(
                          child: Text('No Data Available!'),
                        );
                      }
                      return GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 2,
                        childAspectRatio: .48,
                        mainAxisSpacing: 2,
                        children: List.generate(products.length,
                                (index) => ListItemFavorite(product: products[index])),
                      );

                      //   ListView.builder(
                      //   itemCount: products.length,
                      //   scrollDirection: Axis.vertical,
                      //   itemBuilder: (_, int index) =>
                      //       Padding(
                      //         padding: const EdgeInsets.all(8.0),
                      //         child: ListItemFavorite(product: products[index]),
                      //       ),
                      // );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
