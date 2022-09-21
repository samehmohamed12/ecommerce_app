import 'dart:ffi';

import 'package:ecommerce_app/controllers/database_controller.dart';
import 'package:ecommerce_app/utilities/routes.dart';
import 'package:ecommerce_app/views/pages/checkout/checkout_page.dart';
import 'package:ecommerce_app/views/pages/product_details_page.dart';
import 'package:ecommerce_app/views/pages/sale_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../views/pages/Auth_page.dart';
import '../views/pages/bottom_navbar.dart';
import '../views/pages/landing_page.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoute.loginPageRoute:
      return CupertinoPageRoute(builder: (_) => AuthPage(), settings: settings);
    case AppRoute.checkoutPageRoute:
      final database=settings.arguments as Database;
      return CupertinoPageRoute(builder: (_) =>Provider.value(
          value: database,
          child: const CheckoutPage()), settings: settings);
    case AppRoute.salePageRoute:
      return CupertinoPageRoute(builder: (_) => const SalePage(), settings: settings);
    case AppRoute.bottomNavBarRoute:
      return CupertinoPageRoute(
          builder: (_) => BottomNavBar(), settings: settings);
    case AppRoute.productDetailsRoute:
      final args=settings.arguments as Map<String ,dynamic>;
      final product=args['product'];
      final database=args['database'];
      return CupertinoPageRoute(
          builder: (_) =>Provider<Database>.value(value:database,child: ProductDetails(product: product,)), settings: settings,);
    case AppRoute.landingPageRoute:
    default:
      return CupertinoPageRoute(
          builder: (_) => const LandingPage(), settings: settings);

  }
}
