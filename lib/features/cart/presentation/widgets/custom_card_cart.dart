import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/themes/app_colors.dart';
import 'package:hungry_app/features/product_details/presentation/widgets/custom_button.dart';

class CustomCardCart extends StatefulWidget {
  const CustomCardCart({
    super.key,
    required this.image,
    required this.topText,
    required this.bottomText,
    required this.onRemove,
  });
  final String image;
  final String topText;
  final String bottomText;
  final void Function() onRemove;

  @override
  State<CustomCardCart> createState() => _CustomCardCartState();
}

class _CustomCardCartState extends State<CustomCardCart> {
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 13.h,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Burger and Text
          Padding(
            padding: EdgeInsets.only(left: 10.w, top: 10.h),
            child: Column(
              children: [
                //
                Image.asset(widget.image, height: 90.h),
                //
                Text(
                  widget.topText,
                  style: TextStyle(
                    color: AppColors.secondry,
                    fontSize: 15.5.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //
                Text(
                  widget.bottomText,
                  style: TextStyle(
                    color: AppColors.secondry,
                    fontSize: 13.5.sp,
                  ),
                ),
                SizedBox(height: 11.h),
              ],
            ),
          ),
          //
          Padding(
            padding: EdgeInsets.only(right: 17.w),
            child: Column(
              children: [
                //
                Row(
                  children: [
                    //
                    MaterialButton(
                      minWidth: 40.w,
                      height: 39.h,
                      color: AppColors.primary,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      onPressed: () {
                        setState(() {
                          if (counter <= 1) {
                          } else {
                            counter--;
                          }
                        });
                      },
                      child: Text("-", style: TextStyle(fontSize: 30.sp)),
                    ),
                    //
                    SizedBox(width: 20.w),
                    //
                    Text(
                      counter.toString(),
                      style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: "LuckiestGuy",
                      ),
                    ),
                    //
                    SizedBox(width: 20.w),
                    //
                    MaterialButton(
                      minWidth: 40.w,
                      height: 39.h,
                      color: AppColors.primary,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      onPressed: () {
                        setState(() {
                          counter++;
                        });
                      },
                      child: Text("+", style: TextStyle(fontSize: 20.sp)),
                    ),
                    //
                  ],
                ),
                //
                SizedBox(height: 25.h),
                //
                CustomButton(
                  width: 170.w,
                  reduis: 30,
                  text: "Remove",
                  onPressed: widget.onRemove,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
