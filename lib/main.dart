import 'package:flutter/material.dart';
import 'package:flutter_my_calc/ui/cals_function_button.dart';
import 'package:flutter_my_calc/ui/num_button.dart';

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
  Key _reversely = Key("reversely");
  Key _rest = Key("rest");
  Key _point = Key("point");
  Key _equal = Key("equal");

  TextEditingController _textEditingController;
  var height;
  var width;

  NumButton _numButton(String str, Key key) {
    return NumButton(
      str: str,
      key: key,
      callBack: () {},
    );
  }

  CalsFunctionButton _calsFunctionKey(String str, Key key) {
    return CalsFunctionButton(
      key: key,
      str: str,
      callBack: () {},
      isAct: false,
    );
  }

  Widget _makeMiddleKey(List<String> nameList, List<Key> numKeyList) {
    return Expanded(
      child: Row(
        children: <Widget>[
          _numButton(nameList[0], numKeyList[0]),
          _numButton(nameList[1], numKeyList[1]),
          _numButton(nameList[2], numKeyList[2]),
          _calsFunctionKey(nameList[3], numKeyList[3]),
        ],
      ),
    );
  }

  Widget _makeTopKey(List<String> nameList, List<Key> numKeyList) {
    return Expanded(
      child: Row(
        children: <Widget>[
          _calsFunctionKey(nameList[0], numKeyList[0]),
          _calsFunctionKey(nameList[1], numKeyList[1]),
          _calsFunctionKey(nameList[2], numKeyList[2]),
          _calsFunctionKey(nameList[3], numKeyList[3]),
        ],
      ),
    );
  }

  Widget _makeBottomKey(List<String> nameList, List<Key> numKeyList) {
    return Expanded(
      child: Row(
        children: <Widget>[
          _numButton(nameList[0], numKeyList[0]),
          _calsFunctionKey(nameList[1], numKeyList[1]),
          _calsFunctionKey(nameList[2], numKeyList[2]),
        ],
      ),
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
      backgroundColor: Colors.black,
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
                cursorColor: Colors.transparent,
                autofocus: true,
                textAlign: TextAlign.right,
                decoration: InputDecoration.collapsed(
                    hintText: "0",
                    hintStyle: TextStyle(fontSize: 60.0),
                    border: OutlineInputBorder(),
                    fillColor: Colors.teal),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: <Widget>[
                  _makeTopKey(
                      ["C", "R", "%", "/"], [_clear, _reversely, _rest, _div]),
                  _makeMiddleKey(
                      ["7", "8", "9", "*"], [_num7, _num8, _num9, _mul]),
                  _makeMiddleKey(
                      ["4", "5", "6", "-"], [_num4, _num5, _num6, _sub]),
                  _makeMiddleKey(
                      ["1", "2", "3", "+"], [_num1, _num2, _num3, _add]),
                  _makeBottomKey(["0", ".", "="], [_num0, _point, _equal]),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
