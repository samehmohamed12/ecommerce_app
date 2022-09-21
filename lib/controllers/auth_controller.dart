import 'package:ecommerce_app/controllers/database_controller.dart';
import 'package:ecommerce_app/models/user_data.dart';
import 'package:ecommerce_app/utilities/enums.dart';
import 'package:flutter/material.dart';

import '../services/auth.dart';
import '../utilities/constants.dart';

class AuthController with ChangeNotifier {
  final AuthBase auth;
  String email;
  String password;
  AuthFormType authFormType;
  final database =FirestoreDatabase('123');

  AuthController(
      {required this.auth,
      this.email = '',
      this.password = '',
      this.authFormType = AuthFormType.login});
  Future<void>submit()async{
   try{
     if(authFormType==AuthFormType.login){
       await auth.loginWithEmailAndPassword(email, password);

     }else{
     final user =  await auth.signUpWithEmailAndPassword(email, password);
       await database.setUserData(UserDataModel(email: email, uid:user?.uid ?? documentIdFromLocalData()));
     }
   }catch(e){
     rethrow;
   }
  }

  void toggleFormType() {
    final formType = authFormType == AuthFormType.login
        ? AuthFormType.register
        : AuthFormType.login;
    copyWith(email: '', password: '', authFormType: formType);
  }

  void updateEmail(String email) => copyWith(email: email);

  void updatePassword(String password) => copyWith(password: password);

  void copyWith({
    String? email,
    String? password,
    AuthFormType? authFormType,
  }) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.authFormType = authFormType ?? this.authFormType;
    notifyListeners();
  }
}
