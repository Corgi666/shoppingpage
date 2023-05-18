import 'package:get/get.dart';

import '../data/respository/cart_repo.dart';
import '../model/cart_model.dart';
import '../model/popular_product_model.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  final Map<int, CartModel> _item = {};
  Map<int, CartModel> get item => _item;

  void addItem(ProductsModel product, int quantity) {
    var totalQuantity = 0;
    if (_item.containsKey(product.id!)) {
      _item.update(product.id!, (value) {
        totalQuantity = value.quantity! + quantity;

        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          quantity: value.quantity! + quantity,
          isExit: true,
          time: DateTime.now().toString(), product: product,
        );
      });
      if (totalQuantity <= 0) {
        _item.remove(product.id);
      }
    } else {
      _item.putIfAbsent(product.id!, () {
        _item.forEach((key, value) {
          print('quantity is ${value.quantity}');
        });
        // print('Add Item to cart' + product.id!.toString() + quantity.toString());
        return CartModel(
            id: product.id,
            name: product.name,
            price: product.price,
            img: product.img,
            quantity: quantity,
            isExit: true,
            time: DateTime.now().toString(),
            product: product);
      });

     
    }
    // print('length of the item is'+_item.length.toString());
     update();
  }

  bool exitInCart(ProductsModel product) {
    if (_item.containsKey(product.id)) {
      return true;
    }
    return false;
  }

  getQuantity(ProductsModel product) {
    var quantity = 0;
    if (_item.containsKey(product.id)) {
      _item.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
      return quantity;
    }
  }

  int get totalItems {
    var totalQuantity = 0;
    _item.forEach((key, value) {
      totalQuantity = totalQuantity + value.quantity!;
    });
    return totalQuantity;
  }

  List<CartModel> get getItems {
    return _item.entries.map((e) => e.value).toList();
  }

  void incress(bool incress, int quantity) {}
}
