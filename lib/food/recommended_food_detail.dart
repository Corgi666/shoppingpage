// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:ecommerce/controller/recommend_product_controller.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/widgets/appIcon.dart';
import 'package:ecommerce/widgets/big_text.dart';
import 'package:ecommerce/widgets/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/cart_controller.dart';
import '../utils/app_constant.dart';

class RecommendedFoorDetail extends StatelessWidget {
  const RecommendedFoorDetail({super.key});

  @override
  Widget build(BuildContext context) {
    RecommendedProductController controller = Get.put(Get.find());

    // Get.find<RecommendedProductController>().initProduct();
    var index = 0;
    if (Get.arguments != null) {
      index = Get.arguments;
    }
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[index];
    Get.find<RecommendedProductController>()
        .initProduct(product, Get.find<CartController>());
    return GetBuilder<RecommendedProductController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
                toolbarHeight: 70,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    // AppIcon(icon: Icons.clear,),
                    GestureDetector(
                      onTap: () => Get.toNamed('/cart'),
                      child: AppIcon(icon: Icons.shopping_cart_checkout),
                    )
                  ],
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(30),
                  child: Container(
                    //margin: EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    // ignore: sort_child_properties_last
                    child: Center(
                      child: BigText(
                        text: controller.recommendedProductList[index].name
                            .toString(),
                        size: 26,
                      ),
                    ),
                    width: double.maxFinite,
                    padding: EdgeInsets.only(top: 5, bottom: 10),
                  ),
                ),
                pinned: true,
                backgroundColor: AppColors.yellowColor,
                expandedHeight: 300,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    AppConstant.BASE_URL +
                        "/uploads/" +
                        controller.recommendedProductList[index].img!,
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                )),
            SliverToBoxAdapter(
              child: Column(children: [
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Expandable_text_widget(
                      text: controller.recommendedProductList[index].description
                          .toString()),
                )
              ]),
            )
          ],
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: 20 * 2.5, right: 20 * 2.5, top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => controller.setQuantity(
                        false, controller.recommendedProductList[index].price!),
                    child: AppIcon(
                      icon: Icons.remove,
                      backgroundColor: AppColors.mainColor,
                      iconColor: Colors.white,
                      IconSize: 24,
                    ),
                  ),
                  GetBuilder<RecommendedProductController>(
                    builder: (_) => BigText(
                      text:
                          '\$ ${controller.recommendedProductList[index].price}' ' X ' '${controller.quntity}',
                      color: AppColors.mainBlackColor,
                      size: 26,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => controller.setQuantity(
                        true, controller.recommendedProductList[index].price!),
                    child: AppIcon(
                      icon: Icons.add,
                      IconSize: 24,
                      backgroundColor: AppColors.mainColor,
                      iconColor: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 120,
              padding:
                  EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
              decoration: BoxDecoration(
                  color: AppColors.buttonBackgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20 * 2),
                      topRight: Radius.circular(20 * 2))),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.only(
                            top: 20, bottom: 20, left: 20, right: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: Icon(
                          Icons.favorite,
                          color: AppColors.mainColor,
                        )),
                    GestureDetector(
                      onTap: () => controller.addItem(product),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.mainColor),
                        child: BigText(
                          text:
                              "\$ ${controller.quntity == 1 ? controller.recommendedProductList[index].price : controller.result} | Add to Cart",
                          color: Colors.white,
                        ),
                      ),
                    )
                  ]),
            ),
          ],
        ),
      );
    });
  }
}
