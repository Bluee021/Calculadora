import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Display extends StatefulWidget {
  const Display({Key? key, required this.text, required this.operation}) : super(key: key);
  final String text;
  final String operation;
  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  @override
  Widget build(BuildContext context) {
    return 
    //     Expanded(
    //   flex: 1,
    //   child: Container(
    //     color: Color.fromRGBO(48, 48, 48, 1),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.stretch,
    //       mainAxisAlignment: MainAxisAlignment.end,
    //       children: [
    //       Padding(
    //         padding: EdgeInsets.all(8), 
    //         child: AutoSizeText(
    //           widget.operation,
    //           minFontSize: 12,
    //           maxFontSize: 20,
    //           maxLines: 1,
    //           textAlign: TextAlign.end,
    //           style: TextStyle(letterSpacing: 0,fontWeight: FontWeight.w100,
    //           decoration: TextDecoration.none,
    //           fontSize: 20,
    //           color: Colors.white
    //           ),
    //           ),)
    //     ]),
    // )),
    Expanded(
      flex: 4,
      child: Container(
        color: Color.fromRGBO(48, 48, 48, 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          Padding(
            padding: EdgeInsets.all(8), 
            child: AutoSizeText(
              widget.text,
              minFontSize: 20,
              maxFontSize: 80,
              maxLines: 1,
              textAlign: TextAlign.end,
              style: TextStyle(letterSpacing: 0,fontWeight: FontWeight.w100,
              decoration: TextDecoration.none,
              fontSize: 80,
              color: Colors.white
              ),
              ),)
        ]),
    ));
  }
}