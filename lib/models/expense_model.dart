import 'dart:convert';

class Expense {
  final String id;
  final String title;
  final double amount;
  final String category;
  final DateTime date;
  final String description;

  Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
    required this.description,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'amount': amount,
        'category': category,
        'date': date.toIso8601String(),
        'description': description,
      };

  factory Expense.fromJson(Map<String, dynamic> json) => Expense(
        id: json['id'],
        title: json['title'],
        amount: json['amount'].toDouble(),
        category: json['category'],
        date: DateTime.parse(json['date']),
        description: json['description'],
      );

  // Convert a list of Expenses to a JSON string
  static String encode(List<Expense> expenses) => json.encode(
        expenses.map<Map<String, dynamic>>((item) => item.toJson()).toList(),
      );

  // Decode a JSON string back into a list of Expenses
  static List<Expense> decode(String expensesJson) =>
      (json.decode(expensesJson) as List<dynamic>)
          .map<Expense>((item) => Expense.fromJson(item))
          .toList();
}
