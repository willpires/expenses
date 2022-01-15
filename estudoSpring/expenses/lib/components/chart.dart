import 'package:expenses/components/chart_bar.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {

  final List<Transaction> recenTransaction;

  Chart(this.recenTransaction);

  List<Map<String,Object>> get groupdTransactions {
    return List.generate(7, (index){
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      for(var i = 0; i<recenTransaction.length; i++){

        bool sameDay = recenTransaction[i].date.day == weekDay.day;
        bool sameMonth = recenTransaction[i].date.month == weekDay.month;
        bool sameYear = recenTransaction[i].date.year == weekDay.year;

        if(sameDay && sameMonth && sameYear){
          totalSum+= recenTransaction[i].value;
        }

      }

      return { 'day': DateFormat.E().format(weekDay)[0],'value': totalSum };
    });
  }

  double get  _weekTotalValue {
    return groupdTransactions.fold(0.0, (sum, item){
      var a  = item['value'] as double;
      return sum + a;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:
            groupdTransactions.map((tr){
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                  label: tr['day'] as String,
                  value: tr['value'] as double,
                  percentage: (tr['value'] as double) /_weekTotalValue ,
                ),
              );
    }).toList()

        ),
      ),
    );
  }
}
