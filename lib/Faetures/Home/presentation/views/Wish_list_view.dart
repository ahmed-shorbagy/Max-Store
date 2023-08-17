import 'package:flutter/material.dart';
import 'package:max_store/Faetures/Home/presentation/views/widgets/WIsh_list_view_body.dart';

import '../../../Splash/presentation/views/widgets/custom_App_bar.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Padding(
            padding: EdgeInsets.only(top: 20, left: 35),
            child: CustomAppBar(
              title: 'Wish List',
              hasBackArrow: true,
            ),
          )),
      body: WishListViewBody(),
    );
  }
}
