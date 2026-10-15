import 'package:expense_tracker/Models/expense_model.dart';
import 'package:expense_tracker/Utils/Appcolor.dart';
import 'package:expense_tracker/Utils/Appicons.dart';
import 'package:flutter/material.dart';

class Addexpensecategory {
  static final List<ExpenseCategory> categories = [
    ExpenseCategory(
      name: "Food",
      label: Appicons.foodIcon,
      color: Appcolor.colorFFF1D6,
    ),
    ExpenseCategory(
      name: "Transport",
      label: Appicons.transportIcon,
      color: Appcolor.colorDCEBFF,
    ),
    ExpenseCategory(
      name: "Health",
      label: Appicons.healthIcon,
      color: Appcolor.colorFDE1DE,
    ),
    ExpenseCategory(
      name: "Shopping",
      label: Appicons.shoppingIcon,
      color: Appcolor.colorFCE1EE,
    ),
    ExpenseCategory(
      name: "Bill",
      label: Appicons.billIcon,
      color: Appcolor.colorEADFFD,
    ),
    ExpenseCategory(
      name: "Fun",
      label: Appicons.funIcon,
      color: Appcolor.colorDCF2E8,
    ),
  ];
  static void addCategory(ExpenseCategory newCategory) {
    categories.add(newCategory);
  }

  static final List<ExpenseModel> userExpenses = [];

  static void addExpense(ExpenseModel expense) {
    userExpenses.insert(0, expense); // Adds newest to the top
  }
}
