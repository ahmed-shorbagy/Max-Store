import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SPlash_view_body.dart';

class SlidingContainer extends StatelessWidget {
  const SlidingContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        return SlideTransition(
          position: animation,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              color: Colors.black,
              child: const Text(
                'Max Store',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
        );
      },
    );
  }
}
