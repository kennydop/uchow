import 'package:flutter/material.dart';
import 'package:u_chow/screens/cart.dart';
import 'package:u_chow/screens/dishdetail.dart';
import 'package:u_chow/screens/explore.dart';
import 'package:u_chow/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UChow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Raleway',
      ),
      home: const Cart(),
    );
  }
}
