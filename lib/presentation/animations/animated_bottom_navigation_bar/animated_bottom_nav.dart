import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/presentation/animations/animated_bottom_navigation_bar/bottom_nav_item.dart';

class AnimatedBottomNav extends StatelessWidget {
  const AnimatedBottomNav({super.key, this.currentIndex, this.onChange});

  final int? currentIndex;
  final Function(int)? onChange;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 64,
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          Expanded(
              child: InkWell(
                onTap: () => onChange!(0),
                child: BottomNavItem(
                  icon: Icons.home,
                  title: "Home",
                  isActive: currentIndex == 0,
                ),
              )),
          Expanded(
              child: InkWell(
                onTap: () => onChange!(1),
                child: BottomNavItem(
                  icon: Icons.verified_user,
                  title: "User",
                  isActive: currentIndex == 1,
                ),
              )),
          Expanded(
              child: InkWell(
                onTap: () => onChange!(2),
                child: BottomNavItem(
                  icon: Icons.menu,
                  title: "Menu",
                  isActive: currentIndex == 2,
                ),
              )),
          Expanded(
              child: InkWell(
                onTap: () => onChange!(3),
                child: BottomNavItem(
                  icon: Icons.settings,
                  title: "Settings",
                  isActive: currentIndex == 3,
                ),
              )),
        ],
      ),
    );
  }
}

