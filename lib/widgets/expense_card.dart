

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/expense_model.dart';

class ExpenseCard extends StatelessWidget {
  final Expense expense;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  const ExpenseCard(

  {

  super.key,
  required this.expense,
  required this.onDelete,
  required this.onEdit,
});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
      elevation: 2,
      child:Dismissible(
        key: Key(expense.id),
        background: Container(
          color: Colors.red,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 16),
          child: const Icon(Icons.delete,color: Colors.white),
        ),
        direction: DismissDirection.endToStart,
        onDismissed:(direction)=>onDelete(),
      child:ListTile(
        onTap:()=>onEdit(),
        contentPadding: const EdgeInsets.all(16),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(
        expense.title,
          style: const TextStyle(
              fontSize: 18,fontWeight:
          FontWeight.bold),
              overflow: TextOverflow.ellipsis,
        )
      ),
            Text(expense.amount.toStringAsFixed(2),style:TextStyle(
              fontSize: 16,
              color: Colors.green[700],
              fontWeight: FontWeight.bold,
            )
            )
          ]
       ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    expense.category,
                    style: TextStyle(fontSize: 12, color: Colors.blue[800]),
                  ),
                ),
                const SizedBox(width: 8),
                Icon(Icons.calendar_today, size: 12, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  DateFormat('dd MMM yyyy').format(expense.date),
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
            if (expense.description.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(
                expense.description,
                style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.edit, color: Colors.blue),
          onPressed: onEdit,
        ),
      ),
      ),
    );
  }
}







