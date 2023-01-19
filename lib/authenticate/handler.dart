import 'package:flutter/material.dart';
import 'package:untitled1/screens/loginScreen.dart';
import 'package:untitled1/screens/registerScreen.dart';

class Handler extends StatefulWidget {
  const Handler({Key? key}) : super(key: key);

  @override
  State<Handler> createState() => _HandlerState();
}

class _HandlerState extends State<Handler> {

  bool showLogin = true;

  void toggleView() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {

    if(showLogin) {
      return LoginScreen(toggle: toggleView,);
    }
    else {
      return RegisterScreen(toggle: toggleView);
    }
  }
}
