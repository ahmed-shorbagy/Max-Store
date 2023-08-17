import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:max_store/Faetures/Home/presentation/Manager/wish_list_cubit/wish_list_cubit.dart';

import '../../../../../core/Models/product_model.dart';
import '../../../../../core/utils/App_router.dart';
import '../../../../../core/utils/size_config.dart';

class ProductCardForWishList extends StatelessWidget {
  const ProductCardForWishList({super.key, required this.product});
  final ProductModel product;
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
              width: SizeConfig.screenwidth! / 1.1,
              height: 200,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 80,
              bottom: 35,
              child: Container(
                width: SizeConfig.screenwidth! / 1.1,
                height: 80,
                decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
              ),
            ),
            Positioned(
              top: 85,
              left: 5,
              bottom: 40,
              child: Container(
                  width: SizeConfig.screenwidth! / 1.1 - 10,
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
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add_circle,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            onPressed: () {
                              BlocProvider.of<WishListCubit>(context)
                                  .removeProductFromWishList(product: product);
                              const snackBar = SnackBar(
                                  content:
                                      Text('Product removed From Wish List'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        ),
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
