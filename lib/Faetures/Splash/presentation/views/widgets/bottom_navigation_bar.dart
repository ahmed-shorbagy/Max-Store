import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:max_store/Faetures/Cart/peresentation/manager/cart_cubit/cart_cubit.dart';
import 'package:max_store/core/utils/App_router.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.home,
                  color: Colors.white,
                )),
            Stack(
              children: [
                IconButton(
                    onPressed: () {
                      BlocProvider.of<CartCubit>(context).updateCart();
                      GoRouter.of(context).push(
                        Approuter.kCartView,
                      );
                    },
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    )),
                Positioned(
                  top: 6,
                  left: 30,
                  child: BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                      if (state is CartSuccess) {
                        return CircleAvatar(
                          radius: 8,
                          backgroundColor: state.cart!.products.isEmpty
                              ? Colors.black
                              : Colors.red,
                          child: Text(
                            '${state.cart!.products.isEmpty ? ('') : state.cart!.productQuantity(products: state.products!).values.reduce((value, element) => value + element)}',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily:
                                    GoogleFonts.notoSansOldTurkic.toString(),
                                fontWeight: FontWeight.bold),
                          ),
                        );
                      } else {
                        return const Text('');
                      }
                    },
                  ),
                )
              ],
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person,
                  color: Colors.white,
                )),
          ],
        ),
      ),
    );
  }
}
