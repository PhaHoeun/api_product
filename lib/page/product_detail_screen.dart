import 'package:api_product/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductDetalScreen extends StatefulWidget {
  const ProductDetalScreen({
    Key? key,
    this.id,
  }) : super(key: key);

  final int? id;

  @override
  State<ProductDetalScreen> createState() => _ProductDetalScreenState();
}

class _ProductDetalScreenState extends State<ProductDetalScreen> {
  final _controller = Get.put(Controller());

  @override
  void initState() {
    _controller.onGetDetail(widget.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => _controller.detailLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 400,
                          autoPlay: true,
                          viewportFraction: 1,
                        ),
                        items: _controller.productDetail.value.images
                            .map(
                              (item) => Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  image: DecorationImage(
                                    image: NetworkImage(item),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      Positioned(
                        top: 50,
                        left: 20,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: 370,
                        child: CircleAvatar(
                          backgroundColor: Colors.red.withOpacity(0.5),
                          radius: 18,
                          child: InkWell(
                            onTap: () {
                              _controller.isFavorite.value =
                                  !_controller.isFavorite.value;
                            },
                            child: _controller.isFavorite.value
                                ? Icon(
                                    Icons.favorite,
                                    size: 25,
                                    color: Colors.cyan[100],
                                  )
                                : const Icon(
                                    Icons.heart_broken,
                                    size: 25,
                                    color: Colors.white,
                                  ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _controller.productDetail.value.title,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const Text('In Stock: '),
                            Text(
                              '${_controller.productDetail.value.stock}',
                              style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const Text(
                              'Price: ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${_controller.disPrice(_controller.productDetail.value.price!.toDouble(), _controller.productDetail.value.discountPercentage!).toStringAsFixed(0)}\$',
                              style: const TextStyle(
                                fontSize: 22,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '${_controller.productDetail.value.price}\$',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Text(_controller.productDetail.value.description),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
