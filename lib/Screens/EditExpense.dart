import 'package:expense_tracker/Component/Addcategorycomponent.dart';
import 'package:expense_tracker/Models/expense_model.dart';
import 'package:expense_tracker/Services/Global.dart';
import 'package:expense_tracker/Utils/Appcolor.dart';
import 'package:flutter/material.dart';

class Editexpense extends StatefulWidget {
  final ExpenseModel? expenseToEdit;
  const Editexpense({super.key,this.expenseToEdit});

  @override
  State<Editexpense> createState() => _EditexpenseState();
}

class _EditexpenseState extends State<Editexpense> {
  late DateTime selectedDate;
  late final TextEditingController noteController;
  late final TextEditingController amountController;
  int selectedCategoryIndex = 0;
  @override
  void initState() {
    super.initState();


    if (widget.expenseToEdit != null) {
      selectedDate = widget.expenseToEdit!.createdAt;
      noteController = TextEditingController(text: widget.expenseToEdit!.name);
      amountController = TextEditingController(text: widget.expenseToEdit!.expValue.toString());

      // Match category index
      final index = Addexpensecategory.categories.indexWhere(
            (cat) => cat.name == widget.expenseToEdit!.category.name,
      );
      if (index != -1) {
        selectedCategoryIndex = index;
      }
    } else {
      selectedDate = DateTime.now();
      noteController = TextEditingController();
      amountController = TextEditingController();
    }
  }
  void _saveOrUpdateExpense() {
    double value = double.tryParse(amountController.text.trim()) ?? 0.0;
    if (value <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid amount")),
      );
      return;
    }

    final finalcategory = Addexpensecategory.categories[selectedCategoryIndex];

    setState(() {
      if (widget.expenseToEdit != null) {

        final index = listofExpenses.indexWhere((e) => e.id == widget.expenseToEdit!.id);
        if (index != -1) {
          listofExpenses[index] = ExpenseModel(
            id: widget.expenseToEdit!.id,
            name: noteController.text.trim().isEmpty ? finalcategory.name : noteController.text.trim(),
            category: ExpenseCategory(
              name: finalcategory.name,
              label: finalcategory.label,
              color: finalcategory.color,
            ),
            createdAt: selectedDate,
            expValue: value,
          );
        }
      } else {

        final newExpense = ExpenseModel(
          name: noteController.text.trim().isEmpty ? finalcategory.name : noteController.text.trim(),
          category: ExpenseCategory(
            name: finalcategory.name,
            label: finalcategory.label,
            color: finalcategory.color,
          ),
          createdAt: selectedDate,
          expValue: value,
        );
        listofExpenses.insert(0, newExpense);
      }
    });

    saveExpenses();
    Navigator.pop(context, true);
  }

  void _deleteExpense() {
    if (widget.expenseToEdit != null) {
      setState(() {
        listofExpenses.removeWhere((e) => e.id == widget.expenseToEdit!.id);
      });
      saveExpenses();
      Navigator.pop(context, true);
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  void dispose() {
    noteController.dispose();
    amountController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final currentCategory = Addexpensecategory.categories[selectedCategoryIndex];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.expenseToEdit == null ? "Add Expenses" : "Edit Expense",
          style: TextStyle(color: Appcolor.color0F1B2D, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              // Amount Input Container
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                decoration: BoxDecoration(
                  color: Appcolor.colorF4F6F8,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Rs    ", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: 160,
                      child: TextField(
                        controller: amountController,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(border: InputBorder.none, hintText: "0"),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Form Container (Category, Date, Notes)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Appcolor.purewhite,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    // Category Selection Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Category", style: TextStyle(fontWeight: FontWeight.w500)),
                        Text(currentCategory.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Date Selection Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Date", style: TextStyle(fontWeight: FontWeight.w500)),
                        Text("${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Notes Field
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Notes", style: TextStyle(fontWeight: FontWeight.w500)),
                        Expanded(
                          child: TextField(
                            controller: noteController,
                            textAlign: TextAlign.end,
                            decoration: const InputDecoration(border: InputBorder.none, hintText: "Add note"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Save / Update Button
              InkWell(
                onTap: _saveOrUpdateExpense,
                child: Container(
                  width: double.infinity,
                  height: 52,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Appcolor.deepgreen,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    widget.expenseToEdit == null ? "Add Expense" : "Update Expense",
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),

              // 🗑️ Delete Button (Only visible when editing an existing expense)
              if (widget.expenseToEdit != null) ...[
                const SizedBox(height: 16),
                InkWell(
                  onTap: _deleteExpense,
                  child: Container(
                    width: double.infinity,
                    height: 52,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.red.shade200),
                    ),
                    child: const Text(
                      "Delete Expense",
                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
  }

