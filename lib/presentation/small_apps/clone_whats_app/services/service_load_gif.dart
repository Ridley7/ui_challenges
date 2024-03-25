import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ServiceLoadGif extends StatelessWidget {
  const ServiceLoadGif({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return

      ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: CachedNetworkImage(
          imageUrl: url,
          width: size.width * 0.7,
          height: 150,
          fit: BoxFit.cover,
          progressIndicatorBuilder: (context, url, downloadProgress){
            return Container(
              width: size.width * 0.7,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Text("Mi amor está enviando una imagen"),
            );
          }
      ),
    );
    


    /*
      ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
        url,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, downloadProgress){
          if(downloadProgress == null) return child;
        
          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text("Mi amor esta enviando una imagen"),
          );
        },
        
            ),
      );

     */

    
  }
}

