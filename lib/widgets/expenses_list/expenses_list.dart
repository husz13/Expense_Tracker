import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/cupertino.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {super.key, required this.expenseList, required this.onRemove});
  final void Function(ExpenseModel) onRemove;
  final List<ExpenseModel> expenseList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenseList.length,
      itemBuilder: (ctx, index) => Dismissible(
          onDismissed: (direction) {
            onRemove(expenseList[index]);
          },
          key: ValueKey(expenseList[index]),
          child: ExpenseItem(expenseList[index])),
    );
  }
}
