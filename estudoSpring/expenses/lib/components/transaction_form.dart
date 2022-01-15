
import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {

  final void Function(String,double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final title = TextEditingController();

  final value = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation:5 ,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: title ,
              decoration: const InputDecoration(
                labelText: 'Titulo',
              ),

            ),
            TextField(
                controller: value,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: 'Valor (R\$)',
                )
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  onPressed: (){
                  final titles = title.text;
                  final values = double.tryParse(value.text) ?? 0.0;
                  widget.onSubmit(titles,values);
                  },
                  child: const Text("Nova Transacao"),
                  textColor: Theme.of(context).primaryColor,
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
