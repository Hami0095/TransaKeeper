import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transactions.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({Key? key}) : super(key: key);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final List<Transactions> _userTransactions = [
    Transactions(
      amount: 500,
      dateTime: DateTime.now(),
      id: 't1',
      title: 'Shoes',
    ),
    Transactions(
      amount: 1500,
      dateTime: DateTime.now(),
      id: 't2',
      title: 'huawei phone',
    ),
    Transactions(
      amount: 750,
      dateTime: DateTime.now(),
      id: 't3',
      title: 'CK underwear',
    ),
    Transactions(
      amount: 7500,
      dateTime: DateTime.now(),
      id: 't4',
      title: 'Jugnu lights',
    ),
    Transactions(
      amount: 4500,
      dateTime: DateTime.now(),
      id: 't5',
      title: 'Shalwar Kameez',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: _userTransactions.map((tx) {
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
                  '\$' + tx.amount.floor().toString(),
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
                    tx.title,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 122, 0, 143),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //const SizedBox(height: 20),
                  Text(
                    DateFormat.yMMMMEEEEd().format(tx.dateTime),
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              // this is the add new transaction button - Section
            ],
          ),
        );
      }).toList(),
    );
  }
}
