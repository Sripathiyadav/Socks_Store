import 'package:flutter/material.dart';
import 'package:socks_store/global/consts.dart';
import 'package:socks_store/screens/HomeScreen/homescreen.dart';
import 'components/favorites_screen_body.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
        return false;
      },
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              'Favorites',
              style: TextStyle(
                fontSize: 30,
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: FavoritesScreenBody(),
          ),
        ],
      ),
    );
  }
}
