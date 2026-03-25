import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/themes/app_colors.dart';
import 'package:hungry_app/features/product_details/presentation/widgets/custom_button.dart';

class SucsessOrderView extends StatelessWidget {
  const SucsessOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              elevation: 15.h,
              borderRadius: BorderRadius.circular(20.r),
              child: Container(
                width: 310.w,
                height: 350.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 26.h),
                    CircleAvatar(
                      radius: 40.r,
                      backgroundColor: AppColors.primary,
                      child: Icon(
                        Icons.check,
                        size: 60.sp,
                        color: Colors.white,
                      ),
                    ),
                    //
                    SizedBox(height: 30.h),
                    //
                    Text(
                      "Success !",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 35.sp,
                        fontFamily: "LuckiestGuy",
                      ),
                    ),
                    //
                    SizedBox(height: 10.h),
                    //
                    Text(
                      textAlign: TextAlign.center,
                      "Your payment was successful.\nA receipt for this purchase has\nbeen sent to your email.",
                      style: TextStyle(color: Colors.black, fontSize: 14.5.sp),
                    ),
                    //
                    Spacer(),
                    //
                    CustomButton(
                      text: "Go Back",
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      reduis: 10,
                      width: 200.w,
                    ),
                    SizedBox(height: 40.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
