import 'dart:convert';
import 'package:expense_tracker/Models/expense_model.dart';
import 'package:expense_tracker/Services/Localstoragekey.dart';
import 'package:get_storage/get_storage.dart';

class StorageService {
  static List<ExpenseModel> loadExpenses() {
    final String? saved = GetStorage().read<String>(Localstoragekey.expenseListkey);
    if (saved == null || saved.isEmpty) return sampleExpenses();
    try {
      return (jsonDecode(saved) as List)
          .map((e) => ExpenseModel.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList();
    } catch (e) {
      return sampleExpenses();
    }
  }

  static Future<void> saveExpenses(List<ExpenseModel> expenses) {
    return GetStorage().write(
      Localstoragekey.expenseListkey,
      jsonEncode(expenses.map((e) => e.toJson()).toList()),
    );
  }

  static List<ExpenseModel> sampleExpenses() => [];
}

// Global list for easy access across screens
List<ExpenseModel> listofExpenses = StorageService.loadExpenses();

Future<void> saveExpenses() {
  return StorageService.saveExpenses(listofExpenses);
}