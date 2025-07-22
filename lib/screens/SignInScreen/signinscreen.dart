import 'package:flutter/material.dart';
import 'package:socks_store/global/consts.dart';
import 'components/signinscreen_body.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      // appBar: AppBar(
      //   backgroundColor: primaryColor,
      //   automaticallyImplyLeading: false,
      //  // title: Text('SigninScreen'),
      // ),
      body: SigninScreenBody(),
    );
  }
}
