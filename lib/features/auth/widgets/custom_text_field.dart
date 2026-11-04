import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String labelText;
  final IconData prefixIcon;
  final bool isPassword;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  const CustomTextField({
    super.key,
     required this.labelText, 
     required this.prefixIcon, 
     this.isPassword=false, 
     this.keyboardType=TextInputType.text, 
     this.validator, 
     this.controller
     });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _isObscured;
  @override
  void initState(){
    super.initState();
    _isObscured=widget.isPassword;
  }
  @override
  Widget build(BuildContext context) {
    
    return TextFormField(
      controller:widget.controller,
    obscureText: _isObscured,
    keyboardType: widget.keyboardType,
    validator: widget.validator,
    
    decoration: InputDecoration(
      
      labelText: widget.labelText,
      prefixIcon: Icon(widget.prefixIcon,color:Colors.indigo),
      suffixIcon: widget.isPassword
      ?IconButton(
        onPressed: (){setState(() {
          _isObscured=!_isObscured;
        });
        }
        , icon: Icon(
          _isObscured?Icons.visibility_off:Icons.visibility,
          color:Colors.grey
        ),
        )
        :null,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.indigo, width: 2),
      )
    ),
    );
  }
}