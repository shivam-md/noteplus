import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled1/authenticate/wrapper.dart';
import 'package:untitled1/screens/homeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4),
    ()=>Navigator.pushReplacement(context,MaterialPageRoute(builder:(context) => const Wrapper())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.deepPurple,
        ),
        child: const Center(
          child: Text('NoteTaking',style: TextStyle(fontSize: 50,color: Colors.white, fontWeight: FontWeight.w900),),
        ),
      ),
    );
  }
}
