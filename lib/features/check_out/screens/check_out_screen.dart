import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/themes/app_colors.dart';
import 'package:hungry_app/features/check_out/screens/sucsess_order_view.dart';
import 'package:hungry_app/features/check_out/widgets/custom_bold_text.dart';
import 'package:hungry_app/features/check_out/widgets/custom_card_for_payment_method.dart';
import 'package:hungry_app/features/check_out/widgets/custom_text_and_price.dart';
import 'package:hungry_app/features/product_details/presentation/widgets/custom_app_bar.dart';
import 'package:hungry_app/features/product_details/presentation/widgets/custom_button.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  String selectedPaymentMethod = "cash";
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: Column(
        children: [
          CustomBoldText(text: "Order summary"),
          //
          SizedBox(height: 10.h),
          //
          CustomTextAndPrice(text: "Order", price: "\$16.48"),
          //
          SizedBox(height: 10.h),
          //
          CustomTextAndPrice(text: "Taxes", price: "\$0.3"),
          //
          SizedBox(height: 10.h),
          //
          CustomTextAndPrice(text: "Delivery Fees", price: "\$1.5"),
          //
          SizedBox(height: 9.h),
          //
          Divider(indent: 25.w, endIndent: 25.w),
          //
          SizedBox(height: 10.h),
          // Total
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: TextStyle(
                    color: AppColors.secondry,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "\$18.19",
                  style: TextStyle(
                    color: AppColors.secondry,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          //
          SizedBox(height: 20.h),
          // Estimated Time
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Estimated delivery time:",
                  style: TextStyle(
                    color: AppColors.secondry,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "15 - 30 mins",
                  style: TextStyle(
                    color: AppColors.secondry,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          //
          SizedBox(height: 50.h),
          //
          CustomBoldText(text: "Payment methods"),
          //
          SizedBox(height: 17.h),
          //  Cash on Delivery Card
          CustomCardForPaymentMethod(
            cardColor: AppColors.secondry,
            image: "assets/images/dollar.png",
            imageHeight: 60.h,
            widget: Text(
              "Cash on Delivery",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.5.sp,
                fontWeight: FontWeight.bold,
                fontFamily: "LuckiestGuy",
              ),
            ),
            onTapOne: () {
              setState(() {
                selectedPaymentMethod = "cash";
              });
            },
            onTapTwo: () {
              setState(() {
                selectedPaymentMethod = "cash";
              });
            },
            isChecked: selectedPaymentMethod == "cash",
          ),
          //
          SizedBox(height: 15.h),
          //  Visa Card
          CustomCardForPaymentMethod(
            cardColor: Colors.green.shade500,
            image: "assets/images/visa.png",
            imageHeight: 20.h,
            widget: Column(
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
            onTapOne: () {
              setState(() {
                selectedPaymentMethod = "visa";
              });
            },
            onTapTwo: () {
              setState(() {
                selectedPaymentMethod = "visa";
              });
            },
            isChecked: selectedPaymentMethod == "visa",
          ),
          //
          SizedBox(height: 10.h),
          // Checkbox for Save Card
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  activeColor: Colors.red,
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                Text(
                  "Save card details for future payments",
                  style: TextStyle(fontSize: 13.sp),
                ),
              ],
            ),
          ),
          //
          Spacer(),
          // Total & Pay Button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Total Price",
                      style: TextStyle(
                        color: AppColors.secondry,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "\$18.19",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 30.sp,
                        fontFamily: "LuckiestGuy",
                      ),
                    ),
                  ],
                ),
                CustomButton(
                  reduis: 15.sp,
                  text: "Pay Now",
                  onPressed: () {
                    showAdaptiveDialog(
                      context: context,
                      builder: (context) => SucsessOrderView(),
                    );
                  },
                  width: 170.w,
                ),
              ],
            ),
          ),
          //
          SizedBox(height: 12.h),
        ],
      ),
    );
  }
}
