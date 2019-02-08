import 'package:flutter/material.dart';

class CalsFunctionButton extends StatelessWidget {
  final VoidCallback callBack;
  final Key key;
  final String str;
  final bool isAct;

  const CalsFunctionButton({this.callBack, this.key, this.str, this.isAct});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {},
          child: CircleAvatar(
            backgroundColor: isAct ? Colors.orange : Colors.transparent,
            radius: 30,
            child: Text(
              str,
              style: TextStyle(
                  fontSize: 50.0,
                  color: isAct ? Colors.transparent : Colors.orange),
            ),
          ),
        ),
      ),
    );
  }
}
