import 'package:flutter/material.dart';
import 'package:untitled1/helper/basic_button.dart';
import 'package:untitled1/helper/text_button.dart';
import 'package:untitled1/helper/unique_form_field.dart';
import 'package:untitled1/models/login_user.dart';
import 'package:untitled1/screens/registerScreen.dart';
import 'package:untitled1/services/auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key,required this.toggle}) : super(key: key);
  final Function toggle;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final String email = 'Email';
  final String appName = 'NoteTaking';
  final TextEditingController passwordField = TextEditingController();
  final TextEditingController emailField = TextEditingController();
  final dynamic formKey = GlobalKey<FormState>();
  late LoginUser loginUser = LoginUser(emailField.text,passwordField.text);

  Future callBack() async{
    if(formKey.currentState!.validate()) {
      //widget.toggle();
      print("Form Submission Successful");

      AuthServices _auth = AuthServices();
      dynamic result =await _auth.signInEmailPassword(loginUser);

      if(result.uid == null) {
        print("signin unsuccessful");
      }
    }
    else{
      print("form submission unsuccessful");
    }

  }
  
  void navigationToRegister(){
    widget.toggle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20,top: 100),
                  child: Text('Note', style: TextStyle(fontSize: 65, fontWeight: FontWeight.w900, color: Colors.deepPurpleAccent,),textAlign: TextAlign.left,),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20,top: 2),
                  child: Text('Taking', style: TextStyle(fontSize: 65, fontWeight: FontWeight.w900, color: Colors.deepPurple,),textAlign: TextAlign.left,),
                ),
                const SizedBox(height: 30,),
                UniqueFormField(hint: email,textEditingController: emailField,),
                const SizedBox(height: 20,),
                UniqueFormField(hint: 'Password',password: true,textEditingController: passwordField,),
                const SizedBox(height: 20,),
                BasicButton(data: 'Login',callBack: callBack,),
                const SizedBox(height: 2,),
                BasicTextButton(text: "Don't have an account? SignUp", callback: navigationToRegister),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

