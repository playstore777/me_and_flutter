import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends ChangeNotifier {
  bool isNavTime = false;
  int counter = 3;
  bool _isSecretModeOn = false;
  // String _secretText = '143+9';
  String newSecretKey = '143+9';

  void secretTextSetter(String newSecretText) {
    newSecretKey = newSecretText;
    print('set Secret to: $newSecretKey');
  }

  String getSecretText() {
    print('secret from secretText(): $newSecretKey');
    return newSecretKey;
  }

  void setSecretMode() {
    _isSecretModeOn = !_isSecretModeOn;
    print('set SecretMode to: $_isSecretModeOn');
  }

  bool getSecretModeStatus() {
    print('secret from secretText(): $_isSecretModeOn');
    return _isSecretModeOn;
  }

  String text = '';

  void isEqualsTo() {
    isNavTime = false;
    validateSecret();
    var expression = text;
    Parser p = Parser();
    Expression exp = p.parse(expression);
    ContextModel cm = ContextModel();
    text = '${exp.evaluate(EvaluationType.REAL, cm)}';
    notifyListeners();
  }

  void clear() {
    text = '';
  }

  void backspace() {
    if (text.length > 0) {
      text = text.substring(0, text.length - 1);
    }
  }

  String convertToText() {
    List<String> textList = text.split('+');
    List<int> numList = [];
    textList.forEach((num) => numList.add(int.parse(num)));
    print('textList: ' + textList.toString());
    var asciiDecoder = AsciiDecoder();
    final String result = asciiDecoder.convert(numList);
    print('Result from secretProcess: ' + result);
    return result;
  }

  void validateSecret() {
    if (!_isSecretModeOn) {
      if (text == newSecretKey) {
        print('secretText in isEqualsTo() : $newSecretKey');
        counter--;
        print('1 counter: $counter');
        if (counter <= 0) {
          isNavTime = true;
          counter = 3;
          print('2 counter: $counter');
        }
      }
    } else {
      if (convertToText() == newSecretKey) {
        isNavTime = true;
        setSecretMode();
      }
    }
  }
}
