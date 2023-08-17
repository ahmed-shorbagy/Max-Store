import 'package:flutter/material.dart';
import 'package:max_store/Faetures/Home/presentation/views/widgets/catalog_view_body.dart';
import 'package:max_store/Faetures/Splash/presentation/views/widgets/custom_App_bar.dart';
import 'package:max_store/core/Models/category_model.dart';

class CatalogView extends StatelessWidget {
  const CatalogView({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 15),
          child: CustomAppBar(
            title: category.categoryName,
            hasBackArrow: true,
          ),
        ),
      ),
      body: CatalogViewBody(
        category: category,
      ),
    );
  }
}
