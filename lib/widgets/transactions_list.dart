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
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No Transactions yet...',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Container(
                  height: 300,
                  child: Image.asset(
                    'assets/images/404.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            )
          : ListView.builder(
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
                            color: const Color.fromARGB(255, 165, 90, 155),
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
                            style: Theme.of(context).textTheme.titleMedium,
                            // style: const TextStyle(
                            //   color: Color.fromARGB(255, 122, 0, 143),
                            //   fontWeight: FontWeight.w700,
                            //   fontSize: 18,
                            // ),
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
