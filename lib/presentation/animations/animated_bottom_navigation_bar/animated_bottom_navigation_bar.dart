import 'package:flutter/material.dart';

class AnimatedBottomNavigationBar extends StatefulWidget {
  const AnimatedBottomNavigationBar({super.key});

  @override
  State<AnimatedBottomNavigationBar> createState() => _AnimatedBottomNavigationBarState();
}

class _AnimatedBottomNavigationBarState extends State<AnimatedBottomNavigationBar> {
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
          onChange: (index){
            setState(() {
              _currentPage = index;
            });
          },
        )

    );


  }

  getPage(int? page){
    switch(page){
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

class AnimatedBottomNav extends StatelessWidget{

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
              )
          ),

          Expanded(
              child: InkWell(
                onTap: () => onChange!(1),
                child: BottomNavItem(
                  icon: Icons.verified_user,
                  title: "User",
                  isActive: currentIndex == 1,
                ),
              )
          ),

          Expanded(
              child: InkWell(
                onTap: () => onChange!(2),
                child: BottomNavItem(
                  icon: Icons.menu,
                  title: "Menu",
                  isActive: currentIndex == 2,
                ),
              )
          ),

          Expanded(
              child: InkWell(
                onTap: () => onChange!(3),
                child: BottomNavItem(
                  icon: Icons.settings,
                  title: "Settings",
                  isActive: currentIndex == 3,
                ),
              )
          ),
      ],
    ),
    );
  }

}

class BottomNavItem extends StatelessWidget{
  final bool isActive;
  final IconData? icon;
  final Color? activeColor;
  final Color? inactiveColor;
  final String? title;

  const BottomNavItem({super.key, required this.isActive, this.icon, this.activeColor, this.inactiveColor, this.title});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      transitionBuilder: (child, animation){
        return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero
            ).animate(animation),
          child: child,
        );
      },
        duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 200),
      child: isActive
      ? Container(
        color: Colors.white,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: activeColor ?? Theme.of(context).primaryColor
              ),
            ),
            const SizedBox(height: 5.0,),
            Container(
              width: 5.0,
              height: 5.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: activeColor ?? Theme.of(context).primaryColor
              ),
            )
          ],
        ),
      )
      :
      Icon(
        icon,
        color: inactiveColor ?? Colors.grey,
      ),
    );
  }


}
