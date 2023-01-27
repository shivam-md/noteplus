import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:untitled1/screens/homeScreen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  // PageDecoration pageDecoration(){
  //   return const PageDecoration(
  //
  //   );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        pages: <PageViewModel>[
          PageViewModel(
              title: "Learning Discipline",
              image: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/icons/empty.png'),
              ),
              body: "Learning and discipline are closely related concepts. Discipline refers to the actions and habits that are necessary to achieve a particular goal or task. It involves setting clear expectations and boundaries, as well as holding oneself accountable for meeting those expectations."
          ),
          PageViewModel(
              title: "Learning Discipline",
              image: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/icons/moon.png'),
              ),
              body: "Learning and discipline are closely related concepts. Discipline refers to the actions and habits that are necessary to achieve a particular goal or task. It involves setting clear expectations and boundaries, as well as holding oneself accountable for meeting those expectations."
          ),
          PageViewModel(
              title: "Learning Discipline",
              image: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/icons/day.png'),
              ),
              body: "Learning and discipline are closely related concepts. Discipline refers to the actions and habits that are necessary to achieve a particular goal or task. It involves setting clear expectations and boundaries, as well as holding oneself accountable for meeting those expectations."
          ),
          PageViewModel(
              title: "Learning Discipline",
              image: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/icons/app_logo.png'),
              ),
              body: "Learning and discipline are closely related concepts. Discipline refers to the actions and habits that are necessary to achieve a particular goal or task. It involves setting clear expectations and boundaries, as well as holding oneself accountable for meeting those expectations."
          ),
        ],
        done: const Text("Done",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20),),
        showNextButton: true,
        showSkipButton: true,
        skip: const Text('Skip',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20),),
        onSkip: () {
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (BuildContext context) => const HomeScreen()));
        },
        animationDuration: 400,
        freeze: true,
        onDone: () {
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (BuildContext context) => const HomeScreen()));
        },
        next: const Text('Next >',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20),)


      ),
    );
  }
}
