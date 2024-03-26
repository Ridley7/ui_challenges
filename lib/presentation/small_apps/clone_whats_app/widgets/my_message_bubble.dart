import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/presentation/small_apps/clone_whats_app/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget{
  const MyMessageBubble({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: colors.primary
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),

        const SizedBox(
          height: 10,
        )
      ],
    );
  }

}
