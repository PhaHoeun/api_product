import 'package:api_product/controller/controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetalScreen extends StatelessWidget {
  ProductDetalScreen({Key? key}) : super(key: key);
  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CarouselSlider(
              items: [
                for (var i = 0;
                    i < controller.productModel.value.products.length;
                    i++)
                  Container(
                    margin: const EdgeInsets.only(top: 20.0, left: 20.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            '${controller.productModel.value.products[i]}'),
                        fit: BoxFit.fitHeight,
                      ),
                      // border:
                      //     Border.all(color: Theme.of(context).accentColor),
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
              ],
              options: CarouselOptions(
                height: 400,
                aspectRatio: 0,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                // onPageChanged: callbackFunction,
                scrollDirection: Axis.horizontal,
              ))
        ],
      ),
    );
  }
}
