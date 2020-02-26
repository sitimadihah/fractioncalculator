import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> _operation = ['+', '-', '×', '÷'];

  String _currentItemSelected = '+';

  final TextEditingController _aNumerator = TextEditingController();
  final TextEditingController _bDenominator = TextEditingController();
  final TextEditingController _cNumerator = TextEditingController();
  final TextEditingController _dDenominator = TextEditingController();
  double nume1 = 0.0,
      deno1 = 0.0,
      nume2 = 0.0,
      deno2 = 0.0,
      nume3 = 0.0,
      deno3 = 0.0,
      result = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'lab 1',
      home: Scaffold(
        resizeToAvoidBottomPadding: false, //to prevent bottom overload
        backgroundColor: Color(0xFFFFEBEE),
        appBar: AppBar(
          title: Text('FRACTION NUMBER CALCULATOR'),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Row(
                  //row1
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    new Container(
                      //x1
                      width: 100,
                      child: TextField(
                        cursorWidth: 10,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          contentPadding: EdgeInsets.all(10),
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                          ),
                          filled: true,
                          fillColor: Color(0XFFFF9E80),
                        ),
                        keyboardType: TextInputType.numberWithOptions(),
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.amberAccent,
                          fontWeight: FontWeight.w700,
                        ),
                        controller: _aNumerator,
                      ),
                    ),
                    new Container(
                      width: 100, //x2
                      child: TextField(
                        cursorWidth: 10,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          hintText: "",
                          contentPadding: EdgeInsets.all(10),
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                          ),
                          filled: true,
                          fillColor: Color(0XFFFF9E80),
                        ),
                        keyboardType: TextInputType.numberWithOptions(),
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.amberAccent,
                          fontWeight: FontWeight.w700,
                        ),
                        controller: _bDenominator,
                      ),
                    ),
                  ],
                ),
                Row(
                    //row2
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(60, 0, 40, 0),
                        child: Text('_______________'),
                      ),
                      DropdownButton<String>(
                        items: _operation.map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        onChanged: (String newValueSelected) {
                          _onDropDownItemSelected(newValueSelected);
                        },
                        value: _currentItemSelected,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                        child: Text('_______________'),
                      ),
                    ]),
                Row(
                  //row4
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    new Container(
                      width: 100,
                      child: TextField(
                        cursorWidth: 10,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          hintText: "",
                          contentPadding: EdgeInsets.all(10),
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                          ),
                          filled: true,
                          fillColor: Color(0XFFFF9E80),
                        ),
                        keyboardType: TextInputType.numberWithOptions(),
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.amberAccent,
                          fontWeight: FontWeight.w700,
                        ),
                        controller: _cNumerator,
                      ),
                    ),
                    new Container(
                      width: 100,
                      child: TextField(
                        cursorWidth: 10,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          hintText: "",
                          contentPadding: EdgeInsets.all(10),
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                          ),
                          filled: true,
                          fillColor: Color(0XFFFF9E80),
                        ),
                        keyboardType: TextInputType.numberWithOptions(),
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.amberAccent,
                          fontWeight: FontWeight.w700,
                        ),
                        controller: _dDenominator,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    elevation: 5.0,
                    minWidth: 150.0,
                    height: 50,
                    color: Colors.redAccent,
                    splashColor: Colors
                        .indigoAccent, //make button splash when user clicked
                    child: Text(
                      "=",
                      style: TextStyle(
                        fontSize: 36.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    onPressed: _onPressed,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    elevation: 5.0,
                    minWidth: 150.0,
                    height: 50,
                    color: Colors.redAccent,
                    splashColor: Colors
                        .indigoAccent, //make button splash when user clicked
                    child: Text(
                      "Reset",
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.amberAccent,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    onPressed: _reset,
                  ),
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: Text(
                          "Result:",
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                        child: Text(
                          "$nume3",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: Text(
                          "______________",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: Text(
                          "$deno3",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }

  void _reset() {
    setState(() {
      _aNumerator.text = "";
      _bDenominator.text = "";
      _cNumerator.text = "";
      _dDenominator.text = "";
      nume3 = 0.0;
      deno3 = 0.0;
    });
  }

  void _onPressed() {
    setState(() {
      nume1 = double.parse(_aNumerator.text);
      deno1 = double.parse(_bDenominator.text);
      nume2 = double.parse(_cNumerator.text);
      deno2 = double.parse(_dDenominator.text);
      if (_currentItemSelected == '+') {
        deno3 = gcd(deno1, deno2);
        nume3 = (nume1 * deno2) + (deno1 * nume2);
        deno3 = deno1 * deno2;
      } else if (_currentItemSelected == '-') {
        deno3 = gcd(deno1, deno2);
        nume3 = (nume1 * deno2) - (deno1 * nume2);
        deno3 = deno1 * deno2;
      } else if (_currentItemSelected == '×') {
        deno3 = gcd(deno1, deno2);
        nume3 = nume1 * nume2;
        deno3 = deno1 * deno2;
      } else if (_currentItemSelected == '÷') {
        deno3 = gcd(deno1, deno2);
        nume3 = nume1 * deno2;
        deno3 = deno1 * nume2;
      }
      // simplestform();
    });
  }

  double gcd(double a, double b) {
    if (a == 0) {
      return b;
    } else {
      return gcd(b % a, a);
    }
  }

  //Function to convert the obtained fraction into it's simple form
  void simplestform() {
    double commonFactor = gcd(nume3, deno3);
    deno3 = deno3 / commonFactor;
    nume3 = nume3 / commonFactor;
  }
}
