import 'package:flutter/material.dart';

class SmallApps extends StatelessWidget {
  const SmallApps({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Small Apps"),),
      body: ListView(
        children: [
          ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, "/small_apps/clone_whatsapp");
              },
              child: const Text("Clone Whats App")
          ),
          /*
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
          */
        ],
      ),
    );
  }
}
