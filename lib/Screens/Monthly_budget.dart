import 'package:expense_tracker/Utils/Appcolor.dart';
import 'package:expense_tracker/Utils/Appicons.dart';
import 'package:flutter/material.dart';

class Monthly_bugdet_screen extends StatefulWidget {
  const Monthly_bugdet_screen({super.key});

  @override
  State<Monthly_bugdet_screen> createState() => _Monthly_bugdet_screenState();
}

class _Monthly_bugdet_screenState extends State<Monthly_bugdet_screen> {
  bool isWarningEnabled = true;

  // Mock data matching your design inputs
  final List<Map<String, dynamic>> budgetLimits = [
    {"category": "Food", "spent": 11600, "limit": 15000},
    {"category": "Bills", "spent": 12800, "limit": 14000},
    {"category": "Transport", "spent": 5200, "limit": 6000},
    {"category": "Shopping", "spent": 4800, "limit": 8000},
    {"category": "Health", "spent": 2400, "limit": 4000},
    {"category": "Fun", "spent": 3200, "limit": 4000},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
            child: Column(
              children: [
                // Top App Bar Row
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
                            "Monthly Budget",
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

                // Warning Switch Container
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade100),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Warn me at 80%",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF0F1B2D),
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            "Get a nudge before you overspend",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Switch(
                        value: isWarningEnabled,
                        activeTrackColor: const Color(0xFF0A6644),
                        inactiveTrackColor: Colors.grey.shade200,
                        onChanged: (value) {
                          setState(() {
                            isWarningEnabled = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Subheading
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Limits by category",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF5A6E85),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Limits List Container Card
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade100),
                  ),
                  child: Column(
                    children: budgetLimits.asMap().entries.map((entry) {
                      final index = entry.key;
                      final item = entry.value;
                      final double spent = item["spent"].toDouble();
                      final double limit = item["limit"].toDouble();
                      final double percentage = (spent / limit).clamp(0.0, 1.0);

                      final bool isHighRisk = percentage > 0.85;
                      final Color dynamicTextColor = isHighRisk
                          ? const Color(0xFFC62828)
                          : const Color(0xFF5A6E85);

                      Color progressBarColor = const Color(0xFF0A6644);
                      if (percentage > 0.85) {
                        progressBarColor = const Color(0xFFB71C1C);
                      } else if (percentage > 0.70) {
                        progressBarColor = const Color(0xFFC65116);
                      }

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (index > 0) const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item["category"],
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF0F1B2D),
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "Rs ${item['spent'].toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: dynamicTextColor,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: " / ${item['limit'].toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          // Custom Budget Bar Track Layout
                          Container(
                            width: double.infinity,
                            height: 6,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEEF1F4),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: (percentage * 100).toInt(),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: progressBarColor,
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: ((1 - percentage) * 100).toInt(),
                                  child: const SizedBox.shrink(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 20),

                // Save Budget Button
                InkWell(
                  onTap: () {
                    // Action for saving configurations
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    width: double.infinity,
                    height: 56,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0A6644),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text(
                      "Save budget",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
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