import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widgets/chart/chart_bar.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expensesList});
  final List<ExpenseModel> expensesList;
  double maxAmount(List<ExpenseBucket> buckets) {
    var max = 0.0;
    for (final bucket in buckets) {
      if (max < bucket.totalExpense) max = bucket.totalExpense;
    }

    return max;
  }

  @override
  Widget build(BuildContext context) {
    final List<ExpenseBucket> buckets = [
      ExpenseBucket.ofCategory(
          totalExpenseList: expensesList, category: Category.travel),
      ExpenseBucket.ofCategory(
          totalExpenseList: expensesList, category: Category.work),
      ExpenseBucket.ofCategory(
          totalExpenseList: expensesList, category: Category.leisure),
      ExpenseBucket.ofCategory(
          totalExpenseList: expensesList, category: Category.food)
    ];
    final maxamount = maxAmount(buckets);
    List<Widget> verticalChart() {
      return [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for (final bucket in buckets)
                ChartBar(
                    fill: bucket.totalExpense / maxamount,
                    category: bucket.category)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: buckets
                .map(
                  (bucket) => Expanded(
                    child: Icon(
                      iconsList[bucket.category],
                      color: Theme.of(context)
                          .colorScheme
                          .onSecondary
                          .withOpacity(0.7),
                    ),
                  ),
                )
                .toList(),
          ),
        )
      ];
    }
    // List<Widget> horzChart(){
    //   return Row()
    // }

    var maxWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.secondary),
      height: 210,
      width: maxWidth < 600 ? double.infinity : 400,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      margin: EdgeInsets.fromLTRB((maxWidth > 600 ? 12 : 5), 5, 5, 5),
      child: Column(
          children: maxWidth < 600
              ? verticalChart()
              : [
                  for (final bucket in buckets)
                    ChartBar(
                        fill: bucket.totalExpense / maxamount,
                        category: bucket.category)
                ]),
    );
  }
}
