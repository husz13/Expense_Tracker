import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense_model.dart';

class ChartBar extends StatelessWidget {
  ChartBar({super.key, required this.fill, required this.category});
  final double fill;
  final Category category;
  @override
  Widget build(BuildContext context) {
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
}
