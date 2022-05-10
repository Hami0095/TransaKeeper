import 'package:flutter/material.dart';

class Transactions {
  // amount transacted
  double amount;
  // date
  DateTime dateTime;
  // id:
  String id;
  // title of transaction:
  String title;

  Transactions({
    required this.amount,
    required this.dateTime,
    required this.id,
    required this.title,
  });
}
