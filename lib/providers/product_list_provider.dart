
import 'package:flutter/material.dart';
import 'package:flutter_assignment/models/product_list_entity.dart';
import 'package:flutter_assignment/network_module/api_response.dart';
import 'package:flutter_assignment/repositories/product_repo.dart';

// product list provider notify the network data
class ProductListProvider with ChangeNotifier {
  ProductListRepository _productListRepository;

  ApiResponse<List<ProductListEntity>> _productList;

  ApiResponse<List<ProductListEntity>> get productList=> _productList;

  ProductListProvider() {
    _productListRepository = ProductListRepository();
    fetchProductList();
  }

  //fetching product list from network
  fetchProductList() async {
    _productList = ApiResponse.loading('loading... ');
    notifyListeners();
    try {
      List<ProductListEntity> productList = await _productListRepository.fetchProductListDetails();
      _productList = ApiResponse.completed(productList);
      notifyListeners();
    } catch (e) {
      _productList = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }

}