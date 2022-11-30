import 'dart:io';

import 'package:calculator_challenge/notes_main.dart';
import 'package:calculator_challenge/providers/calculator_provider.dart';
import 'package:calculator_challenge/screens/text_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _providerData;

  @override
  Widget build(BuildContext context) {
    _providerData = Provider.of<Calculator>(context, listen: false);
    return Column(
      children: [
        displayScreen(context),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: _calculatorButton(
                    Colors.red,
                    'C',
                    MediaQuery.of(context).size.height,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: _calculatorButton(
                    Colors.blue,
                    'Del',
                    MediaQuery.of(context).size.height,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: _calculatorButton(
                    Colors.blue,
                    '/',
                    MediaQuery.of(context).size.height,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: _calculatorButton(
                    Colors.blue,
                    '*',
                    MediaQuery.of(context).size.height,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: _calculatorButton(
                    Colors.grey,
                    '7',
                    MediaQuery.of(context).size.height,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: _calculatorButton(
                    Colors.grey,
                    '8',
                    MediaQuery.of(context).size.height,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: _calculatorButton(
                    Colors.grey,
                    '9',
                    MediaQuery.of(context).size.height,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: _calculatorButton(
                    Colors.blue,
                    '-',
                    MediaQuery.of(context).size.height,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: _calculatorButton(
                    Colors.grey,
                    '4',
                    MediaQuery.of(context).size.height,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: _calculatorButton(
                    Colors.grey,
                    '5',
                    MediaQuery.of(context).size.height,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: _calculatorButton(
                    Colors.grey,
                    '6',
                    MediaQuery.of(context).size.height,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: _calculatorButton(
                    Colors.grey,
                    '.',
                    MediaQuery.of(context).size.height,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: _calculatorButton(
                    Colors.grey,
                    '1',
                    MediaQuery.of(context).size.height,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: _calculatorButton(
                    Colors.grey,
                    '2',
                    MediaQuery.of(context).size.height,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: _calculatorButton(
                    Colors.grey,
                    '3',
                    MediaQuery.of(context).size.height,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: _calculatorButton(
                    Colors.grey,
                    '0',
                    MediaQuery.of(context).size.height,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: _calculatorButton(
                    Colors.blue,
                    '+',
                    MediaQuery.of(context).size.height,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: _calculatorButton(
                    Colors.red,
                    '=',
                    MediaQuery.of(context).size.height,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _calculatorButton(Color color, String symbol, double height) {
    return GestureDetector(
      onLongPress: () {
        print('On looooooooooooong press: ' + symbol);
        if (symbol == '+') {
          _providerData.setSecretMode();
        }
      },
      onDoubleTap: () {
        print('On double double tap: ' + symbol);
      },
      onTap: () {
        if (symbol == 'C') {
          _providerData.clear();
          setState(() {});
        } else if (symbol == 'Del') {
          _providerData.backspace();
          setState(() {});
        } else if (symbol == "=") {
          _providerData.isEqualsTo();
          setState(() {});
          if (_providerData.isNavTime) {
            // print('context in _calculatorButton: $context');
            Navigator.of(context)
                .push(MaterialPageRoute(builder: ((ctx) => AppEntry(context))));
            return;
          }
        } else {
          _providerData.text += symbol;
          setState(() {});
          print('text : ${_providerData.text}');
        }
      },
      child: Container(
        // height: height * 0.097,
        child: Center(
          child: Text(
            symbol,
            style: TextStyle(
              fontSize: height * 0.05,
              color: Colors.white,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: color,
        ),
      ),
    );
  }

  Container displayScreen(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.38,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              // color: Colors.black,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              '${_providerData.text}',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.04,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void afterNavigatorPop() {
    setState(() {});
  }
}
