


import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/expense_model.dart';

class StorageService {
  static const  String _expensesKey='expenses';
  final SharedPreferences _prefs;
  StorageService(this._prefs);


  Future<void> saveExpenses(List<Expense> expenses)async{
    final List<String>expensesJson=expenses.map((expense)=>jsonEncode(expense.toJson())).toList();
    await _prefs.setStringList(_expensesKey, expensesJson);
  }
  List<Expense>loadExpenses(){

    final List<String>?expensesJson=_prefs.getStringList(_expensesKey);
    if(expensesJson==null){
      return[];
    }
    return expensesJson.map((json)=>Expense.fromJson(jsonDecode(json))).toList();
  }

  }
