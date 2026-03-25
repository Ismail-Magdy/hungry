import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextAndPrice extends StatelessWidget {
  final String text;
  final String price;
  const CustomTextAndPrice({
    super.key,
    required this.text,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(color: Colors.grey, fontSize: 15.sp),
          ),
          Text(
            price,
            style: TextStyle(color: Colors.grey.shade800, fontSize: 15.5.sp),
          ),
        ],
      ),
    );
  }
}
