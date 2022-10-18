import 'package:api_product/page/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';
import 'custom_search_card.dart';

class CustomSearchDelegate extends SearchDelegate {
  List title = [];
  String author = "";
  String result = "";

  final controller = Get.put(Controller());

// first overwrite to
  // clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var items in controller.productModel.value.products) {
      if (items.toString().toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(items.title);
      }
    }

    // return ListView.builder(
    //   itemCount: matchQuery.length,
    //   itemBuilder: (context, index) {
    //     var result = matchQuery[index];
    //     return ListTile(
    //       title: Text(result),
    //     );
    //   },
    // );
    return ListView(
      children: controller.productModel.value.products.asMap().entries.map((e) {
        return CustomSearchCard(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetalScreen(id: e.value.id),
              ),
            );
          },
          productDetailModel: e.value,
          title: controller.productDetail.value.title,
        );
      }).toList(),
    );
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var items in controller.productModel.value.products) {
      if (items.toString().toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(items.title);
      }
    }

    // return ListView.builder(
    //   itemCount: matchQuery.length,
    //   itemBuilder: (context, index) {
    //     var result = matchQuery[index];
    controller.onSearchProduct(query);
    return ListTile(
      title: Text(result),
    );
    //   },
    // );
  }
}
