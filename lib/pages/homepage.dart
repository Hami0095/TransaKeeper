import 'package:flutter/material.dart';
import 'package:transactioner/widgets/transactions_list.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  String? titleInput, amountInput;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Transactions'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Card(
            color: Color.fromARGB(255, 240, 184, 250),
            child: Text('Table of transactions'),
          ),
          // Box to add new transaction:
          Card(
            elevation: 5,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'Enter Title',
                    ),
                    onChanged: (val) => titleInput = val,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'Enter Amount',
                    ),
                    onChanged: (val) {
                      amountInput = val;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    //style: ButtonStyle(foregroundColor: ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.purple,
                    ),
                    child: const Text('Add Transaction'),
                  ),
                ],
              ),
            ),
          ),
          // ---------------------------------------------------------------------
          // To-Do: add transactionsList()
          const TransactionList(),
        ],
      ),
    );
  }
}
