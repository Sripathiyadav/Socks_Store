import 'package:flutter/material.dart';
import 'package:socks_store/global/consts.dart';
import 'package:socks_store/screens/HomeScreen/homescreen.dart';
import 'package:socks_store/screens/NotificationsScreen/notifications_screen.dart';
import 'package:socks_store/screens/FavoritesScreen/favorites_screen.dart';
import 'package:socks_store/screens/CartScreen/cartscreen.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int selectedIndex;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
  });

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  late int _selectedIndex;
  int _previousIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    NotificationsScreen(),
    FavoritesScreen(),
    CartScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;

    setState(() {
      _previousIndex = _selectedIndex;
      _selectedIndex = index;
    });

    final isForward = index > _previousIndex;

    Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => _pages[index],
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final begin = Offset(isForward ? 1.0 : -1.0, 0.0);
          final end = Offset.zero;
          final curve = Curves.ease;

          final tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: textColor,
      unselectedItemColor:
          Colors.grey, // Optional: to distinguish selected item
      onTap: _onItemTapped,
    );
  }
}
