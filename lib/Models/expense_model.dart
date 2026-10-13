import 'package:flutter/material.dart';

class ExpenseModel {
  final String name;
  final ExpenseCategory category;
  final DateTime createdAt;
  final double expValue;

  const ExpenseModel({
    required this.name,
    required this.category,
    required this.createdAt,
    required this.expValue,
  });
}

class ExpenseCategory {
  final String name;
  final String label;
  final Color color;
  final bool isSelected;

  const ExpenseCategory({
    required this.name,
    required this.label,
    required this.color,
    this.isSelected=false
  });
}
