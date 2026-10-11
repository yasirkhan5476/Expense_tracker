import 'package:expense_tracker/Models/expense_model.dart';
import 'package:expense_tracker/Utils/Appcolor.dart';
import 'package:expense_tracker/Utils/Appicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryIcon extends StatelessWidget {
  final ExpenseCategory category;

  const CategoryIcon({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final (color, icon) = switch (category) {
      ExpenseCategory.food => (Appcolor.colorFFF1D6, Appicons.foodIcon),
      ExpenseCategory.bill => (Appcolor.colorEADFFD, Appicons.billIcon),
      ExpenseCategory.transport => (
        Appcolor.colorDCEBFF,
        Appicons.transportIcon,
      ),
      ExpenseCategory.shopping => (Appcolor.colorFCE1EE, Appicons.shoppingIcon),
      ExpenseCategory.health => (Appcolor.colorFDE1DE, Appicons.healthIcon),
      ExpenseCategory.fun => (Appcolor.colorDCF2E8, Appicons.funIcon),
    };

    return Container(
      padding: const EdgeInsets.all(12),
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
      ),
      child: SvgPicture.asset(icon),
    );
  }
}
