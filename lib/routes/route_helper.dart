import 'package:ecommerce/food/popular_food_detail.dart';
import 'package:ecommerce/home/main_foodpage.dart';
import 'package:ecommerce/screens/cart_screens.dart';
import 'package:get/get.dart';

import '../food/recommended_food_detail.dart';

class RouteHelper {
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static String getPopularfood() => popularFood;

  static List<GetPage> routes = [
    GetPage(name: '/', page: () => const MainFoodPage()),
    GetPage(
        name: '/popular-food',
        page: () {
          return const PopularFoodDetail();
        }),
    GetPage(name: '/popular-detail', page: () => const PopularFoodDetail()),
    GetPage(name: '/recommend', page: () => const RecommendedFoorDetail()),
    GetPage(name: '/cart', page: ()=>const CartScreen())
  ];
}
