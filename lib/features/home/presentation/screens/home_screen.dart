import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/themes/app_colors.dart';
import 'package:hungry_app/features/home/data/models/products_model.dart';
import 'package:hungry_app/features/product_details/presentation/screens/one_product_details.dart';
import 'package:hungry_app/features/home/presentation/widgets/custom_card.dart';
import 'package:hungry_app/features/home/presentation/widgets/custom_search_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  //
  List categories = ["All", "Combos", "Sliders", "Classic"];
  int selectedIndex = 0;

  // المنتجات الأساسية
  List<ProductsModel> products = [
    ProductsModel(
      image: "assets/images/1.png",
      title: "Cheeseburger",
      subTitle: "Wendy's Burger",
      rate: "4.9",
      category: "Combos",
    ),
    ProductsModel(
      image: "assets/images/2.png",
      title: "Hamburger",
      subTitle: "Veggie Burger",
      rate: "4.8",
      category: "Classic",
    ),
    ProductsModel(
      image: "assets/images/3.png",
      title: "Chicken Burger",
      subTitle: "Fried Chicken",
      rate: "4.6",
      category: "Sliders",
    ),
    ProductsModel(
      image: "assets/images/4.png",
      title: "Beef Burger",
      subTitle: "Combo Meal",
      rate: "4.5",
      category: "Combos",
    ),
  ];

  //  المنتجات المفلترة
  List<ProductsModel> filteredProducts = [];
  //
  @override
  void initState() {
    super.initState();
    filteredProducts = products;
  }

  //
  void filterProducts() {
    String selectedCategory = categories[selectedIndex];
    setState(() {
      if (selectedCategory == "All") {
        filteredProducts = products;
      } else {
        filteredProducts = products
            .where((product) => product.category == selectedCategory)
            .toList();
      }
    });
  }

  //
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            //
            /// App Bar & Category List
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Text
                        Text(
                          "Hungry?",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 40.sp,
                            fontFamily: "LuckiestGuy",
                          ),
                        ),
                        // Image
                        Container(
                          width: 50.w,
                          height: 50.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset(
                            "assets/images/sonic.png",
                            fit: BoxFit.cover,
                          ),
                        ),

                        //
                      ],
                    ),
                    SizedBox(height: 5.h),
                    // Text Ismail
                    Text(
                      "Hello, Ismail Magdy",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.sp,
                        fontFamily: "LuckiestGuy",
                      ),
                    ),
                    //
                    SizedBox(height: 15.h),
                    // TextField
                    CustomSearchField(
                      hint: "search",
                      controller: _searchController,
                    ),
                    //
                    SizedBox(height: 20.h),
                    // Categories
                    SizedBox(
                      height: 45.h,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              selectedIndex = index;
                              filterProducts();
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 10.w),
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              decoration: BoxDecoration(
                                color: selectedIndex == index
                                    ? AppColors.primary
                                    : Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  categories[index],
                                  style: TextStyle(
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : Colors.black54,
                                    fontSize: 15.sp,
                                    fontFamily: "LuckiestGuy",
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ),

            /// Grid View
            SliverPadding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 15.h),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: filteredProducts.length,
                  //
                  (context, index) {
                    final product = filteredProducts[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OneProductDetails(),
                        ),
                      ),
                      child: CustomCard(
                        image: product.image,
                        title: product.title,
                        subTitle: product.subTitle,
                        rate: product.rate,
                      ),
                    );
                  },
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.w,
                  mainAxisSpacing: 15.h,
                  childAspectRatio: 0.5046.h,
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
