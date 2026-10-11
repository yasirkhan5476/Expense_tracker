import 'package:expense_tracker/Component/MyTextfieldcomponent.dart';
import 'package:expense_tracker/Component/MybuttonComponent.dart';
import 'package:expense_tracker/Screens/Auth/Signup_screen.dart';
import 'package:expense_tracker/Screens/Root_screen.dart';
import 'package:expense_tracker/Utils/Appcolor.dart';
import 'package:expense_tracker/Utils/Appicons.dart';
import 'package:flutter/material.dart';

class Login_screen extends StatefulWidget {
  const Login_screen({super.key});

  @override
  State<Login_screen> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordHidden = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 20.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Top Form Section
                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Keeps items left-aligned
                  children: [
                    // 1. Top Green Icon
                    Container(
                      width: 56,
                      height: 56,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Appcolor.deepgreen,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Appicons.Wallet_icon,
                    ),

                    const SizedBox(height: 24),

                    // 2. Heading & Subtitle
                    const Text(
                      "Welcome back",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Log in to see your expenses on any device.",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade600,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // 3. Email Input Component
                    Mytextfieldcomponent(
                      label: "Email",
                      hintText: "you@example.com",
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),

                    const SizedBox(height: 20),

                    // 4. Password Input Component
                    Mytextfieldcomponent(
                      label: "Password",
                      hintText: "Enter your password",
                      controller: passwordController,
                      isPassword: isPasswordHidden,
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordHidden
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            isPasswordHidden = !isPasswordHidden;
                          });
                        },
                      ),
                    ),

                    // 5. Forgot Password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // TODO: Forgot password logic
                        },
                        child: const Text(
                          "Forgot password?",
                          style: TextStyle(
                            color: Color(0xFF017A54),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // 6. Primary Login Button
                    Mybuttoncomponent(
                      text: "Log in",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RootScreen(),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 10),

                    // 7. "or" Divider
                    Row(
                      children: [
                        Expanded(child: Divider(color: Colors.grey.shade300)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            "or",
                            style: TextStyle(color: Colors.grey.shade500),
                          ),
                        ),
                        Expanded(child: Divider(color: Colors.grey.shade300)),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // 8. Continue with Google Button
                    Mybuttoncomponent(
                      text: "Continue with Google",
                      backgroundColor: Colors.white,
                      textColor: Colors.black87,
                      border: BorderSide(color: Colors.grey.shade300),
                      onTap: () {
                        // TODO: Handle Google Auth
                      },
                    ),
                  ],
                ),

                // Bottom Section: Pushed to the exact bottom edge by spaceBetween
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "New to Kharcha? ",
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Signup_screen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Create account",
                        style: TextStyle(
                          color: Color(0xFF017A54),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
