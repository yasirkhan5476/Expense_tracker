import 'package:expense_tracker/Component/ExpenseCard.dart';
import 'package:expense_tracker/Models/expense_model.dart';
import 'package:expense_tracker/Utils/Appcolor.dart';
import 'package:expense_tracker/Utils/Appicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<ExpenseModel> expense_model = [
    ExpenseModel(
      name: "Biryani",
      category: ExpenseCategory.food,
      createdAt: DateTime.now(),
      expValue: 10,
    ),
    ExpenseModel(
      name: "KE bill",
      category: ExpenseCategory.bill,
      createdAt: DateTime.now(),
      expValue: 10,
    ),
    ExpenseModel(
      name: "Car Fuel",
      category: ExpenseCategory.transport,
      createdAt: DateTime.now(),
      expValue: 10,
    ),
    ExpenseModel(
      name: "CBC blood test",
      category: ExpenseCategory.health,
      createdAt: DateTime.now(),
      expValue: 800,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.Body_background_color,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
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
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
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
                            children: [
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
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
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
                    SizedBox(height: 12),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: expense_model.length,
                        itemBuilder: (context, index) {
                          return ExpenseCard(expense: expense_model[index]);
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
    );
  }

  //   Widget _iconComponent(ExpenseCategory expenseCategory) {
  //     switch (expenseCategory) {
  //       case ExpenseCategory.food:
  //         return Container(
  //           padding: EdgeInsets.all(12),
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(12),
  //             color: Appcolor.colorFFF1D6,
  //           ),
  //           child: SvgPicture.asset(Appicons.foodIcon),
  //         );
  //       case ExpenseCategory.transport:
  //         return Container(
  //           padding: EdgeInsets.all(12),
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(12),
  //             color: Appcolor.colorDCEBFF,
  //           ),
  //           child: SvgPicture.asset(Appicons.transportIcon),
  //         );
  //       case ExpenseCategory.shopping:
  //         return Container(
  //           padding: EdgeInsets.all(12),
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(12),
  //             color: Appcolor.colorFCE1EE,
  //           ),
  //           child: SvgPicture.asset(Appicons.shoppingIcon),
  //         );
  //       case ExpenseCategory.health:
  //         return Container(
  //           padding: EdgeInsets.all(12),
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(12),
  //             color: Appcolor.colorFDE1DE,
  //           ),
  //           child: SvgPicture.asset(Appicons.healthIcon),
  //         );

  //       // Add more cases as needed

  //       default:
  //         return Container(
  //           padding: EdgeInsets.all(12),
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(12),
  //             color: Appcolor.colorFFF1D6,
  //           ),
  //           child: SvgPicture.asset(Appicons.healthIcon),
  //         );

  //         // Body of default case
  //         break;
  //     }
  //   }

  //   Widget _expenseCard(ExpenseModel expenseModel) {
  //     String formattedDate = DateFormat('yyyy-MM-dd, HH:mm a')
  //         .format(expenseModel.createdAt);

  //     return Container(
  //       padding: EdgeInsets.symmetric(horizontal: 13),
  //       height: 70,
  //       decoration: BoxDecoration(
  //         color: Appcolor.purewhite,
  //         borderRadius: BorderRadius.circular(15),
  //       ),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Row(
  //             spacing: 15,
  //             children: [
  //               _iconComponent(expenseModel.category),
  //               Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Text(
  //                     expenseModel.name,
  //                     style: TextStyle(
  //                       fontWeight: FontWeight.w700,
  //                       fontSize: 15,
  //                       color: Appcolor.color0F1B2D,
  //                     ),
  //                   ),
  //                   Text(
  //                     "Food · ${formattedDate}",
  //                     style: TextStyle(
  //                       fontWeight: FontWeight.w400,
  //                       fontSize: 13,
  //                       color: Appcolor.greyColor,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //           Text(
  //             expenseModel.expValue.toString(),
  //             style: TextStyle(
  //               fontWeight: FontWeight.bold,
  //               fontSize: 18,
  //               color: Appcolor.color0F1B2D,
  //             ),
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  // }

  Widget _buildDivider() {
    return Padding(
      padding: EdgeInsets.only(left: 72.0, right: 16.0),
      child: Divider(height: 2, thickness: 0.6, color: Colors.grey.shade200),
    );
  }
}
