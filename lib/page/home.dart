import 'package:api_product/controller/controller.dart';
import 'package:api_product/page/product_detail_screen.dart';
import 'package:api_product/widget/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(Controller());
  @override
  void initState() {
    controller.onGetData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Product'),
      ),
      body: Obx(
        () => GridView.count(
          crossAxisCount: 2,
          children: controller.productModel.value.products.map((e) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  ProductDetalScreen(),
                  ),
                );
              },
              child: CustomCard(
                productDetailModel: e,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
