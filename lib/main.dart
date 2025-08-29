import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socks_store/screens/CartScreen/components/cart_provider.dart';
import 'package:socks_store/screens/FavoritesScreen/components/favorites_provider.dart';
import 'package:socks_store/screens/StartScreen/startscreen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
            title: 'Socks Store',
            theme: ThemeData(
              textTheme: GoogleFonts.balooThambi2TextTheme(),
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 226, 188, 183),
                brightness: Brightness.light,
              ),
              useMaterial3: true,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: const StartScreen(),
          ),
        );
      },
    );
  }
}
