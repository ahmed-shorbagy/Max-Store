import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:max_store/Faetures/Home/presentation/Manager/category_cubit/category_cubit.dart';
import 'package:max_store/Faetures/Home/presentation/views/widgets/carousel_card.dart';
import 'package:max_store/Faetures/Home/presentation/views/widgets/recommended_products_ection.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<CategoryCubit, CategoryState>(
                builder: (context, state) {
                  if (state is CategoryLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is CategoryFaluire) {
                    return Center(
                      child: Text(state.errMessage),
                    );
                  } else if (state is CategorySuccess) {
                    return CarouselSlider(
                        options: CarouselOptions(
                            autoPlay: true,
                            aspectRatio: 1.5,
                            viewportFraction: 0.9,
                            enlargeCenterPage: true,
                            enlargeStrategy: CenterPageEnlargeStrategy.height),
                        items: state.categoriesList
                            .map((category) => CarouselCard(category: category))
                            .toList());
                  } else {
                    return const Text('some thing went wrong');
                  }
                },
              ),
              const RecommendedProductSection(),
            ],
          ),
        ],
      ),
    );
  }
}
