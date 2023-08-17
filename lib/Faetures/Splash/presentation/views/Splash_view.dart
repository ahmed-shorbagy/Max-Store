import 'package:flutter/material.dart';
import 'package:max_store/Faetures/Splash/presentation/views/widgets/SPlash_view_body.dart';
import 'package:max_store/core/utils/size_config.dart';

class SPlashView extends StatelessWidget {
  const SPlashView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: SplashViewBody(),
    );
  }
}
