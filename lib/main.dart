import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/presentation/animations/animated_list_one/animated_list_one.dart';
import 'package:flutter_ui_challenges/presentation/small_apps/clone_whats_app/clone_whats_app.dart';
import 'package:flutter_ui_challenges/presentation/small_apps/clone_whats_app/configuration/theme/app_theme.dart';
import 'package:flutter_ui_challenges/presentation/small_apps/clone_whats_app/presentation/providers/chat_provider.dart';
import 'package:flutter_ui_challenges/presentation/small_apps/small_apps.dart';
import 'package:provider/provider.dart';

import 'presentation/animations/animated_appbar/animated_appbar.dart';
import 'presentation/animations/animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
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
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme(selectedColor: 1).theme(),
          initialRoute: '/',
          routes: {
            '/': (context) => const Home(),
            '/animations': (context) => const Animations(),
            '/animations/animated_list_one' : (context) => AnimatedListOne(),
            '/animations/animated_bottom_navigation_bar' : (context) => const AnimatedBottomNavigationBar(),
            '/animations/animated_appbar' : (context) => const AnimatedAppbar(),
            '/small_apps' : (context) => const SmallApps(),
            '/small_apps/clone_whatsapp' : (context) => const CloneWhatsApp(),
          },
      ),
    );
  }
}
