//import 'package:expense_tracker/data/shown_list.dart';
import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';
//import 'package:expense_tracker/widgets/expenses.dart';

class NewExpense extends StatefulWidget {
  const NewExpense(this.onAddExpense, {super.key});
  final void Function(ExpenseModel) onAddExpense;
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? selectedDate;
  Category selectedCategory = Category.food;

  void submitData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountInvalid = (enteredAmount == null) || enteredAmount <= 0;

    if (_titleController.text.trim().isEmpty ||
        amountInvalid ||
        selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          titleTextStyle: const TextStyle(fontSize: 22, color: Colors.black),
          title: const Text("Error"),
          content: const Text("Please Enter Some Values"),
          actions: [
            const BackButton(),
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text("Back"))
          ],
        ),
      );
      return;
    }

    widget.onAddExpense(
      ExpenseModel(
          title: _titleController.text,
          amount: double.parse(_amountController.text),
          date: selectedDate!,
          category: selectedCategory),
    );
  }

  void openDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final lastDate = now;
    final pickedDate = await showDatePicker(
      confirmText: "Sibmit Date",
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    setState(() {
      selectedDate = pickedDate;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(label: Text("Input Title")),
            maxLength: 50,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                      label: Text("Expense Amount"), prefixText: "\$ "),
                  keyboardType: TextInputType.number,
                  controller: _amountController,
                ),
              ),
              const SizedBox(width: 60),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(selectedDate == null
                        ? "No Date Selected"
                        : formatter.format(selectedDate!)),
                    IconButton(
                        onPressed: openDatePicker,
                        icon: const Icon(Icons.calendar_month_outlined))
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              DropdownButton(
                  value: selectedCategory,
                  items: Category.values
                      .map((item) => DropdownMenuItem(
                          value: item, child: Text(item.name.toUpperCase())))
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      selectedCategory = value;
                    });
                  }),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel")),
              ElevatedButton(onPressed: submitData, child: const Text("Submit"))
            ],
          ),
        ],
      ),
    );
  }
}
