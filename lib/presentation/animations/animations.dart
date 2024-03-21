import 'package:flutter/material.dart';

class Animations extends StatelessWidget {
  const Animations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animaciones"),),
      body: ListView(
        children: [
          ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, "/animations/animated_appbar");
              },
              child: Text("Animated Appbar")
          ),
          ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, "/animations/animated_bottom_navigation_bar");
              },
              child: Text("Animated Bottom Navigation Bar")
          ),
          ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, "/animations/animated_list_one");
              },
              child: Text("Animated List One")
          )
        ],
      ),
    );
  }
}
