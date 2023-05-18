// ignore_for_file: prefer_const_constructors

import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/widgets/appicon2.dart';
import 'package:ecommerce/widgets/big_text.dart';
import 'package:ecommerce/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_constant.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            pinned: true,
            toolbarHeight: 80,
            elevation: 0,
            leading:
                AppIcon2(icon: Icons.arrow_back_ios, onpress: () => Get.back()),
            actions: [
              AppIcon2(
                  icon: Icons.home_outlined, onpress: () => Get.toNamed('/')),
            ],
          ),
          GetBuilder<CartController>(
            builder: (controller) => SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                var quantity = controller.getItems[index].product;
                return Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  height: 120,
                  child: Row(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: NetworkImage("${AppConstant.BASE_URL}/uploads/${controller.getItems[index].img}"),
                                fit: BoxFit.cover)),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(
                              size: 18,
                              text: controller.getItems[index].name.toString()),
                          SmallText(
                              text: controller.getItems[index].id.toString()),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$${controller.getItems[index].price}',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(width: 70),
                              Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        onPressed: () => controller
                                                    .getItems[index].quantity !=
                                                1
                                            ? controller.addItem(
                                                controller
                                                    .getItems[index].product!,
                                                -1)
                                            : null,
                                        icon: Icon(Icons.remove)),
                                    SizedBox(width: 5),
                                    Text(
                                      controller.getItems[index].quantity
                                          .toString(),
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    SizedBox(width: 5),
                                    IconButton(
                                        onPressed: () {
                                          if (controller
                                                  .getItems[index].quantity! <
                                              20) {
                                            controller.addItem(
                                                controller
                                                    .getItems[index].product!,
                                                1);
                                          }
                                        },
                                        icon: Icon(Icons.add))
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                );
              }, childCount: controller.getItems.length),
            ),
          )
        ],
      ),
    );
  }
}
