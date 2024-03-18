import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/presentation/animations/animated_list_one/animated_list_one.dart';

import 'presentation/animations/animations.dart';
import 'presentation/home.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
        initialRoute: '/',
        routes: {
          '/': (context) => const Home(),
          '/animations': (context) => const Animations(),
          '/animations/animated_list_one' : (context) => const AnimatedListOne(),
        },
    );
  }
}
