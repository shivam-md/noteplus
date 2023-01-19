/// -- contains firebase method of sign-in, registration, sign-out.
///
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled1/models/firebase_user.dart';
import 'package:untitled1/models/login_user.dart';

class AuthServices {
  // initializing firebase authentication object
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // this will map firebase user into our model properties inside FirebaseUser
  FirebaseUser? firebaseUser(User? user) {
    return user != null ? FirebaseUser(uid: user.uid) : null;
  }
  // this will later be used on by our stream provider listener to check whenever firebaseAuth changes
  Stream<FirebaseUser?> get user {
    return _auth.authStateChanges().map(firebaseUser);
  }

  Future signInAnonymous() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      User? user = userCredential.user;
      return firebaseUser(user);
    } catch (e){
      return FirebaseUser(code: e.toString(), uid: null);
    }
  }

  Future signInEmailPassword(LoginUser _login) async {
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: _login.email.toString(), password: _login.password.toString());
      User? user = userCredential.user;
      return firebaseUser(user);
    } on FirebaseException catch(e){
      debugPrint('login with email and password error : $e');
      return FirebaseUser(code: e.code, uid: null);
    }
  }

  Future registerEmailPassword(LoginUser _login) async {
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: _login.email.toString(), password: _login.password.toString());
      User? user = userCredential.user;
      return firebaseUser(user);
    } on FirebaseException catch(e){
      return FirebaseUser(code: e.code,uid: null);
    } catch(e) {
      return FirebaseUser(code: e.toString(), uid: null);
    }
  }

  Future signOut() async {
    try{
      return await _auth.signOut();
    }catch(e) {
      return null;
    }
  }
}