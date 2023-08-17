import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:max_store/Faetures/Cart/peresentation/manager/cart_cubit/cart_cubit.dart';
import 'package:max_store/Faetures/Home/presentation/Manager/wish_list_cubit/wish_list_cubit.dart';
import 'package:max_store/Faetures/Home/presentation/views/widgets/product_details_view_body.dart';
import 'package:max_store/Faetures/Splash/presentation/views/widgets/custom_App_bar.dart';
import 'package:max_store/core/Models/product_model.dart';
import 'package:max_store/core/utils/App_router.dart';
import 'package:max_store/core/utils/snack_bar.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 35),
            child: CustomAppBar(
              title: product.name,
              hasBackArrow: true,
            ),
          )),
      body: ProductDetailsViewBOdy(
        product: product,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {
                  BlocProvider.of<WishListCubit>(context)
                      .addProductToWIshList(product: product);
                  showSnackBar(
                      context, 'Product Added To Wish List Successfully');
                },
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextButton(
                onPressed: () {
                  BlocProvider.of<CartCubit>(context).updateCart();
                  BlocProvider.of<CartCubit>(context)
                      .addProductToCart(product: product);
                  GoRouter.of(context).push(Approuter.kCartView);
                },
                style: TextButton.styleFrom(backgroundColor: Colors.white),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'ADD TO CART',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
