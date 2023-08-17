import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:max_store/Faetures/Cart/peresentation/manager/cart_cubit/cart_cubit.dart';
import 'package:max_store/Faetures/Home/data/repos/Home_repo_impl.dart';
import 'package:max_store/Faetures/Home/presentation/Manager/BLoc_observer/simple_bloc_observer.dart';
import 'package:max_store/Faetures/Home/presentation/Manager/category_cubit/category_cubit.dart';
import 'package:max_store/Faetures/Home/presentation/Manager/products_cubit/products_cubit.dart';
import 'package:max_store/Faetures/Home/presentation/Manager/wish_list_cubit/wish_list_cubit.dart';
import 'package:max_store/core/utils/App_router.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBLocObserver();
  runApp(const MaxStore());
}

class MaxStore extends StatelessWidget {
  const MaxStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WishListCubit(),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        ),
        BlocProvider(
          create: (context) =>
              CategoryCubit(HomeRepoImpl())..getAllCategories(),
        ),
        BlocProvider(
          create: (context) => ProductsCubit(HomeRepoImpl())..getAllProducts(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: Approuter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Avenir'),
      ),
    );
  }
}
