import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/themes/app_colors.dart';

class CustomSmallButtonForAuth extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomSmallButtonForAuth({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 120.w,
        height: 45.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(color: AppColors.primary),
        ),

        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20.sp,
              fontFamily: "LuckiestGuy",
              color: AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}
