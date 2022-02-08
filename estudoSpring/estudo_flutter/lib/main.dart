import 'package:estudo_flutter/transferencia.dart';
import 'package:flutter/material.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final TextEditingController _controladorNumeroConta = TextEditingController();

  final TextEditingController _controladorValor = TextEditingController();

  String teste() {
    return "teste";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Will"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Editor(controller: _controladorNumeroConta,
                   rotulo:"Numero da conta"
            ),
            Editor(controller: _controladorValor,
                   rotulo:"Valor",
                   icon: Icons.monetization_on
            ),

            Handler(_controladorNumeroConta.text,
                    _controladorValor.text
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}

class Editor extends StatelessWidget {

    final TextEditingController controller;
    final String rotulo;
    final IconData? icon ;

    Editor({ required this.controller,
             required this.rotulo,
             this.icon
    });


  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: controller,
      style: const TextStyle(
          fontSize: 10.0
      ),
      decoration: InputDecoration(
        icon: Icon(icon),
        labelText: rotulo,
      ),
      keyboardType: const TextInputType.numberWithOptions(),
    );
  }
}

class Handler extends StatelessWidget {
  final String conta ;
  final String valor;

  Handler(this.conta, this.valor);

  @override
  Widget build(BuildContext context) {
    return   RaisedButton(
      child: const Text("Confirma"),
      onPressed: () {
        final int numConta = int.parse(this.conta);
        final double? valor = double.tryParse(this.valor);

        if (numConta != null && valor != null) {
          final transferencia = Transferencia(valor, numConta);
        }
      },
    );
  }
}





