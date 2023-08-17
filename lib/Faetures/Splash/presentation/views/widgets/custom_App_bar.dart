import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:max_store/core/utils/App_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.hasBackArrow,
  });
  final String title;
  final bool hasBackArrow;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: hasBackArrow,
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          color: Colors.black,
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 24,
                fontFamily: 'Avenir',
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [
        IconButton(
            onPressed: () {
              GoRouter.of(context).push(Approuter.kWishListView);
            },
            icon: const Icon(
              Icons.favorite,
              size: 32,
            ))
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100);
}
