import 'package:expense_tracker/Component/Addcategorycomponent.dart';
import 'package:expense_tracker/Models/expense_model.dart';
import 'package:expense_tracker/Utils/Appcolor.dart';
import 'package:expense_tracker/Utils/Appicons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Category_screen extends StatefulWidget {
  const Category_screen({super.key});

  @override
  State<Category_screen> createState() => _Category_screenState();
}

class _Category_screenState extends State<Category_screen> {
 
  late List<ExpenseCategory> localCategories;

  @override
  void initState() {
    super.initState();
    localCategories = List.from(Addexpensecategory.categories);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.purewhite, // Ensures clean background matching your UI mockup
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            children: [
              // 1. Header Row
              Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    borderRadius: BorderRadius.circular(24),
                    child: Container(
                      width: 46,
                      height: 46,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Appcolor.purewhite,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Appicons.Back_arrow_icon,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 48.0),
                        child: const Text(
                          "Categories",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // 2. White Card holding the dynamic Reorderable category list
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: Appcolor.purewhite,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      )
                    ],
                  ),
                  child: ListView.builder(
                      itemCount: localCategories.length,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true, // Crucial if nesting inside a Column/SingleChildScrollView
                      itemBuilder: (context, index) {
                        final category = localCategories[index];
                        
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                         
                          child: Row(
                            children: [
                              // Soft Rounded Icon Box matching your UI design
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: category.color,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                alignment: Alignment.center,
                                child: SvgPicture.asset(category.label), // Renders the icon widget
                              ),
                              const SizedBox(width: 16),
                              // Title Text
                              Expanded(
                                child: Text(
                                  category.name,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              // Reorder Drag Handle Icon (Equals symbol)
                              const Icon(
                                Icons.drag_handle,
                                color: Colors.grey,
                                size: 20,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                ),
              ),
              const SizedBox(height: 16),

              // 3. Green Notice Banner at the bottom
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F5E9), // Light pastel green background
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFC8E6C9)),
                ),
                child: const Text(
                  "Tap a category to rename it or change its color and icon. Drag the handle to reorder.",
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF2E7D32), // Deep green readable text
                    height: 1.4,
                  ),
                ),
              ),

              SizedBox(height: 50,),
              Container(
                width: double.infinity,
                height: 56,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Appcolor.deepgreen,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: InkWell(
                  onTap: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Icon(Icons.add,color: Appcolor.purewhite,),
                      Text("Add Category",style: TextStyle(color: Appcolor.purewhite,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
