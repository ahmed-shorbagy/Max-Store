import 'package:flutter/material.dart';
import 'package:max_store/Faetures/Home/presentation/views/widgets/products_horizontal_listView.dart';

class RecommendedProductSection extends StatelessWidget {
  const RecommendedProductSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, bottom: 5),
          child: Text(
            'RECOMMENDED',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
        SizedBox(
          height: 180,
          child: Padding(
            padding: EdgeInsets.only(
              left: 20,
            ),
            child: ProductHOrizontalListView(),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, bottom: 5),
          child: Text(
            'MOST POPULAR',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
        SizedBox(
          height: 180,
          child: Padding(
            padding: EdgeInsets.only(
              left: 20,
            ),
            child: ProductHOrizontalListView(),
          ),
        )
      ],
    );
  }
}
