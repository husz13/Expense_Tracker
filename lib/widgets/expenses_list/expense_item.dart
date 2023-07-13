import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expenseItem, {super.key});
  final ExpenseModel expenseItem;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          expenseItem.title,
          style: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSecondary),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Text("\$ ${expenseItem.amount.toStringAsFixed(4)} "),
            const Spacer(),
            Row(children: [
              Icon(iconsList[expenseItem.category]),
              const SizedBox(width: 10),
              Text(expenseItem.formattedDate)
            ])
          ],
        )
      ]),
    ));
  }
}
