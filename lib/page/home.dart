import 'package:api_product/controller/controller.dart';
import 'package:api_product/page/product_detail_screen.dart';
import 'package:api_product/widget/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
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
        () => controller.isLoding.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GridView.count(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                childAspectRatio: 5 / 6,
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: controller.productModel.value.products
                    .asMap()
                    .entries
                    .map((e) {
                  return AnimationConfiguration.staggeredGrid(
                    position: controller.productModel.value.products.length,
                    columnCount: 2,
                    child: ScaleAnimation(
                      duration: const Duration(milliseconds: 500),
                      child: FadeInAnimation(
                        duration: const Duration(milliseconds: 500),
                        child: CustomCard(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetalScreen(
                                  id: e.value.id,
                                ),
                              ),
                            );
                          },
                          productDetailModel: e.value,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
      ),
    );
  }
}
