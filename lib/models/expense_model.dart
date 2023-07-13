import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuId = Uuid();
final formatter = DateFormat.yMd();

enum Category { food, travel, leisure, work }

final iconsList = {
  Category.food: Icons.lunch_dining,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
  Category.travel: Icons.flight
};

class ExpenseModel {
  ExpenseModel(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuId.v4();
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  ExpenseBucket({required this.category, required this.expenseList});
  final List<ExpenseModel> expenseList;
  final Category category;
  get totalExpense {
    // ignore: unused_local_variable
    double sum = 0;
    for (final expense in expenseList) {
      sum += expense.amount;
    }
  }
}
