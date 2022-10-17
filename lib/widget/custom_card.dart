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
    // return Container(
    //   width: double.infinity,
    //   height: 150,
    //   margin: const EdgeInsets.only(left: 15, top: 15, right: 15),
    //   decoration: BoxDecoration(
    //     color: Colors.grey[300],
    //   ),
    //   child: Padding(
    //     padding: const EdgeInsets.only(
    //       right: 15,
    //     ),
    //     child: Row(
    //       children: [
    //         Container(
    //           width: 100,
    //           margin: const EdgeInsets.only(right: 15),
    //           decoration: BoxDecoration(
    //             image: DecorationImage(
    //               image: NetworkImage('${productDetailModel!.thumbnail}'),
    //             ),
    //           ),
    //         ),
    //         Expanded(
    //           child: Padding(
    //             padding: const EdgeInsets.only(top: 15),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Text('Id: ${productDetailModel!.id}'),
    //                 Text('Title: ${productDetailModel!.title}',
    //                     overflow: TextOverflow.ellipsis),
    //                 Text(
    //                   'Des: ${productDetailModel!.description}',
    //                   overflow: TextOverflow.ellipsis,
    //                   maxLines: 1,
    //                 ),
    //                 Text('Pric: ${productDetailModel!.price}'),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );

    return Container(
      width: 100,
      height: 250,
      margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                // color: Colors.amber,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage('${productDetailModel!.thumbnail}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              productDetailModel!.title,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Des: ${productDetailModel!.description}',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            const SizedBox(height: 5),
            Text('Pric: ${productDetailModel!.price}\$'),
          ],
        ),
      ),
    );
  }
}
