import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class InfiniteScroll extends StatefulWidget {
  const InfiniteScroll({super.key});

  @override
  State<InfiniteScroll> createState() => _InfiniteScrollState();
}

class _InfiniteScrollState extends State<InfiniteScroll> {

  final List<int> imagesIds = [1, 2, 3, 4, 5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    scrollController.addListener(() {

      //Tengo que saber cuando llego al final
      //¿Como se la posicion del scroll?
      //print(scrollController.position.pixels); --> Posicion del scroll
      //print("max" + scrollController.position.maxScrollExtent.toString()); --> tamaño maximo del scroll

      if(scrollController.position.pixels + 500 >= scrollController.position.maxScrollExtent){
        //Añadimos imagenes
        //addFiveImages(); //Pero siempre las añades, necesitamos un booleano
        loadNextPage();
      }

    });
  }

  Future loadNextPage() async{
    if(isLoading) return;
    isLoading = true;
    //Este setState lo quiero para que pinte lo que tenga que pintar
    //la pantalla mientras se hace la descarga. Por ejemplo para que
    //en los dos segundos que dura la descarga salga el ProgressIndicator
    setState(() {});

    //Hacemos peticion http
    await Future.delayed(const Duration(seconds: 2));

    addFiveImages();
    isLoading = false;

    if(!isMounted) return;

    //Y este setState lo quiero para pintar las 5 imagenes que se han
    //añadido
    setState(() {

    });

    moveScrollToBottom();

  }

  void moveScrollToBottom(){
    if(scrollController.position.pixels + 100 <= scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(
        scrollController.position.pixels + 120,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn
    );

  }

  void addFiveImages(){
    final int lastId = imagesIds.last;

    imagesIds.addAll(
      [1,2,3,4,5].map((e) => lastId + e)
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    isMounted = false;
    super.dispose();
    scrollController.dispose();
  }

  Future onRefresh() async{

    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));

    if(!isMounted) return;

    isLoading = false;
    final int lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();

    setState(() {

    });


  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          strokeWidth: 2,
          edgeOffset: 50,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (BuildContext context, int index) {
              return FadeInImage(
                width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                  placeholder: const AssetImage("assets/images/jar-loading.gif"),
                  image: NetworkImage('https://picsum.photos/id/${imagesIds[index]}/500/300')
              );
            },
          ),
        ),
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: isLoading
            ?
        SpinPerfect(
              infinite: true,
                child: const Icon(Icons.refresh_rounded)
            )
        : const Icon(Icons.arrow_back_ios_new_outlined),
      ),
    );
  }
}
