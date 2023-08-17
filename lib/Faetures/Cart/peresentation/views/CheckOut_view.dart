import 'package:flutter/material.dart';
import 'package:max_store/Faetures/Cart/peresentation/views/widgets/Checkout_view_body.dart';
import 'package:max_store/Faetures/Splash/presentation/views/widgets/custom_App_bar.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Padding(
            padding: EdgeInsets.only(top: 20, left: 35),
            child: CustomAppBar(
              title: 'CheckOut',
              hasBackArrow: true,
            ),
          )),
      body: CheckOutVIewBody(),
    );
  }
}
