import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCardForPaymentMethod extends StatefulWidget {
  final Color cardColor;
  final String image;
  final double imageHeight;
  final Widget widget;
  final VoidCallback onTapOne;
  final VoidCallback onTapTwo;
  final bool isChecked;

  const CustomCardForPaymentMethod({
    super.key,
    required this.cardColor,
    required this.image,
    required this.imageHeight,
    required this.widget,
    required this.onTapOne,
    required this.onTapTwo,
    required this.isChecked,
  });

  @override
  State<CustomCardForPaymentMethod> createState() =>
      _CustomCardForPaymentMethodState();
}

class _CustomCardForPaymentMethodState
    extends State<CustomCardForPaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.w),
      child: Material(
        elevation: 10.h,
        borderRadius: BorderRadius.circular(20.r),
        child: GestureDetector(
          onTap: widget.onTapOne,
          child: Container(
            width: double.infinity,
            height: 65.h,
            decoration: BoxDecoration(
              color: widget.cardColor,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Padding(
              padding: EdgeInsets.only(right: 20.w, left: 18.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(widget.image, height: widget.imageHeight.h),
                  SizedBox(width: 12.w),

                  widget.widget,
                  //
                  Spacer(),
                  widget.isChecked
                      ? GestureDetector(
                          onTap: widget.onTapOne,
                          child: Icon(
                            (Icons.radio_button_checked),
                            color: Colors.white,
                          ),
                        )
                      : GestureDetector(
                          onTap: widget.onTapTwo,
                          child: Icon(
                            (Icons.radio_button_unchecked),
                            color: widget.isChecked
                                ? Colors.white
                                : Colors.white,
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
