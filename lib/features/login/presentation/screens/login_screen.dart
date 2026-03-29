import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/themes/app_colors.dart';
import 'package:hungry_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:hungry_app/features/root/root_screen.dart';
import 'package:hungry_app/features/auth/presentation/widgets/custom_button_auth.dart';
import 'package:hungry_app/features/auth/presentation/widgets/custom_small_button_for_auth.dart';
import 'package:hungry_app/features/auth/presentation/widgets/custom_text_field.dart';
import '../../manager/login_cubit.dart';
import '../../manager/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _firstKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// Listen to the LoginCubit for state changes
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const RootScreen()),
          );
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Center(child: Text(state.errorMessage)),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Scaffold(
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
                    Text(
                      "Hungry?",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 55.sp,
                        fontFamily: "LuckiestGuy",
                      ),
                    ),
                    Text(
                      "Welcome Back , Discover The Fast Food",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 40.h),
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
                          CustomTextField(
                            controller: _emailController,
                            obscureText: false,
                            hintText: "Email Address",
                            textError: "Enter The Email",
                          ),
                          SizedBox(height: 20.h),
                          CustomTextField(
                            controller: _passwordController,
                            obscureText: true,
                            hintText: "Password",
                            textError: "Enter The Password",
                          ),
                          SizedBox(height: 30.h),

                          /// Use BlocBuilder to rebuild the login button based on the current state
                          BlocBuilder<LoginCubit, LoginState>(
                            builder: (context, state) {
                              if (state is LoginLoading) {
                                return CircularProgressIndicator(
                                  color: AppColors.primary,
                                );
                              }
                              return CustomButtonAuth(
                                text: "Login",
                                onPressed: () {
                                  if (_firstKey.currentState!.validate()) {
                                    context.read<LoginCubit>().emitLogin(
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomSmallButtonForAuth(
                                text: "SignUp",
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpScreen(),
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
                                      builder: (context) => const RootScreen(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 145.h),
                    Text(
                      "@IsmailMagdy2025",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 15.sp,
                        fontFamily: "LuckiestGuy",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
