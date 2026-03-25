import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/themes/app_colors.dart';

class CustomButtonAuth extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomButtonAuth({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 40.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.r),
        side: BorderSide(color: AppColors.primary),
      ),
      color: Colors.white,
      textColor: AppColors.primary,
      onPressed: onPressed,
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 20.sp, fontFamily: "LuckiestGuy"),
        ),
      ),
    );
  }
}
