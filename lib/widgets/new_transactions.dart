import 'package:flutter/material.dart';
import 'package:transactioner/models/transactions.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;

  NewTransaction({
    Key? key,
    required this.addTx,
  }) : super(key: key);

  final amountController = TextEditingController();
  final titleController = TextEditingController();
  // String amountInput = ' ', titleInput = ' ';
  @override
  Widget build(BuildContext context) {
    return Card(
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
              controller: titleController,
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Enter Amount',
              ),
              controller: amountController,
            ),
            ElevatedButton(
              onPressed: () {
                addTx(
                  titleController.text,
                  amountController.text,
                );
              },

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
    );
  }
}
