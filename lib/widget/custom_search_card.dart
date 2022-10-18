import 'package:flutter/material.dart';

import '../model/product_detail.dart';

class CustomSearchCard extends StatelessWidget {
  const CustomSearchCard({
    Key? key,
    this.productDetailModel,
    this.onTap,
    this.title,
  }) : super(key: key);

  final ProductDetail? productDetailModel;
  final Function()? onTap;
  final String? title; 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 70,
        margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              spreadRadius: 1,
              color: Colors.redAccent.withOpacity(0.2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 60,
              margin: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage('${productDetailModel!.thumbnail}'),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(productDetailModel!.title),
                Text('${productDetailModel!.price}\$'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
