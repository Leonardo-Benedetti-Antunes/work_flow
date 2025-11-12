import 'package:flutter/material.dart';
import 'package:work_flow/core/di/injection.dart';
import 'package:work_flow/modules/home_page/view/home_page_view.dart';

void main() async {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Work Flow',
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Color.fromARGB(255, 26, 115, 232),
          onPrimary: Color.fromARGB(255, 247, 249, 252),
          secondary: Color.fromARGB(255, 94, 163, 255),
          onSecondary: Colors.black,
          error: Color.fromARGB(255, 232, 26, 26),
          onError: Colors.black,
          surface: Color.fromARGB(255, 247, 249, 252),
          onSurface: Colors.black,
        ),
      ),
      home: HomePageView(),
    );
  }
}
