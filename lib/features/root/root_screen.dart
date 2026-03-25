import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/themes/app_colors.dart';
import 'package:hungry_app/features/cart/presentation/screens/cart_screen.dart';
import 'package:hungry_app/features/order_history/presentation/screens/order_history_screen.dart';
import 'package:hungry_app/features/profile/screens/profile_screen.dart';
import '../home/presentation/screens/home_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int selectedIndex = 0;
  //
  final List<Widget> screens = [
    HomeScreen(),
    CartScreen(),
    OrderHistoryScreen(),
    ProfileScreen(),
  ];
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],

      //
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10.w),
        width: double.infinity,
        height: 65.h,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        child: BottomNavigationBar(
          iconSize: 22.sp,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          currentIndex: selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 0.sp,
          unselectedFontSize: 0.sp,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          items: [
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.cart), label: ""),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_restaurant),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
