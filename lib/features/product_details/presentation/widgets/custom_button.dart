import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/themes/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double reduis;
  final double width;
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.reduis,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(reduis.r),
      ),
      color: AppColors.primary,
      textColor: Colors.white,
      height: 50.h,
      minWidth: width,
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(fontFamily: "LuckiestGuy", fontSize: 18.sp),
      ),
    );
  }
}
