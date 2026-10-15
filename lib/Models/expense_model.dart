import 'package:flutter/material.dart';

class ExpenseModel {
  final String name;
  final ExpenseCategory category;
  final DateTime createdAt;
  final double expValue;

  ExpenseModel({
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

  ExpenseCategory({
    required this.name,
    required this.label,
    required this.color,
  });
}
