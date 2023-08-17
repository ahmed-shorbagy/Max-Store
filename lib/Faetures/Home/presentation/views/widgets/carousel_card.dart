import 'package:flutter/material.dart';

import '../../../../../core/Models/category_model.dart';
import 'carousel_slider.dart';

class CarouselCard extends StatelessWidget {
  const CarouselCard({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CarouselSlider(category: category),
        ),
      ],
    );
  }
}
