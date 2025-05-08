import 'package:flutter/material.dart';

import 'package:flutter_apps/models/expense_blueprint.dart';
import 'package:flutter_apps/widgets/expenses/expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    required this.expenseData,
    required this.onRemoveExpense,
    super.key,
  });

  final void Function(Expense expense) onRemoveExpense;

  final List<Expense> expenseData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenseData.length,
      itemBuilder: (context, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error,
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        key: ValueKey(expenseData[index]),
        onDismissed: (direction) {
          onRemoveExpense(expenseData[index]);
        },
        child: ExpenseItem(
          expenseData[index],
        ),
      ),
    );
  }
}
