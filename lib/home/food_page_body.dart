// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce/controller/popular_controller.dart';
import 'package:ecommerce/controller/recommend_product_controller.dart';
import 'package:ecommerce/food/popular_food_detail.dart';
import 'package:ecommerce/food/recommended_food_detail.dart';
import 'package:ecommerce/model/popular_product_model.dart';
import 'package:ecommerce/utils/app_constant.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/widgets/big_text.dart';
import 'package:ecommerce/widgets/icon_add_text.dart';
import 'package:ecommerce/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/utils/dimension.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  // Stack Controller
  // Setup CurrentPageValue
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double scaleFactor = 0.8;
  final double _heigt = Dimensions.PageViewContainer;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
        // print('Current value' + _currPageValue.toString());
      });
    });
  }

// end of stack controller
  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slide section
        GetBuilder<PoppularProductController>(builder: (popularproduct) {
          return popularproduct.isLoaded
              ? SizedBox(
                   height: Dimensions.screenHeight / 2.63,
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: popularproduct.popularProductList.length,
                      itemBuilder: (context, positon) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => PopularFoodDetail(),
                                arguments: positon);
                          },
                          child: _buildPageItem(positon,
                              popularproduct.popularProductList[positon]),
                        );
                      }),
                )
              : CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        }),
        //dot section
        GetBuilder<PoppularProductController>(builder: (popularProduct) {
          return DotsIndicator(
            dotsCount: popularProduct.popularProductList.isEmpty
                ? 1
                : popularProduct.popularProductList.length,
            position: _currPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        //Poppular section
        SizedBox(height: 30),
        Container(
          margin: EdgeInsets.only(left: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Recommended'),
              SizedBox(width: 10),
              Container(
                  margin: EdgeInsets.only(bottom: 3),
                  child: BigText(
                    text: ".",
                    color: Colors.black26,
                  )),
              SizedBox(
                width: 10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 2),
                child: SmallText(text: 'Food pairing'),
              )
            ],
          ),
        )
        // list of food and images
        ,
        // Get Recommend Product
        GetBuilder<RecommendedProductController>(builder: (RecommendProduct) {
          return RecommendProduct.isLoaded
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: RecommendProduct.recommendedProductList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => RecommendedFoorDetail(), arguments: index);
                      },
                      child: Container(
                        height: 120,
                        margin:
                            EdgeInsets.only(left: 20, right: 20, bottom: 10),
                        child: Row(
                          children: [
                            Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white38,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(AppConstant.BASE_URL +
                                        "/uploads/" +
                                        RecommendProduct
                                            .recommendedProductList[index]
                                            .img!)),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 100,
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    color: Colors.white),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, bottom: 10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      BigText(
                                          text: RecommendProduct
                                              .recommendedProductList[index]
                                              .name!
                                              .toString()),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 20,
                                          ),
                                          for (var i = 0;
                                              i <
                                                  RecommendProduct
                                                      .recommendedProductList[
                                                          index]
                                                      .stars!;
                                              i++)
                                            Icon(
                                              Icons.star,
                                              size: 13,
                                              color: AppColors.mainColor,
                                            ),
                                          for (var star = RecommendProduct
                                                  .recommendedProductList[index]
                                                  .stars!;
                                              star < 5;
                                              star++)
                                            Icon(
                                              Icons.star_outline,
                                              size: 13,
                                              color: AppColors.mainColor,
                                            ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          SmallText(
                                              text: RecommendProduct
                                                  .recommendedProductList[index]
                                                  .location!)
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          IconAndTextWidget(
                                              icon: Icons.circle_rounded,
                                              iconCOlor: AppColors.iconColor1,
                                              text: 'Normal',
                                              color: AppColors.mainColor,
                                              fontsize: 13),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          IconAndTextWidget(
                                              icon: Icons.location_on,
                                              iconCOlor: AppColors.mainColor,
                                              text: '1.7km',
                                              color: AppColors.mainColor,
                                              fontsize: 13),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          IconAndTextWidget(
                                              icon: Icons.access_time_rounded,
                                              iconCOlor: AppColors.iconColor2,
                                              text: '32 min',
                                              color: AppColors.mainColor,
                                              fontsize: 13)
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  })
              : CircularProgressIndicator();
        })
      ],
    );
  }

  //slide
  Widget _buildPageItem(int index, ProductsModel popularProduct) {
    // Matrix Slide Stack widget

    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - scaleFactor);
      var currTrans = _heigt * (1 - currScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          scaleFactor + (_currPageValue - index + 1) * (1 - scaleFactor);
      var currTrans = _heigt * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - scaleFactor);
      var currTrans = _heigt * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _heigt * (1 - scaleFactor) / 2, 1);
    }
    // End of Matrix
    return Container(
      child: Transform(
        transform: matrix,
        child: Container(
          child: Stack(
            children: [
              Container(
                height: Dimensions.PageViewContainer,
                margin: EdgeInsets.only(left: 5, right: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: index.isEven ? Color(0xFF69c5df) : Colors.black,
                  image: DecorationImage(
                      image: NetworkImage(AppConstant.BASE_URL +
                          "/uploads/" +
                          popularProduct.img!),
                      fit: BoxFit.cover),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 160,
                  width: 350,
                  margin: EdgeInsets.only(left: 30, right: 30, bottom: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    // ignore: prefer_const_literals_to_create_immutables
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFFe8e8e8),
                          offset: Offset(0, 5),
                          blurRadius: 5),
                      BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                      BoxShadow(color: Colors.white, offset: Offset(5, 0))
                    ],
                    color: Colors.white,
                  ),
                  child: Container(
                    padding: EdgeInsets.only(top: 25, left: 15, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(text: popularProduct.name!),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Wrap(
                              children: [
                                for (var i = 0; i < popularProduct.stars!; i++)
                                  Icon(
                                    Icons.star,
                                    size: 13,
                                    color: AppColors.mainColor,
                                  ),
                                if (popularProduct.stars! < 5)
                                  for (var star = popularProduct.stars!;
                                      star < 5;
                                      star++)
                                    Icon(
                                      Icons.star_outline,
                                      size: 13,
                                      color: AppColors.mainColor,
                                    ),
                                SizedBox(
                                  width: 10,
                                ),
                                SmallText(
                                  text: popularProduct.stars!.toString(),
                                  size: 14,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                SmallText(
                                  text: '1872',
                                  size: 14,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                SmallText(
                                  text: 'Comments',
                                  size: 14,
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            IconAndTextWidget(
                                icon: Icons.circle,
                                text: 'Normal',
                                fontsize: 14,
                                color: AppColors.mainColor,
                                iconCOlor: AppColors.iconColor1),
                            SizedBox(
                              width: 15,
                            ),
                            IconAndTextWidget(
                                icon: Icons.location_on,
                                text: '1.72km',
                                fontsize: 14,
                                color: AppColors.mainColor,
                                iconCOlor: AppColors.iconColor2),
                            SizedBox(
                              width: 15,
                            ),
                            IconAndTextWidget(
                                icon: Icons.access_time_rounded,
                                text: '32min',
                                fontsize: 14,
                                color: AppColors.mainColor,
                                iconCOlor: AppColors.iconColor1),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
