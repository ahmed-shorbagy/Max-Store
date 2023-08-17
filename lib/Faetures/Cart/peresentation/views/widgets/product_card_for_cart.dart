import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:max_store/Faetures/Cart/peresentation/manager/cart_cubit/cart_cubit.dart';

import '../../../../../core/Models/product_model.dart';
import '../../../../../core/utils/size_config.dart';

class ProductCardForCart extends StatelessWidget {
  const ProductCardForCart({
    super.key,
    required this.product,
    required this.quantity,
  });

  final ProductModel product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Row(
          children: [
            SizedBox(
              height: 120,
              width: SizeConfig.screenwidth! * 0.3,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  '\$${product.price}',
                ),
              ],
            ),
            SizedBox(
              width: SizeConfig.defaultSize! * 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      BlocProvider.of<CartCubit>(context)
                          .removeProductFromCart(product: product);
                    },
                    icon: const Icon(Icons.remove_circle)),
                Text(
                  '$quantity',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () {
                      BlocProvider.of<CartCubit>(context)
                          .addProductToCart(product: product);
                    },
                    icon: const Icon(Icons.add_circle)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
