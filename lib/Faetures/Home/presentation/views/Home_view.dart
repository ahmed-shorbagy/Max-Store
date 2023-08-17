import 'package:flutter/material.dart';
import 'package:max_store/Faetures/Home/presentation/views/widgets/home_view_body.dart';
import 'package:max_store/Faetures/Splash/presentation/views/widgets/bottom_navigation_bar.dart';
import 'package:max_store/Faetures/Splash/presentation/views/widgets/custom_App_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Padding(
            padding: EdgeInsets.only(top: 20, left: 35),
            child: CustomAppBar(
              title: 'Zero To Unicorn',
              hasBackArrow: false,
            ),
          )),
      body: HomeViewBody(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
