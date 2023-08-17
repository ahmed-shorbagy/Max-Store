import 'package:flutter/material.dart';
import 'package:max_store/core/Models/product_model.dart';
import 'package:max_store/core/utils/size_config.dart';

class ProductDetailsViewBOdy extends StatelessWidget {
  const ProductDetailsViewBOdy({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              elevation: 35,
              child: Container(
                width: SizeConfig.screenwidth! / 1.1,
                height: 250,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 65,
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      '\$${product.price}',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            ExpansionTile(
              initiallyExpanded: true,
              title: const Text(
                'Product Description',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              children: [
                ListTile(
                  title: Text(product.description ?? ''),
                )
              ],
            ),
            const SizedBox(
              height: 45,
            ),
            ExpansionTile(
              initiallyExpanded: true,
              title: const Text(
                'Deleviry Details',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              children: [
                ListTile(
                  title: Text(product.name),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
