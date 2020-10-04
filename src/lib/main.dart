import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioReferencia(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ItemTransferencia(Transferencia(100, '10000')),
          ItemTransferencia(Transferencia(200, '10001')),
        ],
      ),
      appBar: AppBar(
        title: const Text('Transferências'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text(_transferencia.valor.toString()),
          subtitle: Text(_transferencia.numeroConta)),
    );
  }
}

class Transferencia {
  final double valor;
  final String numeroConta;

  Transferencia(this.valor, this.numeroConta);
}

class FormularioReferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Criando Transferência"),
        ),
        body: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 24.0),
                  decoration: InputDecoration(
                      labelText: "Número da Conta", hintText: "0000"),
                )),
            Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 24.0),
                  decoration: InputDecoration(
                      icon: Icon(Icons.monetization_on),
                      labelText: "Valor",
                      hintText: "0000"),
                )),
            RaisedButton(
              onPressed: () {
                debugPrint('Clicou no confirmar');
              },
              child: Text("Confirmar"),
            )
          ],
        ));
  }
}
