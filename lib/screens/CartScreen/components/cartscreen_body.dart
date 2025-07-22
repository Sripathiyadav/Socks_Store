import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CartScreenBody extends StatelessWidget {
  const CartScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // C
          Lottie.asset(
            "assets/Vector-1.json",
            width: 200,
            height: 200,
            fit: BoxFit.contain,
            repeat: false,
            animate: true,
          ),
        ],
      ),
    );
  }
}
