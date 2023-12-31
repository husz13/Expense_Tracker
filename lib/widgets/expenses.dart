import 'package:expense_tracker/data/shown_list.dart';
import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      //isDismissible: true,
      //barrierColor: const Color.fromARGB(255, 78, 89, 96),
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return NewExpense(updateList);
      },
    );
  }

  void updateList(ExpenseModel newExpese) {
    setState(() {
      listOfExpenses.add(newExpese);
    });
  }

  void removeExpense(ExpenseModel expense) {
    final index = listOfExpenses.indexOf(expense);
    setState(
      () {
        listOfExpenses.remove(expense);
      },
    );
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              listOfExpenses.insert(index, expense);
            });
          },
        ),
        duration: const Duration(seconds: 4),
        content: const Text("Deleted")));
  }

  @override
  Widget build(BuildContext context) {
    var maxWidth = MediaQuery.of(context).size.width;
    //print("width is " + maxWidth.toString()); if maxWidth >>600;

    Widget mainContent = const Center(
      child: Text("Empty Content "),
    );
    mainContent = listOfExpenses.isEmpty
        ? mainContent
        : ExpenseList(
            expenseList: listOfExpenses,
            onRemove: removeExpense,
          );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses Tracker App"),
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: maxWidth < 600
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Chart(expensesList: listOfExpenses),
                Expanded(child: mainContent),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Chart(expensesList: listOfExpenses),
                  Expanded(child: mainContent),
                ]),
    );
  }
}
