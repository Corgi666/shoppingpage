import 'package:ecommerce/data/api/api_client.dart';
import 'package:ecommerce/utils/app_constant.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService{
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});
  Future<Response> getrecommendedProductList()async{
      return await apiClient.getData(AppConstant.RECOMMECNDED_PRODUCT_URI);
  }
 
}