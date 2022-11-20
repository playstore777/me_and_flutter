import 'package:calculator_challenge/providers/calculator_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextScreen extends StatelessWidget {
  final ctx;
  TextScreen(this.ctx);
  @override
  Widget build(BuildContext context) {
    print('ctx: $ctx');
    print('context: $context');
    final _providerData = Provider.of<Calculator>(ctx[0], listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Heyy!!!'),
      ),
      body: Center(
        child: Text('Provider Data: ${_providerData.getSecretText()}'),
      ),
    );
  }
}
