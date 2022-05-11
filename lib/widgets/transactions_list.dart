import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transactions.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> transactions;
  const TransactionList({
    Key? key,
    required this.transactions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {
          return Card(
            //color: Colors.blueAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Price section
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.purple,
                      style: BorderStyle.solid,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    '\$' + transactions[index].amount,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // this is the details section
                Column(
                  children: [
                    Text(
                      transactions[index].title,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 122, 0, 143),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //const SizedBox(height: 20),
                    Text(
                      DateFormat.yMMMMEEEEd()
                          .format(transactions[index].dateTime),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
