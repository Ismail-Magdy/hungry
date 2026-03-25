import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry_app/core/themes/app_colors.dart';

class CustomCard extends StatefulWidget {
  final String image;
  final String title;
  final String subTitle;
  final String rate;
  const CustomCard({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.rate,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          children: [
            Image.asset(
              widget.image,
              height: 120.h,
              width: 150.w,
              fit: BoxFit.contain,
            ),
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      color: AppColors.secondry,
                      fontSize: 15.5.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.subTitle,
                    style: TextStyle(
                      color: AppColors.secondry,
                      fontSize: 13.5.sp,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      SvgPicture.asset("assets/svgs/star.svg", height: 14.h),
                      SizedBox(width: 4.w),
                      Text(
                        widget.rate,
                        style: TextStyle(
                          color: AppColors.secondry,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      //
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isFav = !isFav;
                          });
                        },
                        icon: isFav
                            ? Icon(
                                CupertinoIcons.heart_fill,
                                color: AppColors.primary,
                              )
                            : Icon(
                                CupertinoIcons.heart,
                                color: AppColors.primary,
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
