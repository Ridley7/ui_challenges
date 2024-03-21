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
                Navigator.pushNamed(context, "/animations");
              },
              child: Text("Animaciones")
          ),
          ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, "/small_apps");
              },
              child: Text("Small Apps")
          ),
        ],
      ),
    );
  }
}
