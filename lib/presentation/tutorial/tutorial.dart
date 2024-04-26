import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class SlideInfo{

  String title;
  String caption;
  String image;

  SlideInfo(this.title, this.caption, this.image);
}

final slides = <SlideInfo>[
  SlideInfo('Busca la comida', 'Exercitation voluptate cillum eu aute dolor irure aliquip.', 'assets/images/1.png'),
  SlideInfo('Entrega rápida', 'Ullamco ullamco duis labore quis occaecat culpa laborum id incididunt.', 'assets/images/2.png'),
  SlideInfo('Disfruta la comida', 'Ea officia exercitation voluptate nostrud amet esse ut exercitation deserunt est enim est.', 'assets/images/3.png'),
];


class Tutorial extends StatefulWidget {
  const Tutorial({super.key});

  @override
  State<Tutorial> createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {

  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //Se hace esta asignacion por que puede existir un instante en el tiempo
    //en el que page sea null y no tenga valor asignado


    pageViewController.addListener(() {

      final page = pageViewController.page ?? 0;
      if(!endReached && page >= (slides.length - 1.5) ){
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            children: slides.map((slideInfo) => Slide(
                title: slideInfo.title,
                caption: slideInfo.caption,
                imageUrl: slideInfo.image)
            ).toList()
          ),

          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: const Text("Salir")
            ),
          ),

          endReached
          ? Positioned(
            bottom: 20,
            right: 30,
            child: FadeInRight(
              from: 15,
              delay: const Duration(seconds: 1),
              child: FilledButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Comenzar"),
              ),
            ),
          )
              : SizedBox()
        ],
      ),
    );
  }
}



class Slide extends StatelessWidget {
  const Slide({super.key, required this.title, required this.caption, required this.imageUrl});

  final String title;
  final String caption;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imageUrl),
          const SizedBox(height: 20,),
          Text(title, style: titleStyle,),
          const SizedBox(height: 10,),
          Text(caption, style: captionStyle,)
        ],
      ),
    );
  }
}

