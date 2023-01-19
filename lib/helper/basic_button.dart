import 'package:flutter/material.dart';

class BasicButton extends StatefulWidget {
  final String data;
  final Function callBack;
  const BasicButton({Key? key, required this.data,required this.callBack}) : super(key: key);

  @override
  State<BasicButton> createState() => _BasicButtonState();
}

class _BasicButtonState extends State<BasicButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(

        style: ButtonStyle(minimumSize: MaterialStateProperty.all(const Size(350, 50),),backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent)),
        onPressed: (){
          try {
            widget.callBack();
          }catch(e){
            print("basic button error : $e");
          }
        },
        child: Text(widget.data, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
      ),
    );
  }
}
