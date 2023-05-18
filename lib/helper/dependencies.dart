import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/controller/popular_controller.dart';
import 'package:ecommerce/controller/recommend_product_controller.dart';
import 'package:ecommerce/data/api/api_client.dart';
import 'package:ecommerce/data/respository/cart_repo.dart';
import 'package:ecommerce/data/respository/poppular_product_repo.dart';
import 'package:ecommerce/utils/app_constant.dart';
import 'package:get/get.dart';

import '../data/respository/recommend_product_repo.dart';

Future<void> init() async {
  //API Client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstant.BASE_URL));
  //Repo
  Get.lazyPut(() => PoppularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());
  //Controller
  Get.lazyPut(() => PoppularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));

}

