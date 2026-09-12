import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/themes/app_colors.dart';
import 'package:hungry_app/features/login/presentation/screens/login_screen.dart';
import 'package:hungry_app/features/root/root_screen.dart';
import 'package:hungry_app/features/auth/widgets/custom_button_auth.dart';
import 'package:hungry_app/features/auth/widgets/custom_small_button_for_auth.dart';
import 'package:hungry_app/features/auth/widgets/custom_text_field.dart';
import 'package:hungry_app/features/sign_up/manager/sign_up_cubit.dart';
import '../../manager/sign_up_state.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();

  //
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        } else if (state is SignUpErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text(state.errorMessage),
            ),
          );
        }
      },
      child: GestureDetector(
        // to close focus at TextField
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 60.h),
                      //
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
                          //  fontFamily: "LuckiestGuy",
                        ),
                      ),
                      //
                      SizedBox(height: 60.h),
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
                            // Username Text Field
                            CustomTextField(
                              controller: _userNameController,
                              obscureText: false,
                              hintText: "User Name",
                              textError: "Enter The Name",
                            ),
                            //
                            SizedBox(height: 20.h),
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
                            SizedBox(height: 20.h),

                            // Button
                            BlocBuilder<SignUpCubit, SignUpState>(
                              builder: (context, state) {
                                if (state is SignUpLoadingState) {
                                  return CircularProgressIndicator(
                                    color: AppColors.primary,
                                  );
                                }
                                return CustomButtonAuth(
                                  text: "Sign Up",
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      context.read<SignUpCubit>().emitSignUp(
                                        name: _userNameController.text,
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                      );
                                    }
                                  },
                                );
                              },
                            ),

                            //
                            SizedBox(height: 20.h),
                            // Two Buttons
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomSmallButtonForAuth(
                                  text: "Login",
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginScreen(),
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
                      SizedBox(height: 115.h),
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
        ),
      ),
    );
  }
}
