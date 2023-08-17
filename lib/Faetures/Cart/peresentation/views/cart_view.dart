import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:max_store/Faetures/Cart/peresentation/views/widgets/Cart_view_body.dart';
import 'package:max_store/Faetures/Cart/peresentation/views/widgets/custom_bottomBar_for_cart.dart';
import 'package:max_store/Faetures/Splash/presentation/views/widgets/custom_App_bar.dart';
import 'package:max_store/core/utils/App_router.dart';

class CartView extends StatefulWidget {
  const CartView({
    super.key,
  });

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const CartViewBody(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 35),
          child: CustomAppBar(
            title: 'Cart',
            hasBackArrow: true,
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomCartBar(
        onpressed: () {
          GoRouter.of(context).push(
            Approuter.kCheckOutView,
          );
        },
        bottonText: 'GO TO CHECKOUT',
      ),
    );
  }
}
