import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/themes/app_colors.dart';

class CustomToppingsCard extends StatefulWidget {
  final String image;
  final String text;

  const CustomToppingsCard({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  State<CustomToppingsCard> createState() => _CustomToppingsCardState();
}

class _CustomToppingsCardState extends State<CustomToppingsCard> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return //
    Stack(
      children: [
        // Below Container
        Container(
          width: 95.w,
          height: 95.h,
          decoration: BoxDecoration(
            color: AppColors.secondry,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 10.w, right: 5.w, bottom: 10.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.text,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected = !isSelected;
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: isSelected ? Colors.green : Colors.red,
                    radius: 10.r,
                    child: Icon(
                      isSelected ? Icons.check : Icons.add,
                      color: Colors.white,
                      size: 16.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //
        // Image Container
        Container(
          width: 95.w,
          height: 60.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                offset: Offset(0, 3),
                blurRadius: 4,
                spreadRadius: .4,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(8.w),
            child: Image.asset(widget.image),
          ),
        ),
        //
      ],
    );
    //
  }
}
