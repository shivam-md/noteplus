import 'package:flutter/material.dart';
import 'package:untitled1/helper/basic_button.dart';
import 'package:untitled1/helper/text_button.dart';
import 'package:untitled1/helper/unique_form_field.dart';
import 'package:untitled1/models/login_user.dart';
import 'package:untitled1/services/auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key, required this.toggle}) : super(key: key);
  final Function toggle;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  registerButtonFunction() async{
    debugPrint("Register Button Working");
    if(formKeySignUp.currentState!.validate()){
      print("Form Submission Successful");
      AuthServices _auth = AuthServices();
      dynamic result = await _auth.registerEmailPassword(loginUser);
      print("registration error : ${result.code}");
    }
    else{
      print("Registration Failed");
    }
  }

  void navigateToSignIn() {
    widget.toggle();
  }

  final formKeySignUp = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  late LoginUser loginUser = LoginUser(email.text, password.text);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
            key: formKeySignUp,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 const Padding(
                    padding: EdgeInsets.only(left: 20,top: 120),
                    child: Text('Note', style: TextStyle(fontSize: 65, fontWeight: FontWeight.w900, color: Colors.deepPurpleAccent,),textAlign: TextAlign.left,),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20,top: 2, bottom: 30),
                    child: Text('Taking', style: TextStyle(fontSize: 65, fontWeight: FontWeight.w900, color: Colors.deepPurple,),textAlign: TextAlign.left,),
                  ),
                  UniqueFormField(hint: 'Email',textEditingController: email,),
                  const SizedBox(height: 20,),
                  UniqueFormField(hint: 'Password',password: true,textEditingController: password,),
                  const SizedBox(height: 25,),
                  BasicButton(data: 'SIGN UP',callBack: registerButtonFunction),
                  const SizedBox(height: 2,),
                  BasicTextButton(text: "Already have a account? Sign In", callback: navigateToSignIn),
                ],
              ),
            ),
          )
      ),
    );
  }
}
