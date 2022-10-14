import 'package:api_product/model/product_detail.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    this.productDetailModel,
  }) : super(key: key);
  final ProductDetail? productDetailModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      margin: const EdgeInsets.only(left: 15, top: 15, right: 15),
      decoration: BoxDecoration(
        color: Colors.grey[300],
      ),
      child: Column(
        children: [
          Text('Id: ${productDetailModel!.id}'),
          Text('Title: ${productDetailModel!.title}'),
          Text('Dis ${productDetailModel!.description}'),
        ],
      ),
    );
  }
}
