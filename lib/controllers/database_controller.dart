import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/models/add_to_cart.dart';
import 'package:ecommerce_app/models/banner.dart';
import 'package:ecommerce_app/models/user_data.dart';
import 'package:ecommerce_app/services/firestore_services.dart';
import 'package:ecommerce_app/utilities/api_path.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/delivery_methods.dart';
import '../models/product.dart';

abstract class Database {
  Stream<List<ProductModel>> salesProductsStream();

  Stream<List<ProductModel>> newProductsStream();

  Stream<List<AddToCartModel>> myProductsCartStream();

  Stream<List<BannerModel>> bannerStream();
  Stream<List<DeliveryMethodsModel>> deliveryMethodsStream();

  Future<void> setUserData(UserDataModel userData);

  Future<void> addToCart(AddToCartModel addToCart);
}

class FirestoreDatabase implements Database {
  final String uid;
  final _service = FirestoreServices.instance;

  FirestoreDatabase(this.uid);

  @override
  Stream<List<ProductModel>> salesProductsStream() =>
      _service.collectionsStream(
          path: ApiPath.products(),
          builder: (data, documentId) =>
              ProductModel.fromMap(data!, documentId),
          queryBuilder: (query) =>
              query.where('discountValue', isNotEqualTo: 0));

  @override
  Stream<List<ProductModel>> newProductsStream() => _service.collectionsStream(
        path: ApiPath.products(),
        builder: (data, documentId) => ProductModel.fromMap(data!, documentId),
      );

  @override
  Stream<List<BannerModel>> bannerStream() => _service.collectionsStream(
        path: ApiPath.banners(),
        builder: (data, documentId) => BannerModel.fromMap(data!, documentId),
      );

  Future addToCart(AddToCartModel addToCart) async => _service.setData(
      path: ApiPath.addToCart(uid, addToCart.id), data: addToCart.toMap());

  @override
  Future<void> setUserData(UserDataModel userData) async => await _service
      .setData(path: ApiPath.users(userData.uid), data: userData.toMap());

  @override
  Stream<List<AddToCartModel>> myProductsCartStream() => _service
      .collectionsStream(
          path: ApiPath.myProductsCart(uid),
          builder: (data, documentId) =>
              AddToCartModel.fromMap(data!, documentId));

  @override
  Stream<List<DeliveryMethodsModel>> deliveryMethodsStream()=>_service.collectionsStream(path: ApiPath.deliveryMethods(), builder: (data,documentId)=>DeliveryMethodsModel.fromMap(data!, documentId));
}
