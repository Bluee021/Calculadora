import 'package:flutter/material.dart';
class Button extends StatelessWidget {
  static const DARK = Color.fromRGBO(82, 82, 82, 1);
  static const DEFAULT = Color.fromRGBO(112, 112, 112, 1);
  static const OPERATION = Color.fromARGB(255, 202, 137, 16);
  
  const Button({
    Key? key, 
    required this.cb,
    required this.text,
    this.big = false,
    this.color = DEFAULT,
    }) : super(key: key);

  const Button.big({
    Key? key, 
    required this.cb,
    required this.text,
    this.big = true,
    this.color = DEFAULT,
    }) : super(key: key);

  const Button.operation({
    Key? key, 
    required this.cb,
    required this.text,
    this.big = false,
    this.color = OPERATION,
    }) : super(key: key);


  final Function(String) cb;
  final String text;
  final bool big;
  final Color color;

  @override
  Widget build(BuildContext context) {
    
    return Expanded(
      flex: big ? 2 : 1,
      child: OutlinedButton (
        child: Text(text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300
          ),
        ) ,
        onPressed: () => cb(text),
        style: OutlinedButton.styleFrom(
          backgroundColor: color,
          shadowColor: Colors.white
        ),
    ),);
  }
}