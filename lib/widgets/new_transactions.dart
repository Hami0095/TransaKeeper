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
  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = amountController.text;
    if (enteredAmount.isEmpty ||
        enteredTitle.isEmpty ||
        enteredAmount[0] == '-') {
      return;
    }

    addTx(
      enteredTitle,
      enteredAmount,
    );
  }

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
              keyboardType: TextInputType.text,
              onSubmitted: (_) => submitData,
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Enter Amount',
              ),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData,
            ),
            ElevatedButton(
              onPressed: () {
                submitData();
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
