import 'package:ecommerce_app/services/auth.dart';
import 'package:ecommerce_app/utilities/router.dart';
import 'package:ecommerce_app/utilities/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void>  main ()async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (_)=>Auth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Colors.white,foregroundColor: Colors.black),
            inputDecorationTheme: InputDecorationTheme(
              labelStyle: Theme.of(context).textTheme.subtitle1,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2.0),
                  borderSide: const BorderSide(
                      color: Colors.grey
                  )
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2.0),
                  borderSide: const BorderSide(
                      color: Colors.grey
                  )
              ),
              errorBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2.0),
                  borderSide: const BorderSide(
                      color: Colors.grey
                  )
              ),
              focusedErrorBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2.0),
                  borderSide: const BorderSide(
                      color: Colors.grey
                  )
              ),
            ),
            scaffoldBackgroundColor: const Color(0xFFE5E5E5),
            primaryColor: Colors.red),
        onGenerateRoute: onGenerate,
        initialRoute: AppRoute.landingPageRoute,
      ),
    );
  }
}


