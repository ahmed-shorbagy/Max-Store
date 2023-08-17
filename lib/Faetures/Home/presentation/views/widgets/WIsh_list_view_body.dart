import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:max_store/Faetures/Home/presentation/Manager/wish_list_cubit/wish_list_cubit.dart';
import 'package:max_store/Faetures/Home/presentation/views/widgets/product_card_for_wish_list.dart';

class WishListViewBody extends StatelessWidget {
  const WishListViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: BlocBuilder<WishListCubit, WishListState>(
        builder: (context, state) {
          if (state is WishListLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WishListSuccess) {
            return ListView.builder(
              itemCount: state.productsList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ProductCardForWishList(
                    product: state.productsList[index],
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text('oops'),
            );
          }
        },
      ),
    );
  }
}
