class Product {
  int? _totalSize;
  int? _typeId;
  int? _offset;
  late List<ProductsModel>? _products;
  List<ProductsModel>?get product =>_products;
  Product({required totalSize,required typeId,required offset,required products}){
      _totalSize = totalSize;
      _typeId = typeId;
      _offset = offset;
      _products = products;
  }

  Product.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total_size'];
    _typeId = json['type_id'];
    _offset = json['offset'];
    if (json['products'] != null) {
      _products = <ProductsModel>[];
      json['products'].forEach((v) {
        _products!.add(ProductsModel.fromJson(v));
      });
    }
  }
}

class ProductsModel {
  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  String? img;
  String? location;
  String? createdAt;
  String? updatedAt;
  int? typeId;

  ProductsModel(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.stars,
      this.img,
      this.location,
      this.createdAt,
      this.updatedAt,
      this.typeId});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stars = json['stars'];
    img = json['img'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    typeId = json['type_id'];
  }
}




// class Product {
//   int? totalSize;
//   int? typeId;
//   int? offset;
//   List<ProductsModel>? products;

//   Product({this.totalSize, this.typeId, this.offset, this.products});

//   Product.fromJson(Map<String, dynamic> json) {
//     totalSize = json['total_size'];
//     typeId = json['type_id'];
//     offset = json['offset'];
//     if (json['products'] != null) {
//       products = <ProductsModel>[];
//       json['products'].forEach((v) {
//         products!.add(ProductsModel.fromJson(v));
//       });
//     }
//   }
// }

// class ProductsModel {
//   int? id;
//   String? name;
//   String? description;
//   int? price;
//   int? stars;
//   String? img;
//   String? location;
//   String? createdAt;
//   String? updatedAt;
//   int? typeId;

//   ProductsModel(
//       {this.id,
//       this.name,
//       this.description,
//       this.price,
//       this.stars,
//       this.img,
//       this.location,
//       this.createdAt,
//       this.updatedAt,
//       this.typeId});

//   ProductsModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     description = json['description'];
//     price = json['price'];
//     stars = json['stars'];
//     img = json['img'];
//     location = json['location'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     typeId = json['type_id'];
//   }
// }
