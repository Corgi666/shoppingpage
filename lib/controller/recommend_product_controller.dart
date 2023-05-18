import 'package:ecommerce/model/popular_product_model.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/respository/recommend_product_repo.dart';
import 'cart_controller.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});
  late CartController _cart;

  List<ProductsModel> _recommendedProductList = [];
  List<ProductsModel> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quntity = 1;
  int get quntity => _quntity;
  int _result = 0;
  int get result => _result;
  Future<void> getRecommendedProductList() async {
    Response response =
        await recommendedProductRepo.getrecommendedProductList();

    if (response.statusCode == 200) {
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).product!);
      _isLoaded = true;
      update();
    } else {
      print(response.statusCode);
    }
    update();
  }

  void setQuantity(bool isIncrement, int price) {
    if (isIncrement && _quntity < 20) {
      _quntity = _quntity + 1;
      if (_quntity >= 20) {
        Get.snackbar('Item Count', 'You can\'t incress more',
            backgroundColor: AppColors.mainColor, colorText: Colors.white);
        _quntity = 20;
      }
    } else if (_quntity != 0 && isIncrement == false) {
      _quntity = _quntity - 1;
    }
    if (_quntity == 0) {
      Get.snackbar('Item Count', 'You can\'t reduce');
      _quntity = 0;
    }
    _result = _quntity * price;
    update();
  }

  void initProduct(ProductsModel product, CartController cart) {
    _quntity = 1;
    _result = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.exitInCart(product);
    print('exist or not $exist');
    if (exist) {
      _result = _cart.getQuantity(product);
    }
    print('the quantity in the cart is $_result');
  }

  void addItem(ProductsModel product) {
    if (_quntity > 0) {
      _cart.addItem(product, _quntity);
      _quntity = 1;
      _cart.item.forEach((key, value) {
        print('The id is ${value.id}The quantity is${value.quantity}');
      });
      Get.snackbar('Add Cart ', 'Success');
    } else {
      Get.snackbar('Item count', 'You should at least add an item in the cart');
    }
    update();
  }

  int get totalItems => _cart.totalItems;
}
