import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/utilities/routes.dart';
import 'package:ecommerce_app/views/pages/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../models/product.dart';

class ListItemFavorite extends StatelessWidget {
  ListItemFavorite({Key? key, required this.product}) : super(key: key);
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => Navigator.of(context, rootNavigator: true)
          .pushNamed(AppRoute.productDetailsRoute, arguments: product),
      child: SizedBox(
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: CachedNetworkImage(
                        imageUrl: product.imgUrl,
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                      // Image.network(
                      //   product.imgUrl,
                      //   height: 200,
                      //   width: 150,
                      //   fit: BoxFit.cover,
                      //
                      // ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: SizedBox(
                        height: size.height * .050,
                        width: size.width * .1,
                        child: const DecoratedBox(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.shopping_bag_sharp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: SizedBox(
                //     width: 50,
                //     height: 30,
                //     child: DecoratedBox(
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(16.0),
                //           color: Colors.red),
                //       child: Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Center(
                //           child: Text(
                //             '${product.discountValue}%',
                //             style: Theme.of(context)
                //                 .textTheme
                //                 .caption!
                //                 .copyWith(color: Colors.white),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
            RatingBarIndicator(
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              direction: Axis.horizontal,
              itemCount: 5,
              itemSize: 25.0,
              rating: product.rate?.toDouble() ?? 0.0,
            ),

            Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              product.category!,
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(color: Colors.grey),
            ),
            Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              product.title,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            Text.rich(
              TextSpan(children: [
                TextSpan(
                  text: "${product.price} EG",
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: Colors.red,
                        //decoration: TextDecoration.lineThrough
                      ),
                ),
                // TextSpan(
                //   text: " ${product.price * (product.discountValue) / 100} EG",
                //   style: Theme.of(context)
                //       .textTheme
                //       .subtitle2!
                //       .copyWith(color: Colors.grey),
                // ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

Widget separator(double wide, double high) {
  return SizedBox(
    width: wide,
    height: high,
  );
}
