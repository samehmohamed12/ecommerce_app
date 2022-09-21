import 'package:ecommerce_app/models/add_to_cart.dart';
import 'package:ecommerce_app/utilities/routes.dart';
import 'package:ecommerce_app/views/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/database_controller.dart';
import '../widgets/cart_list_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int totalAmount = 0;

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    final myProducts = await Provider.of<Database>(context, listen: false)
        .myProductsCartStream()
        .first;
    myProducts.forEach((element) {
      setState(() {
        totalAmount += element.price;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
    return SafeArea(
      child: StreamBuilder<List<AddToCartModel>>(
          stream: database.myProductsCartStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              final cartItems = snapshot.data;

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox.shrink(),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.search_rounded))
                        ],
                      ),
                      Text(
                        'My Cart',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      if (cartItems == null && cartItems!.isEmpty)
                        const Center(
                          child: Text('No Data Available!'),
                        ),
                      ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final cartItem = cartItems[index];
                            //   setState((){
                            //  });
                            return CartListItem(
                              cartItem: cartItem,
                            );
                          },
                          separatorBuilder: (index, context) => const SizedBox(
                                height: 20,
                              ),
                          itemCount: cartItems.length),
                      const SizedBox(
                        height: 16.0,
                      ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Amount:',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            Text(
                              '${totalAmount} EGP',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),

                            //  MainButton(onTap: (){}, text: 'Check Out')
                          ],
                        ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      MainButton(
                          onTap: () => Navigator.of(context,rootNavigator: true)
                              .pushNamed(AppRoute.checkoutPageRoute,arguments: database),
                          text: 'Check Out')
                    ],
                  ),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
