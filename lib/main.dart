import 'package:flutter/material.dart';
import 'package:shaped/screens/exames_screen.dart';
import 'package:shaped/screens/login_screen.dart';
import 'package:shaped/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: Routes.LOGIN_SCREEN,
        routes: {
          Routes.LOGIN_SCREEN: (context) => LoginScreen(),
          Routes.EXAMES_SCREEN: (context) => ExamesScreen(),
        });
  }
}
