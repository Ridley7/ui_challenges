import 'package:flutter/material.dart';

class BorderedContainer extends StatelessWidget {
  const BorderedContainer({super.key, this.child, this.margin, this.padding});

  final Widget? child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: Colors.black,
              width: 1
          )
      ),
      child: child,
    );
  }
}
