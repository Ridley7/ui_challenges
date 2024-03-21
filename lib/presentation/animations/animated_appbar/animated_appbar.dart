import 'package:flutter/material.dart';

class AnimatedAppbar extends StatefulWidget {
  const AnimatedAppbar({super.key});

  @override
  State<AnimatedAppbar> createState() => _AnimatedAppbarState();
}

class _AnimatedAppbarState extends State<AnimatedAppbar> {
  final ScrollController _scrollController = ScrollController();
  double topPosition = -80;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  _onScroll(){
    if(_scrollController.offset > 50){
      if(topPosition < 0){
        setState(() {
          topPosition = -130 + _scrollController.offset;
          if(_scrollController.offset > 130){
            topPosition = 0;
          }
        });
      }else{
        if(topPosition > -80){//Estamos subiendo
          setState(() {
            topPosition--;
            if(_scrollController.offset <= 0){
              topPosition = -80;
            }
          });
        }

      }



    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 16.0, right: 50),
                  height: 210,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(30.0)),
                    color: Colors.white
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 70,
                      ),
                      Text(
                        "Awesome and simple app bar hiding animation",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "AWESOME",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 30,),

                Container(
                  height: 320,
                  color: Colors.orange,
                ),

                const SizedBox(height: 30.0),
                Container(
                  height: 320,
                  color: Colors.red,
                ),
                const SizedBox(height: 30.0),
                Container(
                  height: 320,
                  color: Colors.yellow,
                ),
                const SizedBox(height: 30.0),
                Container(
                  height: 320,
                  color: Colors.pink,
                ),
                const SizedBox(height: 30.0),
              ],
            ),
          ),

          Positioned(
            top: topPosition,
              left: 0,
              right: 0,
              child: Container(
                height: 80,
                padding: const EdgeInsets.only(left: 50, top: 25.0, right: 20.0),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(bottomRight: Radius.circular(30.0)),
                  color: Colors.white.withOpacity(_getOpacity()),
                ),
                child: DefaultTextStyle(//Creo que sobra
                  style: TextStyle(),
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  child: Semantics(//Creo que sobra
                    header: true,
                    child: const Text(
                      'Awesome and simple app bar hiding animation',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              )
          ),

          SizedBox(
            height: 80,
            child: AppBar(
              iconTheme: const IconThemeData(color: Colors.black),
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
          )


        ],
      ),
    );
  }

  double _getOpacity() {
    double op = (topPosition + 80) / 80;
    return op > 1 || op < 0 ? 1 : op;
  }
}
