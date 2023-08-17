import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:max_store/Faetures/Home/presentation/views/widgets/product_card.dart';
import 'package:max_store/core/Models/category_model.dart';
import 'package:max_store/core/Models/product_model.dart';

import '../../Manager/products_cubit/products_cubit.dart';

class CatalogViewBody extends StatelessWidget {
  const CatalogViewBody({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductsSuccess) {
            final List<ProductModel> categoryProducts = state.products
                .where((product) => product.category == category.categoryName)
                .toList();
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: categoryProducts.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  product: categoryProducts[index],
                  widthFactor: 2.2,
                );
              },
            );
          } else {
            return const Text('some thing went wrong');
          }
        },
      ),
    );
  }
}
