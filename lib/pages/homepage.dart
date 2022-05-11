import 'package:flutter/material.dart';
import 'package:transactioner/widgets/user_transactions.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Transactions'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            Card(
              color: Color.fromARGB(255, 240, 184, 250),
              child: Text('Table of transactions'),
            ),
            // Box to add new transaction:
            // To-Do add UserTransactions Widget
            UserTransactions(),
          ],
        ),
      ),
    );
  }
}
