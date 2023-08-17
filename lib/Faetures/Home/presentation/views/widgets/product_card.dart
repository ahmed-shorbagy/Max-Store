import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:max_store/Faetures/Cart/peresentation/manager/cart_cubit/cart_cubit.dart';
import 'package:max_store/core/utils/App_router.dart';
import 'package:max_store/core/utils/snack_bar.dart';

import '../../../../../core/Models/product_model.dart';
import '../../../../../core/utils/size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {super.key, required this.product, required this.widthFactor});
  final ProductModel product;
  final double widthFactor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(Approuter.kProductDetailsView, extra: product);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Stack(
          children: [
            SizedBox(
              width: SizeConfig.screenwidth! / widthFactor,
              height: 160,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 80,
              bottom: 35,
              child: Container(
                width: SizeConfig.screenwidth! / widthFactor,
                height: 80,
                decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
              ),
            ),
            Positioned(
              top: 85,
              left: 5,
              bottom: 40,
              child: Container(
                  width: SizeConfig.screenwidth! / widthFactor - 10,
                  height: 70,
                  decoration: const BoxDecoration(color: Colors.black),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              product.name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '\$ ${product.price}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Expanded(
                            child: IconButton(
                                onPressed: () {
                                  BlocProvider.of<CartCubit>(context)
                                      .addProductToCart(product: product);
                                  showSnackBar(
                                      context, 'Product Added To CART');
                                },
                                icon: const Icon(
                                  Icons.add_circle,
                                  color: Colors.white,
                                )))
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
