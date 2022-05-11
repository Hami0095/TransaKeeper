import 'package:flutter/material.dart';
import 'package:transactioner/widgets/transactions_list.dart';

import '../models/transactions.dart';
import 'new_transactions.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transactions> _userTransactions = [
    Transactions(
      amount: "500",
      dateTime: DateTime.now(),
      id: 't1',
      title: 'Shoes',
    ),
    Transactions(
      amount: "1500",
      dateTime: DateTime.now(),
      id: 't2',
      title: 'huawei phone',
    ),
    Transactions(
      amount: "750",
      dateTime: DateTime.now(),
      id: 't3',
      title: 'CK underwear',
    ),
    Transactions(
      amount: "7500",
      dateTime: DateTime.now(),
      id: 't4',
      title: 'Jugnu lights',
    ),
    Transactions(
      amount: "4500",
      dateTime: DateTime.now(),
      id: 't5',
      title: 'Shalwar Kameez',
    ),
  ];

  void addNewTransaction(String txTitle, String txAmount) {
    final newTx = Transactions(
      amount: txAmount,
      dateTime: DateTime.now(),
      id: DateTime.now.toString(),
      title: txTitle,
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(
          addTx: addNewTransaction,
        ),
        TransactionList(
          transactions: _userTransactions,
        ),
      ],
    );
  }
}
