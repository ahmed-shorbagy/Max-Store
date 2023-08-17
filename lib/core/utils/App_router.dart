import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:max_store/Faetures/Cart/data/repos/checkOut_repo_impl.dart';
import 'package:max_store/Faetures/Cart/peresentation/views/CheckOut_view.dart';
import 'package:max_store/Faetures/Cart/peresentation/views/cart_view.dart';
import 'package:max_store/Faetures/Home/presentation/views/Home_view.dart';
import 'package:max_store/Faetures/Home/presentation/views/Product_details_view.dart';
import 'package:max_store/Faetures/Home/presentation/views/Wish_list_view.dart';
import 'package:max_store/Faetures/Home/presentation/views/catalog_view.dart';
import 'package:max_store/Faetures/Splash/presentation/views/Splash_view.dart';
import 'package:max_store/core/Models/category_model.dart';
import 'package:max_store/core/Models/product_model.dart';

import '../../Faetures/Cart/peresentation/manager/cubit/check_out_cubit.dart';

class Approuter {
  static const kHomView = '/HomeView';
  static const kCatalogVIew = '/CatalogVIew';
  static const kProductDetailsView = '/ProductDetailsView';
  static const kWishListView = '/WishListView';
  static const kCartView = '/CartView';
  static const kCheckOutView = '/CheckOutView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SPlashView(),
      ),
      GoRoute(
        path: kHomView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kCatalogVIew,
        builder: (context, state) =>
            CatalogView(category: state.extra as CategoryModel),
      ),
      GoRoute(
        path: kProductDetailsView,
        builder: (context, state) =>
            ProductDetailsView(product: state.extra as ProductModel),
      ),
      GoRoute(
        path: kWishListView,
        builder: (context, state) => const WishListView(),
      ),
      GoRoute(
        path: kCartView,
        builder: (context, state) => const CartView(),
      ),
      GoRoute(
          path: kCheckOutView,
          builder: (context, state) {
            return BlocProvider(
              create: (context) => CheckOutCubit(CheckOutRepoImpl()),
              child: const CheckOutView(),
            );
          }),
    ],
  );
}
