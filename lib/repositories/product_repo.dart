
import 'package:flutter_assignment/models/product_list_entity.dart';
import 'package:flutter_assignment/network_module/api_path.dart';
import 'package:flutter_assignment/network_module/http_client.dart';

// product list repository class
class ProductListRepository {
  // http call for fetching product list
  Future<List<ProductListEntity>> fetchProductListDetails() async {
    final response = await HttpClient.instance.fetchData(APIPathHelper.getValue(APIPath.fetch_product));
    print("Response - $response");
    List<dynamic> data = response["data"];
    List<ProductListEntity> productList = [];
    data.forEach((element){
      ProductListEntity productEntity = ProductListEntity.fromJson(element);
      productList.add(productEntity);
      });
    return productList;
  }

}