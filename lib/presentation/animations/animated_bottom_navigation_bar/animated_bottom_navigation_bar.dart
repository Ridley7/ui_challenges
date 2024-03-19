import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/presentation/animations/animated_bottom_navigation_bar/animated_bottom_nav.dart';

class AnimatedBottomNavigationBar extends StatefulWidget {
  const AnimatedBottomNavigationBar({super.key});

  @override
  State<AnimatedBottomNavigationBar> createState() =>
      _AnimatedBottomNavigationBarState();
}

class _AnimatedBottomNavigationBarState
    extends State<AnimatedBottomNavigationBar> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Animated Bottom Navigation Bar"),
        ),
        backgroundColor: Colors.grey.shade300,
        body: getPage(_currentPage),
        bottomNavigationBar: AnimatedBottomNav(
          currentIndex: _currentPage,
          onChange: (index) {
            setState(() {
              _currentPage = index;
            });
          },
        ));
  }

  getPage(int? page) {
    switch (page) {
      case 0:
        return const Center(
          child: Text("Home Page"),
        );
      case 1:
        return const Center(
          child: Text("Profile Page"),
        );
      case 2:
        return const Center(
          child: Text("Menu Page"),
        );
      case 3:
        return const Center(
          child: Text("Settings Page"),
        );
    }
  }
}


