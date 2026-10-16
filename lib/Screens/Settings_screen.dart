
import 'package:expense_tracker/Screens/Category_scren.dart';
import 'package:expense_tracker/Screens/Monthly_budget.dart';
import 'package:expense_tracker/Utils/Appcolor.dart';
import 'package:expense_tracker/Utils/Appicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _isDarkMode = false;
  bool _isReminderOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.colorF4F6F8,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              Text(
                "Settings",
                style: TextStyle(
                  fontSize: 28,
                  letterSpacing: -0.5,
                  color: Appcolor.color0F1B2D,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 16),
              // This is the profile card
              _profileCard(),
              SizedBox(height: 20),
              _sectionTitle("Preferences"),
              SizedBox(height: 8),
              // These are the preferences
              _listCard([
                _settingRow(
                  title: "Currency",
                  showDivider: false,
                  trailing: _valueText("Pakistani Rupee (Rs)"),
                ),
                _settingRow(
                  title: "Monthly budget",
                  trailing: _valueWithArrow("Rs 60,000"),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Monthly_bugdet_screen()));
                  },
                ),
                _settingRow(
                  title: "Categories",
                  trailing: _valueWithArrow("8"),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Category_screen()));
                  },
                ),
                _settingRow(
                  title: "Dark mode",
                  trailing: _toggle(_isDarkMode, () {
                    setState(() => _isDarkMode = !_isDarkMode);
                  }),
                ),
                _settingRow(
                  title: "Daily reminder",
                  subtitle: "Every day at 9:00 PM",
                  trailing: _toggle(_isReminderOn, () {
                    setState(() => _isReminderOn = !_isReminderOn);
                  }),
                ),
              ]),
              SizedBox(height: 20),
              _sectionTitle("Your data"),
              SizedBox(height: 8),
              // These are the actions on the user's data
              _listCard([
                _settingRow(
                  title: "Export as CSV",
                  showDivider: false,
                  trailing: SvgPicture.asset(
                    Appicons.downloadIcon,
                    width: 20,
                    height: 20,
                  ),
                ),
                _settingRow(
                  title: "Log out",
                  trailing: SvgPicture.asset(
                    Appicons.logoutIcon,
                    width: 20,
                    height: 20,
                  ),
                ),
                _settingRow(
                  title: "Delete all data",
                  titleColor: Appcolor.redColor,
                  trailing: SvgPicture.asset(
                    Appicons.deleteIcon,
                    width: 20,
                    height: 20,
                  ),
                ),
              ]),
              SizedBox(height: 16),
              Center(
                child: Text(
                  "Kharcha 1.0",
                  style: TextStyle(
                    fontSize: 12,
                    color: Appcolor.greyColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileCard() {
    return Container(
      height: 86,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Appcolor.purewhite,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Appcolor.colorE3E8EE),
      ),
      child: Row(
        spacing: 14,
        children: [
          Container(
            height: 52,
            width: 52,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Appcolor.colorDCF2E8,
              shape: BoxShape.circle,
            ),
            child: Text(
              "A",
              style: TextStyle(
                fontSize: 22,
                color: Appcolor.greenColor,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 2,
              children: [
                Text(
                  "Ayesha",
                  style: TextStyle(
                    fontSize: 17,
                    color: Appcolor.color0F1B2D,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  "Data saved on this device",
                  style: TextStyle(
                    fontSize: 13,
                    color: Appcolor.greyColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Text(
            "Edit",
            style: TextStyle(
              fontSize: 14,
              color: Appcolor.greenColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 13,
        color: Appcolor.greyColor,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  // This is the white card holding a group of setting rows
  Widget _listCard(List<Widget> rows) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Appcolor.purewhite,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Appcolor.colorE3E8EE),
      ),
      child: Column(children: rows),
    );
  }

  // This is the row of a single setting inside a list card
Widget _settingRow({
  required String title,
  String? subtitle,
  Color? titleColor,
  required Widget trailing,
  bool showDivider = true,
  VoidCallback? onTap, // Added onTap callback
}) {
  return Container(
    height: showDivider ? 55 : 54,
    decoration: BoxDecoration(
      border: showDivider
          ? Border(top: BorderSide(color: Appcolor.colorEEF1F4))
          : null,
    ),
    child: InkWell(
      onTap: onTap, // Binds the click function here
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0), // Optional: Adds padding so the ripple effect stretches nicely
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    color: titleColor ?? Appcolor.color0F1B2D,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (subtitle != null)
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 13,
                      color: Appcolor.greyColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
              ],
            ),
            trailing,
          ],
        ),
      ),
    ),
  );
}

  Widget _valueText(String value) {
    return Text(
      value,
      style: TextStyle(
        fontSize: 14,
        color: Appcolor.greyColor,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _valueWithArrow(String value) {
    return Row(
      spacing: 15,
      children: [
        _valueText(value),
        SvgPicture.asset(Appicons.chevronRightIcon, width: 18, height: 18),
      ],
    );
  }

  Widget _toggle(bool isOn, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: 28,
        width: 46,
        padding: EdgeInsets.all(3),
        alignment: isOn ? Alignment.centerRight : Alignment.centerLeft,
        decoration: BoxDecoration(
          color: isOn ? Appcolor.greenColor : Appcolor.color9AA5B5,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Container(
          height: 22,
          width: 22,
          decoration: BoxDecoration(
            color: Appcolor.purewhite,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
