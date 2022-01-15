

import 'dart:ui';

import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class  TransactionList extends StatelessWidget {

 final List<Transaction> lista;

  TransactionList({required this.lista});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: lista.isEmpty?Column(
        children: [
          Text("Nenhum transacao cadastrada"),
          SizedBox(height: 20),
          Container(
            height: 200,
            child: Image.asset(
              "assets/images/waiting.png",
               fit: BoxFit.cover, ),
          )
        ],
      ):ListView.builder(
        itemCount: lista.length,
        itemBuilder: (ctx,index){
          final e = lista[index];
          return Card(
              child: Row(
                children: [
                  Container (
                    margin:const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 15
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 2,
                        )
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "R\$ ${e.value.toStringAsFixed(2)}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        e.title,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,

          ),
                      ),
                      Text(
                        DateFormat('d MMM y').format(e.date)
                        ,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                        ),
                      )
                    ],
                  )
                ],
              )

          );
        },

      ),
    );
  }
}
