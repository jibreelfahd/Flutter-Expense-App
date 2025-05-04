import 'package:flutter/material.dart';

import 'package:flutter_apps/models/expense_blueprint.dart';
import 'package:flutter_apps/widgets/expenses/expenses_list.dart';
import 'package:flutter_apps/widgets/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 12.88,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'React Course',
      amount: 44.3,
      date: DateTime.now(),
      category: Category.work,
    ),
  ];

  void _showAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const NewExpense(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _showAddExpenseOverlay,
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('Some texts here'),
          Expanded(
            child: ExpensesList(
              expenseData: _registeredExpenses,
            ),
          ),
        ],
      ),
    );
  }
}
