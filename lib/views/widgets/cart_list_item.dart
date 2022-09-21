import 'package:ecommerce_app/models/add_to_cart.dart';
import 'package:flutter/material.dart';

class CartListItem extends StatelessWidget {
  final AddToCartModel cartItem;

  const CartListItem({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              cartItem.imgUrl,
              width: 100,
              height: 100,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.title,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Colors.black),
                ),
                //const Text('color:Black'),
                Row(
                  //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      elevation: 10,
                      child: Stack(
                        children: const [Icon(Icons.minimize)],
                      ),
                    ),
                    Text(cartItem.quantity.toString()),
                    Card(
                      elevation: 10,
                      child: Container(
                        child: Stack(
                          children: const [Icon(Icons.add)],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.more_vert),
                Text('${cartItem.price.toString()}'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
