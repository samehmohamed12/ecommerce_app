import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/controllers/database_controller.dart';
import 'package:ecommerce_app/models/banner.dart';
import 'package:ecommerce_app/utilities/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product.dart';
import '../widgets/list_item_home.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  CarouselController carouselController = CarouselController();

  Widget _buildHeaderOfList(BuildContext context,
      {required String text,
      VoidCallback? onTap,
      required String description}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              InkWell(
                  onTap: onTap,
                  child: Text(
                    'View all',
                    style: Theme.of(context).textTheme.subtitle1!,
                  )),
            ],
          ),
          Text(
            description,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final database = Provider.of<Database>(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StreamBuilder<List<BannerModel>>(
              stream: database.bannerStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  final banners = snapshot.data;
                  if (banners == null || banners.isEmpty) {
                    return const Center(
                      child: Text('No Data Available!'),
                    );
                  }
                  return CarouselSlider(
                    items: List.generate(banners.length,
                        (index) => saleItemBuilder(banners[index], context)),
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      autoPlayInterval: const Duration(seconds: 4),
                      autoPlayAnimationDuration: const Duration(seconds: 1),
                      enableInfiniteScroll: true,
                      height: size.height * .24,
                      initialPage: 0,
                      reverse: false,
                      scrollDirection: Axis.horizontal,
                      viewportFraction: 1,
                    ),
                    carouselController: carouselController,
                  );
                  // return CachedNetworkImage(
                  //   imageUrl: "https://scontent.faly1-2.fna.fbcdn.net/v/t39.30808-6/285664804_1894689267394034_5595189527416682320_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=e3f864&_nc_eui2=AeEBidGfonyMpFeibcUJ8HKV-mjD4-Xhitf6aMPj5eGK1_a3O5ce0WOR7bsDNJa_SeWyNypx3ZxXifQ8lMy6DTv7&_nc_ohc=gw1LlPyV8VsAX8O9tmn&_nc_ht=scontent.faly1-2.fna&oh=00_AT_dKJCTu6WkFC3iY3AAV6e2k_MHMoDEGEQIuih-aL4-3w&oe=62E7B36C",
                  //   placeholder: (context, url) => CircularProgressIndicator(),
                  //   errorWidget: (context, url, error) => Icon(Icons.error),
                  //      width: double.infinity,
                  //   //   height: size.height * 0.3,
                  // );
                  // return Image.network(
                  //   'https://scontent.faly1-2.fna.fbcdn.net/v/t39.30808-6/285664804_1894689267394034_5595189527416682320_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=e3f864&_nc_eui2=AeEBidGfonyMpFeibcUJ8HKV-mjD4-Xhitf6aMPj5eGK1_a3O5ce0WOR7bsDNJa_SeWyNypx3ZxXifQ8lMy6DTv7&_nc_ohc=gw1LlPyV8VsAX8O9tmn&_nc_ht=scontent.faly1-2.fna&oh=00_AT_dKJCTu6WkFC3iY3AAV6e2k_MHMoDEGEQIuih-aL4-3w&oe=62E7B36C',
                  //   width: double.infinity,
                  //   height: size.height * 0.3,
                  // );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
          const SizedBox(
            height: 10.0,
          ),
          Column(
            children: [
              _buildHeaderOfList(context,
                  text: 'Sale', description: 'Super Summer Sale!',onTap:()=>Navigator.of(context,rootNavigator: true).pushNamed(AppRoute.salePageRoute) ),
              const SizedBox(
                height: 8.0,
              ),
              SizedBox(
                height: 300,
                child: StreamBuilder<List<ProductModel>>(
                    stream: database.salesProductsStream(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState ==
                          ConnectionState.active) {
                        final products = snapshot.data;
                        if (products == null || products.isEmpty) {
                          return const Center(
                            child: Text('No Data Available!'),
                          );
                        }
                        return ListView.builder(
                          itemCount: products.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, int index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListItemHome(product: products[index]),
                          ),
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    ),
              )
            ],
          ),
          Column(
            children: [
              _buildHeaderOfList(context,
                  text: 'New', description: 'Super New Sale!'),
              const SizedBox(
                height: 8.0,
              ),
              SizedBox(
                height: 300,
                child: StreamBuilder<List<ProductModel>>(
                    stream: database.newProductsStream(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState ==
                          ConnectionState.active) {
                        final products = snapshot.data;
                        if (products == null || products.isEmpty) {
                          return const Center(
                            child: Text('No Data Available!'),
                          );
                        }
                        return ListView.builder(

                          itemCount: products.length,
                          itemBuilder: (_, int index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListItemHome(product: products[index]),
                          ),
                          scrollDirection: Axis.horizontal,
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget saleItemBuilder(BannerModel banner, context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        // Image.network(banner.imgUrl),
        CachedNetworkImage(
          imageUrl: banner.imgUrl,
          placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          width: double.infinity,
          fit: BoxFit.cover,
          //   height: size.height * 0.3,
        ),

        Opacity(
          opacity: 0.3,
          child: Container(
            width: double.infinity,
            height: size.height * 0.3,
            color: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Text(
            'Rose Scarf',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
