import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:transactioner/models/transactions.dart';
import 'package:transactioner/widgets/charts_bar.dart';

class Charts extends StatelessWidget {
  List<Transactions> recentTransactions;
  Charts({
    Key? key,
    required this.recentTransactions,
  }) : super(key: key);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(Duration(days: index));
        var totalSum = 0;
        for (var i = 0; i < recentTransactions.length; i++) {
          if (recentTransactions[i].dateTime.day == weekDay.day &&
              recentTransactions[i].dateTime.month == weekDay.month &&
              recentTransactions[i].dateTime.year == weekDay.year) {
            totalSum += int.parse(recentTransactions[i].amount);
          }
        }
        // print(DateFormat.E().format(weekDay));
        // print(totalSum);
        return {
          'day': DateFormat.E().format(weekDay),
          'amount': totalSum.toString()
        };
      },
    );
  }

  double get maxSpending {
    return groupedTransactionValues.fold(0, (sum, item) {
      return sum += (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: groupedTransactionValues.map(
            (data) {
              // return Text(data['day'].toString() + ':'+ data['amount']);
              return Flexible(
                fit: FlexFit.tight,
                child: Bars(
                  label: data['day'].toString(),
                  spendingAmount: double.parse(data['amount'].toString()),
                  spendingAmountPercentage: maxSpending == 0.0
                      ? 0.0
                      : (data['amount'] as double) / maxSpending,
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
