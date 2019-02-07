import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Cals(),
    );
  }
}

class Cals extends StatefulWidget {
  @override
  _CalsState createState() => _CalsState();
}

class _CalsState extends State<Cals> {
  Key _num1 = Key("n1");
  Key _num2 = Key("n2");
  Key _num3 = Key("n3");
  Key _num4 = Key("n4");
  Key _num5 = Key("n5");
  Key _num6 = Key("n6");
  Key _num7 = Key("n7");
  Key _num8 = Key("n8");
  Key _num9 = Key("n9");
  Key _num0 = Key("n0");
  Key _add = Key("add");
  Key _sub = Key("sub");
  Key _mul = Key("mul");
  Key _div = Key("div");
  Key _clear = Key("clear");
  Key _back = Key("back");
  Key _selectKey;

  TextEditingController _textEditingController;
  var height;
  var width;

  NumButton numButton(String str, Key key) {
    return NumButton(
      child: Text(
        str,
        style: TextStyle(fontSize: 50.0),
      ),
      key: key,
      callBack: () {},
    );
  }

  CalsButton calsButton(String str, Key key) {
    return CalsButton(
      key: key,
      str: str,
      callBack: () {},
      isAct: false,
    );
  }

  @override
  void initState() {
    super.initState();
    this._textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.bottomRight,
            width: width,
            height: (height / 100) * 15,
            child: IgnorePointer(
              ignoring: true,
              child: TextField(
                controller: this._textEditingController,
                enabled: true,
                autofocus: true,
                textAlign: TextAlign.right,
                decoration: InputDecoration.collapsed(
                    hintText: "0",
                    hintStyle: TextStyle(fontSize: 60.0),
                    border: UnderlineInputBorder()),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        numButton("1", _num1),
                        numButton("2", _num2),
                        numButton("3", _num3),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        numButton("4", _num4),
                        numButton("5", _num5),
                        numButton("6", _num6),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        numButton("7", _num7),
                        numButton("8", _num8),
                        numButton("9", _num9),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        calsButton("C", _clear),
                        numButton("0", _num0),
                        calsButton("<<", _back),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        calsButton("+", _add),
                        calsButton("-", _sub),
                        calsButton("*", _mul),
                        calsButton("/", _div),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CalsButton extends StatelessWidget {
  final VoidCallback callBack;
  final Key key;
  final String str;
  final bool isAct;

  const CalsButton({this.callBack, this.key, this.str, this.isAct});

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

class NumButton extends StatelessWidget {
  final Widget child;
  final Key key;
  final VoidCallback callBack;

  NumButton({this.child, this.key, this.callBack});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        child: InkResponse(
          child: Container(
            alignment: Alignment.center,
            child: child,
          ),
        ),
      ),
    );
  }
}
