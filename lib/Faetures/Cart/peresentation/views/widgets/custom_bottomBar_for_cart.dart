import 'package:flutter/material.dart';

class CustomBottomCartBar extends StatelessWidget {
  const CustomBottomCartBar({
    super.key,
    r,
    required this.bottonText,
    this.onpressed,
  });
  final String bottonText;
  final void Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 95, vertical: 10),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            onPressed: onpressed,
            child: Text(
              bottonText,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            )),
      ),
    );
  }
}
