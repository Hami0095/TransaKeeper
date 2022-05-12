import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transactioner/models/transactions.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  const NewTransaction({
    Key? key,
    required this.addTx,
  }) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final amountController = TextEditingController();

  final titleController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  bool _flagSetDate = false;
  // String amountInput = ' ', titleInput = ' ';
  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = amountController.text;

    if (enteredAmount.isEmpty ||
        enteredTitle.isEmpty ||
        enteredAmount[0] == '-' ||
        _flagSetDate == false) {
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      } else {
        setState(() {
          _flagSetDate = true;
          _selectedDate = pickedDate;
        });
      }
    });
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
              onSubmitted: (_) => _submitData,
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Enter Amount',
              ),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData,
            ),
            Container(
              height: 120,
              child: Row(
                children: [
                  // ignore: unnecessary_null_comparison
                  _flagSetDate == false
                      ? const Text('No Date Chosen Yet!')
                      : Text(
                          DateFormat.yMMMEd().format(_selectedDate).toString()),
                  TextButton(
                      onPressed: _showDatePicker,
                      child: const Text('Choose Date'))
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _submitData();
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
