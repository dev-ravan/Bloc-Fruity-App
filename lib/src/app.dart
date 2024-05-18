import 'package:flutter/material.dart';
import 'package:fruity/features/home/ui/home.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.teal,
              iconTheme: IconThemeData(color: Colors.white))),
      home: const HomeScreen(),
    );
  }
}
