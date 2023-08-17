import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:max_store/Faetures/Cart/peresentation/manager/cart_cubit/cart_cubit.dart';
import 'package:max_store/Faetures/Cart/peresentation/manager/cubit/check_out_cubit.dart';
import 'package:max_store/Faetures/Cart/peresentation/views/widgets/product_card_for_cart.dart';
import 'package:max_store/Faetures/Cart/peresentation/views/widgets/purchase_details_section.dart';
import 'package:max_store/core/utils/App_router.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartSuccess) {
          CheckOutCubit.delevieryFee = state.cart!.deliveryFeeString;
          CheckOutCubit.subTotal = state.cart!.subtotalString;
          CheckOutCubit.total = state.cart!.totalString;
          CheckOutCubit.products = state.cart!.products;
        }
      },
      builder: (context, state) {
        if (state is CartLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CartFaluire) {
          return Center(
            child: Text(state.errMessage),
          );
        } else if (state is CartSuccess) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      state.cart!.freeDeliveryString,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            padding: const EdgeInsets.all(12)),
                        onPressed: () {
                          GoRouter.of(context).push(Approuter.kHomView);
                        },
                        child: const Text(
                          'Add More',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.cart!
                      .productQuantity(products: state.cart!.products)
                      .values
                      .length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: ProductCardForCart(
                        product: state.cart!
                            .productQuantity(products: state.cart!.products)
                            .keys
                            .elementAt(index),
                        quantity: state.cart!
                            .productQuantity(products: state.cart!.products)
                            .values
                            .elementAt(index),
                      ),
                    );
                  },
                ),
              ),
              const Divider(
                thickness: 2,
                indent: 30,
                endIndent: 30,
              ),
              const SizedBox(
                height: 15,
              ),
              const PurchaseDetailsSection()
            ],
          );
        } else {
          return const Text('');
        }
      },
    );
  }
}
