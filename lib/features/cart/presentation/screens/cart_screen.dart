import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/themes/app_colors.dart';
import 'package:hungry_app/features/check_out/screens/check_out_screen.dart';
import 'package:hungry_app/features/cart/presentation/widgets/custom_card_cart.dart';
import 'package:hungry_app/features/product_details/presentation/widgets/custom_button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int counter = 0;
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
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 5.h),
            // Card
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.w),
              //
              child: Column(
                children: List.generate(
                  6,
                  (index) => Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: CustomCardCart(
                      image: "assets/images/4.png",
                      topText: "Hamburger",
                      bottomText: "Veggie Burger",
                      onRemove: () {},
                    ),
                  ),
                ),
              ),
            ),
            //
            SizedBox(height: 30.h),
            //
            // Total and Price
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                          color: AppColors.secondry,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "\$99.19",
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 30.sp,
                          fontFamily: "LuckiestGuy",
                        ),
                      ),
                    ],
                  ),
                  // Button
                  CustomButton(
                    reduis: 15.sp,
                    text: "Checkout",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CheckOutScreen(),
                        ),
                      );
                    },
                    width: 170.w,
                  ),
                ],
              ),
            ),
            //
          ],
        ),
      ),
    );
  }
}
