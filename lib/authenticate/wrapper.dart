import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/authenticate/handler.dart';
import 'package:untitled1/models/firebase_user.dart';
import 'package:untitled1/screens/homeScreen.dart';
import 'package:untitled1/screens/introduction_screen/onboardingScreen.dart';

/// wrapper acts as middleware that is used to filter authenticated and redirect them to the home screen
/// else if they are redirected to handler to get them to either login or register.


class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser?>(context);

    if(user == null) {
      return const Handler();
    }
    else {
      return const OnBoardingScreen();
    }
  }
}
