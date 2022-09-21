import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controllers/database_controller.dart';
import 'package:ecommerce_app/models/add_to_cart.dart';
import 'package:ecommerce_app/utilities/constants.dart';
import 'package:ecommerce_app/views/widgets/main_button.dart';
import 'package:ecommerce_app/views/widgets/main_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel product;

  const ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool isFavorite = false;
  PageController productImages = PageController();

  Future<void> _addToCart(Database database) async {
     try{final addToCartProduct = AddToCartModel(id: documentIdFromLocalData(),
        productId: widget.product.id,
        title: widget.product.title,
        price: widget.product.price,
        imgUrl: widget.product.imgUrl);
    await database.addToCart(addToCartProduct);}
        catch(e){
      return MainDialog(context: context, title: 'Error', content: 'Coudin\`t adding to the cart please try again! ').showAlertDialog();

        }
  }

  @override
  Widget build(BuildContext context) {
    final database=Provider.of<Database>(context);
    final size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        //titleSpacing: 90,
        title: Text(widget.product.title),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.share)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(widget.product.imgUrl)),
                        ),
                      );
                    });
              },
              child: Container(
                height: size.height * 0.65,
                width: double.infinity,
                child: Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    PageView.builder(
                      controller: productImages,
                      itemBuilder: (context, index) =>
                          CachedNetworkImage(
                            imageUrl: widget.product.imgUrl,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                      // Image(
                      //   // fit: BoxFit.cover,
                      //   //  image: NetworkImage('http://192.168.1.4:1337${attributes2!.url }'),),
                      //   image:
                      //   NetworkImage(widget.product.imgUrl
                      //   ),
                      // ),
                      itemCount: 3,
                    ),

                  ],
                ),
              ),


            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                        child: SizedBox(
                          height: size.height * .050,
                          width: size.width * .1,
                          child: DecoratedBox(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Icon(
                                isFavorite
                                    ? Icons.favorite_border
                                    : Icons.favorite,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                        widget.product.title,
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                      Text(
                        '${widget.product.price} EG',
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline5!
                            .copyWith(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                    ],
                  ),
                  Text(
                    '${widget.product.category}',
                    style: Theme
                        .of(context)
                        .textTheme
                        .caption!
                        .copyWith(),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    'this is amazing style scarf wow  size 200 cm x 75 cm',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyLarge,
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  MainButton(
                      onTap: ()=>_addToCart(database) , text: 'Add to cart'),
                  const SizedBox(
                    height: 32.0,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
