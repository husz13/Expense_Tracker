import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense_model.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({super.key, required this.fill, required this.category});
  final double fill;
  final Category category;
  Widget verticalChartBar() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: FractionallySizedBox(
          heightFactor: fill,
          child: const DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.rectangle,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(8)))),
        ),
      ),
    );
  }

  Widget horzChartBar(BuildContext ctx) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            //child: Text("A7A")
            Icon(iconsList[category],
                color: Theme.of(ctx).colorScheme.onSecondary.withOpacity(0.7)),

            const SizedBox(width: 5),
            Expanded(
              child: FractionallySizedBox(
                alignment: AlignmentDirectional.topStart,
                widthFactor: fill,
                heightFactor: 1,
                child: const DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(10)))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var maxWidth = MediaQuery.of(context).size.width;

    return maxWidth < 600 ? verticalChartBar() : horzChartBar(context);
  }
}
