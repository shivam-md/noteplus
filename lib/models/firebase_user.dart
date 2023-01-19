// -- this is the property that will be used on mapping firebase user during authentication.

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUser{
  final String? uid; // identifier if the user is authenticated.
  final String? code; // firebase catch code to identify error response

  FirebaseUser({this.uid, this.code});

}