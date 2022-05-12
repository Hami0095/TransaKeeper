import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transactions.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> transactions;
  Function remover;
  TransactionList({
    Key? key,
    required this.transactions,
    required this.remover,
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
                  elevation: 5,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                          child: Text('\$' + transactions[index].amount),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMEd()
                          .format(transactions[index].dateTime)
                          .toString(),
                    ),
                    trailing: IconButton(
                      color: Color.fromARGB(255, 217, 51, 59),
                      icon: const Icon(Icons.delete_rounded),
                      onPressed: () => remover(transactions[index].id),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
