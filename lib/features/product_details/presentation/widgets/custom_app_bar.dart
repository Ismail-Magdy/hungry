import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? color;
  final Color? arrowColor;
  const CustomAppBar({
    super.key,

    this.color = Colors.white,
    this.arrowColor = const Color.fromARGB(255, 65, 44, 36),
  });
  @override
  Size get preferredSize => Size.fromHeight(35.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      toolbarHeight: 35.h,
      backgroundColor: color,
      leading: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.w),
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Image.asset("assets/images/arrow_back.png", color: arrowColor),
        ),
      ),
    );
  }
}
