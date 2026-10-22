import 'package:flutter/animation.dart';

class ExpenseModel {
  final String id; // 👈 Unique ID for tracking, editing, and deleting
  final String name;
  final ExpenseCategory category;
  final DateTime createdAt;
  final double expValue;

  ExpenseModel({
    String? id,
    required this.name,
    required this.category,
    required this.createdAt,
    required this.expValue,
  }) : id = id ?? DateTime.now().millisecondsSinceEpoch.toString(); // Generates unique ID automatically if none provided

  Map<String, dynamic> toJson() => {
    'id': id, // 👈 Save ID to JSON
    'name': name,
    'category': category.toJson(),
    'createdAt': createdAt.toIso8601String(),
    'expValue': expValue,
  };

  factory ExpenseModel.fromJson(Map<String, dynamic> json) => ExpenseModel(
    id: (json['id'] as String?) ?? DateTime.now().millisecondsSinceEpoch.toString(),
    name: json['name'] as String,
    category: ExpenseCategory.fromJson(
      Map<String, dynamic>.from(json['category'] as Map),
    ),
    createdAt: DateTime.parse(json['createdAt'] as String),
    expValue: (json['expValue'] as num).toDouble(),
  );
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

  Map<String, dynamic> toJson() => {
    'name': name,
    'label': label,
    'color': color.value, // Save Color as int value
  };

  factory ExpenseCategory.fromJson(Map<String, dynamic> json) =>
      ExpenseCategory(
        name: json['name'] as String,
        label: json['label'] as String,
        color: Color(json['color'] as int),
      );
}