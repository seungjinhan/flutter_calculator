import 'package:flutter/material.dart';

class NumButton extends StatelessWidget {
  final String str;
  final Key key;
  final VoidCallback callBack;

  NumButton({this.str, this.key, this.callBack});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {},
          child: CircleAvatar(
            backgroundColor: Colors.blueAccent,
            radius: 40,
            child: Text(
              str,
              style: TextStyle(fontSize: 50.0, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
