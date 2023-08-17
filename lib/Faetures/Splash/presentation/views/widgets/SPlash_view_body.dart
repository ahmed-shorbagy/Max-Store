// ignore_for_file: use_build_context_synchronously

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:max_store/Faetures/Splash/presentation/views/widgets/sliding_container.dart';
import 'package:max_store/core/utils/App_router.dart';
import 'package:max_store/core/utils/size_config.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

late AnimationController animationController;
late Animation<Offset> animation;

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
    _checkInternetAndNavigate();
  }

  Future<void> _checkInternetAndNavigate() async {
    bool isConnected = await checkInternetConnectivity();
    if (!isConnected) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('No Internet Connection'),
            content: const Text('Please check your network connection.'),
            actions: <Widget>[
              TextButton(
                child: const Text('Close App'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.screenhieght! * 0.2,
        ),
        const SizedBox(
          height: 200,
          child: Image(
            image: AssetImage('assets/images/logo.png'),
          ),
        ),
        const SlidingContainer()
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    animation = Tween<Offset>(begin: const Offset(0, 6), end: Offset.zero)
        .animate(animationController);
    animationController.forward();
  }

  void navigateToHome() async {
    bool isConnected = await checkInternetConnectivity();
    if (isConnected) {
      Future.delayed(const Duration(seconds: 3), () {
        GoRouter.of(context).push(Approuter.kHomView);
      });
    }
  }
}

Future<bool> checkInternetConnectivity() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  return connectivityResult != ConnectivityResult.none;
}
