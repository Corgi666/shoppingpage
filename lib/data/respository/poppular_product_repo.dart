import 'package:ecommerce/data/api/api_client.dart';
import 'package:ecommerce/utils/app_constant.dart';
import 'package:get/get.dart';

class PoppularProductRepo extends GetxService{
  final ApiClient apiClient;
  PoppularProductRepo({required this.apiClient});
  Future<Response> getPopularProductList()async{
      return await apiClient.getData(AppConstant.POPULAR_PRODUCT_URI);
  }
 
}