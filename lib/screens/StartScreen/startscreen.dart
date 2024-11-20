import 'package:flutter/material.dart';
import 'package:socks_store/global/consts.dart';
import 'components/startscreen_body.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: StartScreenBody(),
    );
  }
}
