import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/features/order_history/presentation/widgets/custom_burger_and_text.dart';
import 'package:hungry_app/features/product_details/presentation/widgets/custom_button.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //
      appBar: AppBar(
        toolbarHeight: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
      ),
      //
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 5.h),
            //
            ...List.generate(
              4,
              (index) => Padding(
                padding: EdgeInsets.only(top: 3.h, right: 5.w, left: 5.w),
                child: Card(
                  elevation: 10.h,
                  color: Colors.white,
                  child: Column(
                    children: [
                      // Burger and Text
                      CustomBurgerAndText(),
                      //
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.w,
                          right: 10.w,
                          bottom: 10.h,
                        ),
                        child: CustomButton(
                          width: double.infinity,
                          text: "Re Order",
                          onPressed: () {},
                          reduis: 20,
                        ),
                      ),
                      //
                    ],
                  ),
                ),
              ),
            ),
            //
          ],
        ),
      ),
    );
  }
}
