//this file will handle all the method that would be require that is signin and signup
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/src/models/my_user.dart';
import 'package:user_repository/src/user_repo.dart';

class FirebaseUserRepository implements UserRepository {
  FirebaseUserRepository({
    FirebaseAuth? firebaseAuth,
  }) : firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;
  final FirebaseAuth firebaseAuth;
  @override
  Future<void> Sigin(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<void> Signup(MyUser myuser, String password) async {
    try {
      UserCredential user = await firebaseAuth.createUserWithEmailAndPassword(
          email: myuser.email, password: password);
      myuser = myuser.copyWith(id: user.user!.uid);
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<void> logout() async{
    try{
     await firebaseAuth.signOut();
    }
    catch(e){
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> resetPassword(String email) async{
    try{
      firebaseAuth.sendPasswordResetEmail(email: email);
    }
    catch(e){
      log(e.toString());
    }
  }
}
