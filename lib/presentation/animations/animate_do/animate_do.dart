import 'dart:math';
import 'package:flutter/material.dart';

class AnimateDo extends StatefulWidget {
  const AnimateDo({super.key});

  @override
  State<AnimateDo> createState() => _AnimateDoState();
}

class _AnimateDoState extends State<AnimateDo> {

  double width = 100;
  double height = 100;
  Color color = Colors.indigo;
  double borderRadius = 10.0;

  void changeShape(){
    final random = Random();

    width = random.nextInt(300) + 120.0;
    height = random.nextInt(300) + 120.0;
    borderRadius = random.nextInt(100) + 20.0;

    color = Color.fromRGBO(
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
        1
    );

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.bounceInOut,
          width: width < 0 ? 0 : width,
          height: height < 0 ? 0 : height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius < 0 ? 0 : borderRadius),
            color: color
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}
