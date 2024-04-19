import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Menu"),),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: (){
              Navigator.pushNamed(context, "/cars");
            },
            child: const Text("Cards"),
          ),

          ElevatedButton(
            onPressed: (){
              Navigator.pushNamed(context, "/botones");
            },
            child: const Text("Botones"),
          ),

          ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, "/animations");
              },
              child: const Text("Animaciones")
          ),

          ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, "/small_apps");
              },
              child: const Text("Small Apps")
          ),


        ],
      ),
    );
  }
}
