import 'package:expense_tracker/Component/ExpenseCard.dart';
import 'package:expense_tracker/Models/expense_model.dart';
import 'package:expense_tracker/Screens/AddExpenses.dart';
import 'package:expense_tracker/Screens/EditExpense.dart';
import 'package:expense_tracker/Services/Global.dart';
import 'package:expense_tracker/Utils/Appcolor.dart';
import 'package:expense_tracker/Utils/Appicons.dart';

import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  void _addNewExpenseSample() {
    setState(() {
      listofExpenses.add(
        ExpenseModel(
          name: "New Expense",
          category: ExpenseCategory(
            name: "food",
            label: Appicons.foodIcon,
            color: Appcolor.colorFFF1D6,
          ),
          createdAt: DateTime.now(),
          expValue: 150,
        ),
      );
    });

    saveExpenses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.Body_background_color,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                ScrollViewKeyboardDismissBehavior.onDrag,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Good morning,",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            const Text(
                              "Ayesha",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        CircleAvatar(
                          radius: 22,
                          backgroundColor: const Color(0xFFD8F3DC),
                          child: const Text(
                            "A",
                            style: TextStyle(
                              color: Color(0xFF017A54),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Appcolor.deepgreen,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "October spending",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            "Rs 40,000",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: LinearProgressIndicator(
                              value: 0.67,
                              minHeight: 8,
                              backgroundColor: Colors.white.withValues(
                                alpha: 0.2,
                              ),
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "67% of Rs 60,000 budget",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                "Rs 20,000 left",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Recent",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            "See all",
                            style: TextStyle(
                              color: Appcolor.deepgreen,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: listofExpenses.length, // 👈 Uses global persistent list length
                        itemBuilder: (context, index) {
                          return InkWell(onTap:() async{
                            final result = await Navigator.push(context, MaterialPageRoute(builder: (context)=>Editexpense(expenseToEdit: listofExpenses[index],)));
                            if(result==true){
                              setState(() {});
                            }
                          },
                              child: ExpenseCard(expense: listofExpenses[index])); // 👈 Uses global persistent item
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async{
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AddExpenses_screen(),
          ),
        );
        if (result == true) {
          setState(() {});
        }
      },
        backgroundColor:Appcolor.deepgreen,
        shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
         ),
        elevation: 4,child:  const Icon(Icons.add, color: Colors.white, size: 28),),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.only(left: 72.0, right: 16.0),
      child: Divider(height: 2, thickness: 0.6, color: Colors.grey.shade200),
    );
  }
}