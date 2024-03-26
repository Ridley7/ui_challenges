import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/presentation/small_apps/clone_whats_app/domain/entities/message.dart';
import 'package:flutter_ui_challenges/presentation/small_apps/clone_whats_app/services/service_load_gif.dart';

class TheirMessageBubble extends StatelessWidget{
  const TheirMessageBubble({super.key, required this.message});

  final Message message;

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
        ),

        ImageBubble(urlImage: message.imageUrl!),

        const SizedBox(
          height: 10,
        )
      ],
    );
  }

}

class ImageBubble extends StatelessWidget{
  const ImageBubble({super.key, required this.urlImage});

  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return ServiceLoadGif(
        url: urlImage
    );





  }

}
