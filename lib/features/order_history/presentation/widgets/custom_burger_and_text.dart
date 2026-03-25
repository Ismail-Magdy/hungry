import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/app_colors.dart';

class CustomBurgerAndText extends StatelessWidget {
  const CustomBurgerAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10.w, top: 10.h),
          child: Column(
            children: [
              //
              Image.asset("assets/images/4.png", height: 90.h),
              //
              SizedBox(height: 10.h),
            ],
          ),
        ),
        //
        //
        Padding(
          padding: EdgeInsets.only(right: 30.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //
              Text(
                "Hamburger",
                style: TextStyle(
                  color: AppColors.secondry,
                  fontSize: 15.5.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //
              SizedBox(height: 5.h),
              //
              Text(
                "Qty : X3",
                style: TextStyle(
                  color: AppColors.secondry,
                  fontSize: 15.5.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //
              SizedBox(height: 5.h),
              //
            ],
          ),
        ),
        //
      ],
    );
  }
}
