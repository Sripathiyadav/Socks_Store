import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socks_store/screens/CartScreen/components/cartscreen_body.dart';
import 'package:socks_store/screens/FavoritesScreen/components/favorites_provider.dart';
import 'package:socks_store/screens/StartScreen/startscreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => CartProvider()),
            ChangeNotifierProvider(create: (_) => FavoritesProvider()),
          ],
          child: MaterialApp(
            // title: 'Socks Store',
            theme: ThemeData(
              textTheme: GoogleFonts.balooThambi2TextTheme(),
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            home: StartScreen(),
          ),
        );
      },
    );
  }
}
