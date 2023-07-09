import 'package:expense_tracker/data/shown_list.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  /*final List<ExpenseModel> expList = [
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
  ];*/
  //List<ExpenseModel> listOfExpenses = [];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return NewExpense(updateList);
      },
    );
  }

  void updateList(ExpenseModel newExpese) {
    ////////////////////////////////////////////////////////////////
    setState(() {
      listOfExpenses.add(newExpese);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses Tracker App"),
        backgroundColor: Color.fromARGB(255, 222, 219, 219),
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Chart"),
          Expanded(child: ExpenseList(expenseList: listOfExpenses)),
        ],
      ),
    );
  }
}
