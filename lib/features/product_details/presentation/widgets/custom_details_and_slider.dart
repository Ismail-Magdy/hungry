import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/themes/app_colors.dart';

class CustomDetailsAndSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;
  const CustomDetailsAndSlider({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/images/all.png", height: 230.h),
        //
        Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Text(
                "Customize Your Burger\nto Your Tastes. Ultimate\nExperience",
                style: TextStyle(
                  color: AppColors.secondry,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            //
            SizedBox(height: 12.h),
            //
            Text(
              "Spicy",
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
                fontFamily: "LuckiestGuy",
              ),
            ),
            // Slider
            SliderTheme(
              data: SliderThemeData(
                inactiveTrackColor: Colors.grey,
                activeTrackColor: AppColors.primary,
                thumbColor: AppColors.primary,
              ),
              child: Slider(min: 0, max: 1, value: value, onChanged: onChanged),
            ),
            //
            Row(
              children: [
                Text("🥶"),
                SizedBox(width: 110.w),
                Text("🌶️"),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
