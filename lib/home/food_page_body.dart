import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/widgets/big_text.dart';
import 'package:ecommerce/widgets/icon_add_text.dart';
import 'package:ecommerce/widgets/small_text.dart';
import 'package:flutter/material.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  // Stack Controller
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double scaleFactor = 0.8;
  double _heigt = 220;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
        print('Current value' + _currPageValue.toString());
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
    return PageView.builder(
        controller: pageController,
        itemCount: 5,
        itemBuilder: (context, positon) {
          return _buildPageItem(positon);
        });
  }

  Widget _buildPageItem(int index) {
    // Matrix Slide Stack widget

    Matrix4 matrix = new Matrix4.identity();
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
        child: Stack(
          children: [
            Container(
              height: 220,
              margin: EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: index.isEven ? Color(0xFF69c5df) : Colors.black,
                  image: DecorationImage(
                      image: AssetImage('assets/image/food0.png'),
                      fit: BoxFit.cover)),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 160,
                width: 350,
                margin: EdgeInsets.only(left: 30, right: 30, bottom: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        offset: Offset(0, 5),
                        blurRadius: 5),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),BoxShadow(color: Colors.white,offset: Offset(5,0))
                  ],
                  color: Colors.white,
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 25, left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(text: 'Chinese Side'),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Wrap(
                            children: [
                              Icon(
                                Icons.star,
                                size: 13,
                                color: AppColors.mainColor,
                              ),
                              Icon(
                                Icons.star,
                                color: AppColors.mainColor,
                                size: 13,
                              ),
                              Icon(
                                Icons.star,
                                color: AppColors.mainColor,
                                size: 13,
                              ),
                              Icon(
                                Icons.star,
                                color: AppColors.mainColor,
                                size: 13,
                              ),
                              Icon(
                                Icons.star,
                                color: AppColors.mainColor,
                                size: 13,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              SmallText(
                                text: '4.5',
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
                        children: [
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
            )
          ],
        ),
      ),
    );
  }
}
