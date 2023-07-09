import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expenseItem, {super.key});
  final ExpenseModel expenseItem;
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Color.fromARGB(255, 3, 177, 151),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Column(children: [
            Text(
              expenseItem.title,
            ),
            Row(
              children: [
                Text("\$ ${expenseItem.amount.toStringAsFixed(4)} "),
                const Spacer(),
                Row(
                  children: [
                    Icon(iconsList[expenseItem.category]),
                    const SizedBox(width: 10),
                    Text(expenseItem.formattedDate),
                  ],
                )
              ],
            )
          ]),
        ));
  }
}
