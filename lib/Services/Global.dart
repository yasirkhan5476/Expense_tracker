import 'dart:convert';

import 'package:expense_tracker/Models/expense_model.dart';
import 'package:expense_tracker/Services/Localstoragekey.dart';
import 'package:expense_tracker/Utils/Appcolor.dart';
import 'package:expense_tracker/Utils/Appicons.dart';
import 'package:get_storage/get_storage.dart';



List<ExpenseModel> listofExpenses = _loadExpenses();

List<ExpenseModel> _loadExpenses(){
  final String? saved = GetStorage().read<String>(Localstoragekey.expenseListkey);
  if(saved==null) return _sampleexpenses();
  return (jsonDecode(saved) as List).map((e)=>ExpenseModel.fromJson(Map<String,dynamic>.from(e as Map))).toList();
}

Future<void> saveExpenses(){
  return GetStorage().write(Localstoragekey.expenseListkey, jsonEncode(listofExpenses.map((e)=>e.toJson()).toList()));
}

List<ExpenseModel> _sampleexpenses()=><ExpenseModel>[
];