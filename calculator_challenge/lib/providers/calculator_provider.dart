import 'package:flutter/cupertino.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends ChangeNotifier {
  bool isNavTime = false;
  int counter = 3;
  // String _secretText = '143+9';
  String newSecretKey = '143+9';

  void secretTextSetter(String newSecretText) {
    newSecretKey = newSecretText;
    print('set Secret to: $newSecretKey');
  }

  String getSecretText() {
    return newSecretKey;
  }

  void setSecretText(String newSecretText) {
    print('setter Secret');
    newSecretKey = newSecretText;
    print('secret set: ${secretText}');
  }

  String get secretText {
    print('secret from secretText(): $newSecretKey');
    return newSecretKey;
  }

  String text = '';

  void isEqualsTo() {
    isNavTime = false;
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
}
