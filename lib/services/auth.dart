import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthBase {
  User? get currentUser;
  Stream<User?> authStateChanges();
  Future<User?> loginWithEmailAndPassword(String email, String password);

  Future<User?> signUpWithEmailAndPassword(String email, String password);
  Future<void> signOut();
}

class Auth implements AuthBase {
  final fireBaseAuth = FirebaseAuth.instance;

  @override
  Future<User?> loginWithEmailAndPassword(String email, String password) async {
    final user = await fireBaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }

  @override
  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    final user = await fireBaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }
  @override
  Future<void>signOut()async{
   await fireBaseAuth.signOut();

  }

  @override
  Stream<User?> authStateChanges() {
    return fireBaseAuth.authStateChanges();
  }

  @override
  // TODO: implement currentUser
  User? get currentUser =>fireBaseAuth.currentUser;
}
