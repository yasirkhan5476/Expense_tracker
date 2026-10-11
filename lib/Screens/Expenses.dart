import 'package:expense_tracker/Component/ExpenseCard.dart';
import 'package:expense_tracker/Models/expense_model.dart';
import 'package:expense_tracker/Utils/Appcolor.dart';
import 'package:expense_tracker/Utils/Appicons.dart';
import 'package:flutter/material.dart';

import '../Component/MyTextfieldcomponent.dart';

class Expenses_screen extends StatefulWidget {
  const Expenses_screen({super.key});

  @override
  State<Expenses_screen> createState() => _Expenses_screenState();
}

class _Expenses_screenState extends State<Expenses_screen> {
  // List of categories matching your wireframe design
  final List<String> categories = [
    "All",
    "Food",
    "Transport",
    "Bills",
    "Shopping",
    "Health",
    "Fun",
  ];
  List<ExpenseModel> Today = [
    ExpenseModel(
      name: "Biryani lunch",
      category: ExpenseCategory.food,
      createdAt: DateTime.now(),
      expValue: 10,
    ),
    ExpenseModel(
      name: "Careem ride",
      category: ExpenseCategory.transport,
      createdAt: DateTime.now(),
      expValue: 10,
    ),
  ];
  List<ExpenseModel> Yesterday = [
    ExpenseModel(
      name: "Pharmacy",
      category: ExpenseCategory.health,
      createdAt: DateTime.now(),
      expValue: 10,
    ),
    ExpenseModel(
      name: "Daraz Order",
      category: ExpenseCategory.shopping,
      createdAt: DateTime.now(),
      expValue: 10,
    ),
  ];
  List<ExpenseModel> Afternoon = [
    ExpenseModel(
      name: "KE bill",
      category: ExpenseCategory.bill,
      createdAt: DateTime.now(),
      expValue: 10,
    ),
    ExpenseModel(
      name: "Cinema Tickets",
      category: ExpenseCategory.fun,
      createdAt: DateTime.now(),
      expValue: 10,
    ),
  ];

  // Track the currently selected category index
  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FA),
      body: SafeArea(
        child: SingleChildScrollView(
         keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Expenses',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 10),
                Mytextfieldcomponent(
                  hintText: 'Search expenses',
                  controller: TextEditingController(),
                  prefixIcon: Appicons.search_icon2,
                ),
                const SizedBox(height: 15),

                // Categories Horizontal Row (Clean container chips without checkmarks)
                SizedBox(
                  height: 42,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final isSelected = selectedCategoryIndex == index;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCategoryIndex = index;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFF111827)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: isSelected
                                    ? Colors.transparent
                                    : Colors.grey.shade300,
                                width: 1,
                              ),
                            ),
                            child: Text(
                              categories[index],
                              style: TextStyle(
                                color: isSelected
                                    ? Appcolor.purewhite
                                    : Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 15),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "< October 2026 >",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Total Rs 40,000",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Appcolor.deepgreen,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Today",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Appcolor.Textgreycolor,
                      ),
                    ),
                    Text(
                      "Rs 1,470",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Appcolor.Textgreycolor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: Today.length,
                    itemBuilder: (context, index) {
                      return ExpenseCard(expense: Today[index]);
                    },
                    separatorBuilder: (context, index) {
                      return _buildDivider();
                    },
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Yesterday",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Appcolor.Textgreycolor,
                      ),
                    ),
                    Text(
                      "Rs 4,470",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Appcolor.Textgreycolor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: Yesterday.length,
                    itemBuilder: (context, index) {
                      return ExpenseCard(expense: Yesterday[index]);
                    },
                    separatorBuilder: (context, index) {
                      return _buildDivider();
                    },
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "28 sep",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Appcolor.Textgreycolor,
                      ),
                    ),
                    Text(
                      "Rs 9000",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Appcolor.Textgreycolor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: Afternoon.length,
                    itemBuilder: (context, index) {
                      return ExpenseCard(expense: Afternoon[index]);
                    },
                    separatorBuilder: (context, index) {
                      return _buildDivider();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: EdgeInsets.only(left: 72.0, right: 16.0),
      child: Divider(height: 2, thickness: 0.6, color: Colors.grey.shade200),
    );
  }
}
