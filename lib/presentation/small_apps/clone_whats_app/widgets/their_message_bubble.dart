import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/presentation/small_apps/clone_whats_app/services/service_load_gif.dart';

class TheirMessageBubble extends StatelessWidget{
  const TheirMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: colors.primary
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              'Labores duis dolore',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),

        const SizedBox(
          height: 10,
        ),

        ImageBubble(),

        const SizedBox(
          height: 10,
        )
      ],
    );
  }

}

class ImageBubble extends StatelessWidget{
  const ImageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return const ServiceLoadGif(
        url: "https://yesno.wtf/assets/no/20-56c4b19517aa69c8f7081939198341a4.gif"
    );





  }

}
