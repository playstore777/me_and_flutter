import 'package:flutter/cupertino.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends ChangeNotifier {
  bool isNavTime = false;
  int counter = 0;
  String _secretText = '143+9';

  void secretTextSetter(String newSecretText) {
    _secretText = newSecretText;
  }

  String text = '';

  void isEqualsTo() {
    print('secretText : $_secretText');
    if (text == _secretText) {
      counter++;
      print(counter);
      if (counter == 3) {
        isNavTime = true;
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
    text = text.substring(0, text.length - 1);
  }
}
