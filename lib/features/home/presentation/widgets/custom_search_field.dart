import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/themes/app_colors.dart';

class CustomSearchField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  const CustomSearchField({
    super.key,
    required this.hint,
    required this.controller,
  });

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(17.r),
      child: TextField(
        controller: widget.controller,
        cursorColor: AppColors.primary,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(17.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(17.r),
          ),
          fillColor: Colors.white,
          filled: true,
          prefixIcon: Icon(CupertinoIcons.search, size: 28.sp),
          hintText: widget.hint,
          hintStyle: TextStyle(fontSize: 14.sp, fontFamily: "LuckiestGuy"),
        ),
      ),
    );
    //
  }
}
