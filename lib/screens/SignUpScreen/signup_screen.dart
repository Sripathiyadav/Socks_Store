import 'package:flutter/material.dart';
import 'package:socks_store/global/consts.dart';
import 'components/signup_screen_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SignUpScreenBody(),
    );
  }
}
