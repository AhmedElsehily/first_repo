






import 'package:app/screens/account.dart';
import 'package:app/screens/home_page.dart';
import 'package:app/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'routes/app_routes.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (context) => SplashScreen(),
        AppRoutes.account: (context) => AccountPage(),
        // AppRoutes.home: (context) => HomePage(),
      },
    );
  }
}


