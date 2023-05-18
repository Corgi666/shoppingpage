// ignore_for_file: prefer_const_constructors

import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/controller/popular_controller.dart';
import 'package:ecommerce/widgets/appIcon.dart';
import 'package:ecommerce/widgets/app_column.dart';
import 'package:ecommerce/widgets/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_constant.dart';
import '../utils/colors.dart';
import '../widgets/big_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    int index = 0;
    if(Get.arguments!=null){
      index = Get.arguments;
    }

    PoppularProductController controller =
        PoppularProductController(popularProductRepo: Get.find());
    var product =
        Get.find<PoppularProductController>().popularProductList[index];
    Get.find<PoppularProductController>()
        .initProduct(product, Get.find<CartController>());

    return GetBuilder<PoppularProductController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("${AppConstant.BASE_URL}/uploads/" +
                              controller.popularProductList[index].img!))),
                )),
            Positioned(
                left: 20,
                right: 20,
                top: 45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: AppIcon(icon: Icons.arrow_back_ios)),
                    GetBuilder<PoppularProductController>(
                        builder: (_) => GestureDetector(
                            onTap: () => Get.toNamed('/cart'),
                            child: Stack(
                              children: [
                                AppIcon(icon: Icons.shopping_cart_outlined),
                                Get.find<PoppularProductController>()
                                            .totalItems >=
                                        1
                                    ? Positioned(
                                        top: 0,
                                        right: 0,
                                        child: AppIcon(
                                          icon: Icons.circle,
                                          siez: 20,
                                          iconColor: Colors.transparent,
                                          backgroundColor: AppColors.mainColor,
                                        ),
                                      )
                                    : Container(),
                                Get.find<PoppularProductController>()
                                            .totalItems >=
                                        1
                                    ? Positioned(
                                        top: 4,
                                        right: 4,
                                        child: BigText(
                                          text: Get.find<
                                                  PoppularProductController>()
                                              .totalItems
                                              .toString(),
                                          size: 12,
                                          color: Colors.white,
                                        ),
                                      )
                                    : Container()
                              ],
                            )))
                  ],
                )),
            Positioned(
              left: 0,
              right: 0,
              top: 330,
              bottom: 0,
              child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(
                        starCount: controller.popularProductList[index].stars,
                        star: controller.popularProductList[index].stars,
                        text: controller.popularProductList[index].name,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      BigText(
                        text: 'Introduce',
                        color: AppColors.mainColor,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Expandable_text_widget(
                              text: controller
                                  .popularProductList[index].description),
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: 120,
          padding: EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
          decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20 * 2),
                  topRight: Radius.circular(20 * 2))),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
                padding:
                    EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: GetBuilder<PoppularProductController>(
                  builder: (controller) => Row(
                    children: [
                      GestureDetector(
                        onTap: () => controller.setQuantity(
                            false, controller.popularProductList[index].price),
                        child: Icon(
                          Icons.remove,
                          color: AppColors.signColor,
                        ),
                      ),
                      SizedBox(
                        width: 10 / 2,
                      ),
                      BigText(text: controller.quntity.toString()),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () => controller.setQuantity(
                            true, controller.popularProductList[index].price),
                        child: Icon(
                          Icons.add,
                          color: AppColors.signColor,
                        ),
                      )
                    ],
                  ),
                )),
            GetBuilder<PoppularProductController>(builder: (controller) {
              return GestureDetector(
                onTap: () => controller.addItem(product),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.mainColor),
                  child: BigText(
                    text:
                        "\$ ${controller.quntity == 1 ? controller.popularProductList[index].price : controller.result} | Add to Cart",
                    color: Colors.white,
                  ),
                ),
              );
            })
          ]),
        ),
      );
    });
  }
}
