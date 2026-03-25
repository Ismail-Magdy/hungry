import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/themes/app_colors.dart';
import 'package:hungry_app/features/product_details/data/models/card_toppings_model.dart';
import 'package:hungry_app/features/product_details/presentation/widgets/custom_app_bar.dart';
import 'package:hungry_app/features/product_details/presentation/widgets/custom_button.dart';
import 'package:hungry_app/features/product_details/presentation/widgets/custom_details_and_slider.dart';
import 'package:hungry_app/features/product_details/presentation/widgets/custom_toppings_card.dart';

class OneProductDetails extends StatefulWidget {
  const OneProductDetails({super.key});

  @override
  State<OneProductDetails> createState() => _OneProductDetailsState();
}

class _OneProductDetailsState extends State<OneProductDetails> {
  //
  List<CardToppingsModel> toppings = [
    CardToppingsModel(image: "assets/images/tomatos.png", text: "Tomato"),
    CardToppingsModel(image: "assets/images/onion.png", text: "Onions"),
    CardToppingsModel(image: "assets/images/pickels.png", text: "Pickles"),
    CardToppingsModel(image: "assets/images/meat.png", text: "Bacons"),
  ];
  //
  List<CardToppingsModel> sideOptions = [
    CardToppingsModel(image: "assets/images/fries.png", text: "Fries"),
    CardToppingsModel(image: "assets/images/claw.png", text: "Coleslaw"),
    CardToppingsModel(image: "assets/images/khs.png", text: "Salad"),
    CardToppingsModel(image: "assets/images/onin.png", text: "Onion"),
  ];
  //
  double sliderCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // App Bar
      appBar: CustomAppBar(),
      //
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image and Slider
            CustomDetailsAndSlider(
              value: sliderCount,
              onChanged: (value) => setState(() => sliderCount = value),
            ),
            //
            SizedBox(height: 30.h),
            //
            Column(
              children: [
                // Toppings Text
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 19.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Toppings",
                        style: TextStyle(
                          color: AppColors.secondry,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                //
                SizedBox(height: 15.h),
                // Toppins List
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.only(left: 19.w),
                    child: Row(
                      children: List.generate(
                        toppings.length,
                        (index) => Padding(
                          padding: EdgeInsets.only(right: 30.w),
                          child: CustomToppingsCard(
                            image: toppings[index].image,
                            text: toppings[index].text,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                //
                SizedBox(height: 30.h),
                // Side options Text
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 19.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Side options",
                        style: TextStyle(
                          color: AppColors.secondry,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                //
                SizedBox(height: 15.h),
                // Side options List
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.only(left: 19.w),
                    child: Row(
                      children: List.generate(
                        sideOptions.length,
                        (index) => Padding(
                          padding: EdgeInsets.only(right: 30.w),
                          child: CustomToppingsCard(
                            image: sideOptions[index].image,
                            text: sideOptions[index].text,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                //
                SizedBox(height: 40.h),
                // Button and Price
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 19.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Total and Price
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                              color: AppColors.secondry,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2.h),
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
                      // Button
                      CustomButton(
                        reduis: 15.sp,
                        text: "Add To Cart",
                        onPressed: () {},
                        width: 170.w,
                      ),
                      //
                    ],
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
