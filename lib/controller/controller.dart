import 'package:api_product/configuration/helper/api_base_helper.dart';
import 'package:api_product/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  var productModel = ProductModel().obs;
  var listProduct = <ProductModel>[].obs;
  var isLoding = false.obs;
  var apiBaseHelper = ApiBaseHelper();

  Future<ProductModel> onGetData() async {
    isLoding(true);
    await apiBaseHelper
        .onNetworkRequesting(
            url: 'products', methode: METHODE.get, isAuthorize: false)
        .then((response) {
      debugPrint('================================11');
      productModel.value = ProductModel.fromJson(response);
      debugPrint('============================22  ;${productModel.value}');
      isLoding(false);
    }).onError((ErrorModel error, stackTrace) {
      debugPrint(
          '==========${error.statusCode} ===========${error.bodyString}');
    });
    isLoding(false);
    return productModel.value;
  }
}
