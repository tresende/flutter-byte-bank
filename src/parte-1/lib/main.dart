import 'package:flutter/material.dart';
import 'package:bytebank/screens/transferencia/lista.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blue[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blue[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Scaffold(
        body: ListaTransferencia(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
