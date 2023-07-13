import 'package:expense_tracker/models/expense_model.dart';

List<ExpenseModel> listOfExpenses = [
  ExpenseModel(
    title: "Food Of The Month",
    amount: 300.75,
    date: DateTime.now(),
    category: Category.food,
  ),
  ExpenseModel(
    title: "Courses",
    amount: 150.99,
    date: DateTime.now(),
    category: Category.work,
  )
];
