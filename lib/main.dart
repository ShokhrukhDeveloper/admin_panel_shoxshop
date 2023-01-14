import 'package:dashboard_shox_shop/presentation/category/alert_category.dart';
import 'package:dashboard_shox_shop/presentation/main_page/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AlertCategory(),
    );
    // home: const MainPage());
  }
}
