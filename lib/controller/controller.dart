import 'package:api_product/configuration/helper/api_base_helper.dart';
import 'package:api_product/model/product_detail.dart';
import 'package:api_product/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  var productModel = ProductModel().obs;
  var listProduct = <ProductModel>[].obs;
  var isFavorite = false.obs;
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
      debugPrint('============================22  ');
      isLoding(false);
    }).onError((ErrorModel error, stackTrace) {
      debugPrint(
          '==========${error.statusCode} ===========${error.bodyString}');
    });
    isLoding(false);
    return productModel.value;
  }

  ///
  final productDetail = ProductDetail().obs;

  final detailLoading = false.obs;

  Future<ProductDetail> onGetDetail(int id) async {
    detailLoading(true);
    await apiBaseHelper
        .onNetworkRequesting(
            url: 'products/$id', methode: METHODE.get, isAuthorize: false)
        .then((response) {
      debugPrint('Response============');
      productDetail.value = ProductDetail.fromJson(response);
      // debugPrint('productDetail = ${productDetail.value.title}');

      debugPrint('============================44 ');
      detailLoading(false);
    }).onError((ErrorModel error, stackTrace) {
      debugPrint(
          '==========${error.statusCode} ===========${error.bodyString}');
    });
    detailLoading(false);
    return productDetail.value;
  }

  double disPrice(double price, double disPer) {
    double result = (price * disPer) / 100;
    double total = price - result;
    return total;
  }

  Future<ProductModel> onSearchProduct(String title) async {
    isLoding(true);
    await apiBaseHelper
        .onNetworkRequesting(
            url: 'products/search?q=$title',
            methode: METHODE.get,
            isAuthorize: false)
        .then((response) {
      debugPrint('================================55');
      productModel.value = ProductModel.fromJson(response);
      debugPrint('============================66  ');
      isLoding(false);
    }).onError((ErrorModel error, stackTrace) {
      debugPrint(
          '==========${error.statusCode} ===========${error.bodyString}');
    });
    isLoding(false);
    return productModel.value;
  }

  onSeacrch(String textSearch) {
    final text = textSearch.obs;
    debounce(text, (_) {}, time: const Duration(seconds: 1));
  }
}
