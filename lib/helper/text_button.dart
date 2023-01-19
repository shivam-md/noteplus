import 'package:flutter/material.dart';

class BasicTextButton extends StatefulWidget {
  const BasicTextButton({Key? key, required this.text, required this.callback}) : super(key: key);
  final String text;
  final Function callback;

  @override
  State<BasicTextButton> createState() => _BasicTextButtonState();
}

class _BasicTextButtonState extends State<BasicTextButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextButton(
        onPressed: (){
         widget.callback();
        },
        child: Text(widget.text, style: const TextStyle(color: Colors.deepPurple),),
      ),
    );
  }
}
