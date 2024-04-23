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
              Navigator.pushNamed(context, "/ui_controlls");
            },
            child: const Text("UI Controls"),
          ),

          ElevatedButton(
            onPressed: (){
              Navigator.pushNamed(context, "/snackbar");
            },
            child: const Text("Snackbar"),
          ),

          ElevatedButton(
            onPressed: (){
              Navigator.pushNamed(context, "/progress");
            },
            child: const Text("Progress"),
          ),

          ElevatedButton(
            onPressed: (){
              Navigator.pushNamed(context, "/infinite_scroll");
            },
            child: const Text("Infinite Scroll"),
          ),

          ElevatedButton(
            onPressed: (){
              Navigator.pushNamed(context, "/tutorial");
            },
            child: const Text("Tutorial"),
          ),

          ElevatedButton(
            onPressed: (){
              Navigator.pushNamed(context, "/cards");
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
