import 'package:average_calculation/constant/app_constant.dart';
import 'package:average_calculation/widgets/average_calculate_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Average Calcuate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Constant.mainColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const AverageCalculPage(),
    );
  }
}
