import 'package:flutter/material.dart';
import 'package:transactioner/widgets/chart.dart';
import '../models/transactions.dart';
import '../widgets/new_transactions.dart';
import '../widgets/transactions_list.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transactions> _userTransactions = [
    // Transactions(
    //   amount: "500",
    //   dateTime: DateTime.now(),
    //   id: 't1',
    //   title: 'Shoes',
    // ),
    // Transactions(
    //   amount: "1500",
    //   dateTime: DateTime.now(),
    //   id: 't2',
    //   title: 'huawei phone',
    // ),
    // Transactions(
    //   amount: "750",
    //   dateTime: DateTime.now(),
    //   id: 't3',
    //   title: 'CK underwear',
    // ),
    // Transactions(
    //   amount: "7500",
    //   dateTime: DateTime.now(),
    //   id: 't4',
    //   title: 'Jugnu lights',
    // ),
    // Transactions(
    //   amount: "4500",
    //   dateTime: DateTime.now(),
    //   id: 't5',
    //   title: 'Shalwar Kameez',
    // ),
  ];

  List<Transactions> get _recentTransactions {
    return _userTransactions.where(
      (element) {
        return element.dateTime.isAfter(
          DateTime.now().subtract(
            const Duration(days: 7),
          ),
        );
      },
    ).toList();
  }

  void _addNewTransaction(
      String txTitle, String txAmount, DateTime chosenDate) {
    final newTx = Transactions(
      amount: txAmount,
      dateTime: chosenDate,
      id: DateTime.now.toString(),
      title: txTitle,
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return NewTransaction(addTx: _addNewTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('My Transactions'),
        actions: [
          IconButton(
            onPressed: () => startAddNewTransaction(context),
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => startAddNewTransaction(context),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Charts(recentTransactions: _recentTransactions),
            // Box to add new transaction:
            // To-Do add UserTransactions Widget
            TransactionList(
              transactions: _userTransactions,
            ),
          ],
        ),
      ),
    );
  }
}
