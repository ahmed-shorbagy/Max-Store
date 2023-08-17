import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:max_store/Faetures/Home/presentation/views/widgets/product_card.dart';

import '../../Manager/products_cubit/products_cubit.dart';

class ProductHOrizontalListView extends StatelessWidget {
  const ProductHOrizontalListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProductsSuccess) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ProductCard(
                product: state.products[index],
                widthFactor: 2.5,
              );
            },
            itemCount: state.products.length,
          );
        } else if (state is ProductsFaluire) {
          return Text(state.errMessage);
        } else {
          return const Text('error');
        }
      },
    );
  }
}
