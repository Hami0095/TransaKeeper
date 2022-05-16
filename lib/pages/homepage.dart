import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '/widgets/chart.dart';
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
  final List<Transactions> _userTransactions = [];

  int counter = 0;
  bool _showChart = false;
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
      id: counter.toString(),
      title: txTitle,
    );
    setState(() {
      _userTransactions.add(newTx);
      counter++;
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((element) {
        return element.id == id;
      });
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
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final txListWidget = Container(
      child: TransactionList(
        transactions: _userTransactions,
        remover: _deleteTransaction,
      ),
    );
    final cupertinoAppBar = CupertinoNavigationBar(
      middle: const Text('My Transactions'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              startAddNewTransaction(context);
            },
            child: const Icon(
              CupertinoIcons.add,
            ),
          ),
        ],
      ),
    );
    final appBar = AppBar(
      title: const Text('My Transactions'),
      actions: [
        IconButton(
          onPressed: () {
            startAddNewTransaction(context);
          },
          icon: const Icon(
            Icons.add,
          ),
        ),
      ],
    );
    final pageBody = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (isLandScape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Show Chart',
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 15,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Switch.adaptive(
                      value: _showChart,
                      onChanged: (val) {
                        setState(() {
                          _showChart = val;
                        });
                      })
                ],
              ),
            if (isLandScape) txListWidget,
            if (!isLandScape)
              Column(
                children: [
                  Container(
                    height: (MediaQuery.of(context).size.height -
                            appBar.preferredSize.height -
                            MediaQuery.of(context).padding.top) *
                        0.27,
                    child: Charts(recentTransactions: _recentTransactions),
                  ),
                  txListWidget,
                ],
              )
            // Box to add new transaction:
            // To-Do add UserTransactions Widget
          ],
        ),
      ),
    );
    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: pageBody,
            navigationBar: cupertinoAppBar,
          )
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: appBar,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    onPressed: () => startAddNewTransaction(context),
                    child: const Icon(Icons.add),
                  ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            body: pageBody,
          );
  }
}
