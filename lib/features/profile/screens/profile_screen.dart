import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry_app/core/themes/app_colors.dart';
import 'package:hungry_app/features/profile/widgets/custom_user_text_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _password = TextEditingController();
  //
  @override
  void initState() {
    _name.text = "Ismail Magdy";
    _email.text = "ismailmagdy920@gmail.com";
    _address.text = "Benha , Qaliobia";
    _password.text = "**************";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      // App Bar
      appBar: AppBar(
        scrolledUnderElevation: 0,
        toolbarHeight: 35.h,
        backgroundColor: AppColors.primary,
        leading: SizedBox.shrink(),
        leadingWidth: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: SvgPicture.asset("assets/svgs/settings.svg", height: 17.h),
          ),
        ],
      ),
      //
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 3.h),
        child: Column(
          children: [
            // Profile Image
            Center(
              child: Container(
                width: 120.w,
                height: 100.h,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: Colors.white, width: 5.w),
                ),
              ),
            ),
            SizedBox(height: 25.h),
            //
            CustomUserTextField(controller: _name, label: "Name"),
            //
            SizedBox(height: 20.h),
            //
            CustomUserTextField(controller: _email, label: "Email"),
            //
            SizedBox(height: 20.h),
            //
            CustomUserTextField(
              controller: _address,
              label: "Delivery address",
            ),
            //
            SizedBox(height: 20.h),
            //
            CustomUserTextField(controller: _password, label: "Password"),
            //
            SizedBox(height: 18.h),
            //
            Divider(indent: 25.w, endIndent: 25.w),
            //
            SizedBox(height: 18.h),
            //
            Container(
              width: double.infinity,
              height: 57.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Padding(
                padding: EdgeInsets.only(right: 20.w, left: 18.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/visa.png", height: 20.h),
                    SizedBox(width: 12.w),
                    //
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Debit card",
                          style: TextStyle(
                            color: AppColors.secondry,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: "LuckiestGuy",
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          "3566 **** **** 0505",
                          style: TextStyle(
                            color: AppColors.secondry,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: "LuckiestGuy",
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(
                      (Icons.radio_button_checked),
                      color: AppColors.primary,
                    ),
                  ],
                ),
              ),
            ),

            //
          ],
        ),
      ),
      // Two Buttons
      bottomSheet: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        height: 70.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //
              MaterialButton(
                color: Colors.white,
                minWidth: 150.w,
                height: 47.h,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  side: BorderSide(color: AppColors.primary, width: 4.w),
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      "Edit Profile",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 17.sp,
                        fontFamily: "LuckiestGuy",
                      ),
                    ),
                    SizedBox(width: 10.w),
                    //
                    SvgPicture.asset("assets/svgs/edit.svg", height: 19.h),
                  ],
                ),
              ),
              //
              MaterialButton(
                color: AppColors.primary,
                minWidth: 150.w,
                height: 47.h,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      "Log out",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.sp,
                        fontFamily: "LuckiestGuy",
                      ),
                    ),
                    SizedBox(width: 10.w),
                    //
                    SvgPicture.asset("assets/svgs/sign-out.svg", height: 15.h),
                  ],
                ),
              ),
              //
            ],
          ),
        ),
      ),
    );
  }
}
