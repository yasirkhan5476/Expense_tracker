import 'package:expense_tracker/Screens/Dashboard.dart';
import 'package:expense_tracker/Screens/Expenses.dart';
import 'package:flutter/material.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    Dashboard(),
    Expenses_screen(),
    Center(child: Text('Reports')),
    Center(child: Text('Profile')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: _screens,
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey.shade200, width: 1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(icon: Icons.home_outlined, label: "Home", index: 0),
            _buildNavItem(icon: Icons.format_list_bulleted_rounded, label: "Expenses", index: 1),
            GestureDetector(
              onTap: (){},
              child: Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  color: Color(0xFF017A54),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.add, color: Colors.white, size: 28),
              ),
            ),
            _buildNavItem(icon: Icons.bar_chart_rounded, label: "Summary", index: 2),
            _buildNavItem(icon: Icons.tune_rounded, label: "Settings", index: 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({required IconData icon,required String label,required int index,}) {
    final isActive = _currentIndex == index;

    final color = isActive
        ? const Color(0xFF017A54)
        : Colors.grey.shade500;

    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color,
            size: 22,
          ),

          const SizedBox(height: 4),

          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: isActive
                  ? FontWeight.bold
                  : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}