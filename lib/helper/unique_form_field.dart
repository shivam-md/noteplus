import 'package:flutter/material.dart';
import 'package:untitled1/util/validator_string_values.dart';
class UniqueFormField extends StatefulWidget {
  const UniqueFormField({Key? key, required this.hint, this.password = false,required this.textEditingController}) : super(key: key);
  final String? hint;
  final bool password;
  final TextEditingController textEditingController;


  @override
  State<UniqueFormField> createState() => _UniqueFormFieldState();
}

class _UniqueFormFieldState extends State<UniqueFormField> {
  bool showObscureIcon = true;
  dynamic passwordField(){
   if (widget.password == false) {
     return const SizedBox(width: 0,height: 0,);
   }
   else if (showObscureIcon) {
     return const Icon(Icons.visibility_sharp);
   }
   else {
     return const Icon(Icons.visibility_off_sharp);
   }
  }

  @override
  Widget build(BuildContext context) {
    //final TextEditingController textController = TextEditingController();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),

      child: TextFormField(
        controller: widget.textEditingController,
        autofocus: false,
        obscureText: widget.password,
        validator: (value) {
          Validator validator = Validator(value: value,isPasswordField: widget.password);
          return validator.recogniseType();
        },
        decoration: InputDecoration(
          hintText: widget.hint,
          suffixIcon: IconButton(
            icon: passwordField(),
            onPressed: () {
              setState(() {
                showObscureIcon = !showObscureIcon;
              });
            },
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2, strokeAlign: StrokeAlign.outside),
          ),


        ),
      ),
    );
  }
}



