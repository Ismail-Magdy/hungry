import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/themes/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  final String textError;

  const CustomTextField({
    super.key,
    required this.controller,
    this.obscureText = false,
    required this.hintText,
    required this.textError,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isEye = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return widget.textError;
        }

        if (widget.hintText.toLowerCase().contains("email")) {
          final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
          if (!emailRegex.hasMatch(value.trim())) {
            return "Please enter a valid email address";
          }
        }

        return null;
      },

      controller: widget.controller,
      obscureText: widget.obscureText && !_isEye,
      style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
      cursorErrorColor: Colors.red,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        suffixIcon: widget.obscureText
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _isEye = !_isEye;
                  });
                },
                icon: Icon(
                  _isEye ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                ),
              )
            : null,
        suffixIconColor: !_isEye
            ? const Color.fromARGB(255, 88, 88, 88)
            : AppColors.primary,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: AppColors.primary,
          fontFamily: "LuckiestGuy",
          fontSize: 12.sp,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
