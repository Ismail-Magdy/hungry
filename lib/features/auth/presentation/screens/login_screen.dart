import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/themes/app_colors.dart';
import 'package:hungry_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:hungry_app/features/root/root_screen.dart';
import 'package:hungry_app/features/auth/presentation/widgets/custom_button_auth.dart';
import 'package:hungry_app/features/auth/presentation/widgets/custom_small_button_for_auth.dart';
import 'package:hungry_app/features/auth/presentation/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  //
  final GlobalKey<FormState> _firstKey = GlobalKey<FormState>();
  //
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Form(
              key: _firstKey,
              child: Column(
                children: [
                  SizedBox(height: 100.h),
                  // Hungry Text
                  Text(
                    "Hungry?",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 55.sp,
                      fontFamily: "LuckiestGuy",
                    ),
                  ),
                  //
                  // Welcome Text
                  Text(
                    "Welcome Back , Discover The Fast Food",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //
                  SizedBox(height: 40.h),
                  //
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 25.h,
                      horizontal: 20.w,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 228, 228, 228),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                      children: [
                        // Email Text Field
                        CustomTextField(
                          controller: _emailController,
                          obscureText: false,
                          hintText: "Email Address",
                          textError: "Enter The Email",
                        ),
                        //
                        SizedBox(height: 20.h),
                        // Password Text Field
                        CustomTextField(
                          controller: _passwordController,
                          obscureText: true,
                          hintText: "Password",
                          textError: "Enter The Password",
                        ),
                        //
                        SizedBox(height: 30.h),
                        // Button
                        CustomButtonAuth(
                          text: "Login",
                          onPressed: () {
                            if (_firstKey.currentState!.validate()) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RootScreen(),
                                ),
                              );
                            }
                          },
                        ),
                        //
                        SizedBox(height: 20.h),
                        // Two Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomSmallButtonForAuth(
                              text: "SignUp",
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUpScreen(),
                                  ),
                                );
                              },
                            ),
                            CustomSmallButtonForAuth(
                              text: "Guest",
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RootScreen(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        //
                      ],
                    ),
                  ),
                  //
                  SizedBox(height: 145.h),
                  // Copy Right
                  Text(
                    "@IsmailMagdy2025",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 15.sp,
                      fontFamily: "LuckiestGuy",
                    ),
                  ),
                  //
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
