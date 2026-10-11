import 'package:expense_tracker/Component/CategoryIcon.dart';
import 'package:expense_tracker/Models/expense_model.dart';
import 'package:expense_tracker/Utils/Appcolor.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseCard extends StatelessWidget {
  final ExpenseModel expense;

  const ExpenseCard({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('yyyy-MM-dd, hh:mm a')
        .format(expense.createdAt);

    // "food" -> "Food"
    final categoryName =
        expense.category.name[0].toUpperCase() +
        expense.category.name.substring(1);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      height: 70,
      decoration: BoxDecoration(
        color: Appcolor.purewhite,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 15,
            children: [
              CategoryIcon(category: expense.category),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    expense.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: Appcolor.color0F1B2D,
                    ),
                  ),
                  Text(
                    "$categoryName · $formattedDate",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      color: Appcolor.greyColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            expense.expValue.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Appcolor.color0F1B2D,
            ),
          ),
        ],
      ),
    );
  }
}
