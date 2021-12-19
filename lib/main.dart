import 'app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BreakingBookApp());
}

class BreakingBookApp extends StatelessWidget {
  const BreakingBookApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: AppRouter().genrateRoute,
    );
  }
}
