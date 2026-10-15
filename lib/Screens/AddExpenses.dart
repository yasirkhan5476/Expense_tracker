import 'package:expense_tracker/Component/Addcategorycomponent.dart';
import 'package:expense_tracker/Models/expense_model.dart';
import 'package:expense_tracker/Utils/Appcolor.dart';
import 'package:expense_tracker/Utils/Appicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddExpenses_screen extends StatefulWidget {
  const AddExpenses_screen({super.key});

  @override
  State<AddExpenses_screen> createState() => _AddExpenses_screenState();
}

class _AddExpenses_screenState extends State<AddExpenses_screen> {
  DateTime selectedDate = DateTime.now();
  final TextEditingController noteController = TextEditingController();

  // Track selected category index
  int selectedCategoryIndex = 0;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF017A54),
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // Fixed date formatting helper
  String _formatDate(DateTime date) {
    List<String> months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];
    return "${date.day} ${months[date.month - 1]} ${date.year}";
  }

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }

  // List<ExpenseModel> expense_model = [
  //   ExpenseModel(
  //     name: "Food",
  //     category: ExpenseCategory(
  //       name: "food",
  //       label: Appicons.foodIcon,
  //       color: Appcolor.colorFFF1D6,
  //     ),
  //     createdAt: DateTime.now(),
  //     expValue: 10,
  //   ),
  //   ExpenseModel(
  //     name: "Transport",
  //     category: ExpenseCategory(
  //       name: "transport",
  //       label: Appicons.transportIcon,
  //       color: Appcolor.colorDCEBFF,
  //     ),
  //     createdAt: DateTime.now(),
  //     expValue: 10,
  //   ),
  //   ExpenseModel(
  //     name: "Bills",
  //     category: ExpenseCategory(
  //       name: "bill",
  //       label: Appicons.billIcon,
  //       color: Appcolor.colorEADFFD,
  //     ),
  //     createdAt: DateTime.now(),
  //     expValue: 10,
  //   ),
  //   ExpenseModel(
  //     name: "Shopping",
  //     category: ExpenseCategory(
  //       name: "shopping",
  //       label: Appicons.shoppingIcon,
  //       color: Appcolor.colorFCE1EE,
  //     ),
  //     createdAt: DateTime.now(),
  //     expValue: 10,
  //   ),
  //   ExpenseModel(
  //     name: "Health",
  //     category: ExpenseCategory(
  //       name: "health",
  //       label: Appicons.healthIcon,
  //       color: Appcolor.colorFDE1DE,
  //     ),
  //     createdAt: DateTime.now(),
  //     expValue: 800,
  //   ),
  //   ExpenseModel(
  //     name: "Fun",
  //     category: ExpenseCategory(
  //       name: "fun",
  //       label: Appicons.funIcon,
  //       color: Appcolor.colorDCF2E8,
  //     ),
  //     createdAt: DateTime.now(),
  //     expValue: 100,
  //   ),
  // ];

  void ShowbottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Choose category",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: GridView.builder(
                      itemCount: Addexpensecategory.categories.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1.1, // Fixed aspect ratio instead of tiny mainAxisExtent
                          ),
                      itemBuilder: (context, index) {
                        final item = Addexpensecategory.categories[index];
                        final isSelected = selectedCategoryIndex == index;
                        return InkWell(
                          onTap: () {
                            setModalState(() {
                              selectedCategoryIndex = index;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Appcolor.purewhite,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: isSelected
                                    ? Appcolor.deepgreen
                                    : Appcolor.greyColor,
                                width: 1,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 28,
                                  height: 28,
                                  child: SvgPicture.asset(item.label),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  item.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () {
                      setState(
                        () {},
                      ); // Updates the main screen with the chosen category
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 48,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Appcolor.deepgreen,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        "Done",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentCategory =
        Addexpensecategory.categories[selectedCategoryIndex];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Add Expenses",
          style: TextStyle(
            color: Appcolor.color0F1B2D,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Appcolor.colorF4F6F8,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: const [
                          Text(
                            "Rs ",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            "1250",
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Appcolor.purewhite,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Category Row
                      InkWell(
                        onTap: () {
                          ShowbottomSheet();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const SizedBox(
                                  width: 80,
                                  child: Text(
                                    "Category",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 30,
                                  height: 30,
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: currentCategory.color,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: SvgPicture.asset(
                                    currentCategory.label,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  currentCategory.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Date Row with Date Picker Click Binding
                      InkWell(
                        onTap: () => _selectDate(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const SizedBox(
                                  width: 80,
                                  child: Text(
                                    "Date",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Text(
                                  _formatDate(selectedDate),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                            const Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Notes Row with integrated TextField
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 80,
                            child: Text(
                              "Notes",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: noteController,
                              textAlign: TextAlign.end,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Lunch with Hamza",
                                isDense: true,
                              ),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.chevron_right, color: Colors.grey),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
