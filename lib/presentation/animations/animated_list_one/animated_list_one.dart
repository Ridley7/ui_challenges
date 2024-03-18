import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/presentation/animations/animated_list_one/bordered_container.dart';

class AnimatedListOne extends StatefulWidget {
  AnimatedListOne({super.key});

  @override
  State<AnimatedListOne> createState() => _AnimatedListOneState();
}

class _AnimatedListOneState extends State<AnimatedListOne> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<String> places = [
    "Nuwakot",
    "Dhaulagiri",
    "Rara",
    "Muktinath",
    "Pashupatinath"
  ];

  late List<String> items;

  @override
  void initState() {
    items = ["Kathmandu", "Bhaktapur", "Pokhara", "Mount Everest"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated List One"),
      ),
      backgroundColor: Colors.grey.shade300,
      body: AnimatedList(
        key: _listKey,
        initialItemCount: items.length,
        itemBuilder:
            (BuildContext context, int index, Animation<double> animation) {
          return SlideTransition(
            position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
                .animate(animation),
            child: BorderedContainer(
              margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
              padding: const EdgeInsets.all(0),
              child: ListTile(
                title: Text(items[index]),
                trailing: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _listKey.currentState!.removeItem(index,
                        (context, animation) {
                      String removedItem = items.removeAt(index);
                      return SizeTransition(
                        sizeFactor: animation,
                        axis: Axis.vertical,
                        child: BorderedContainer(
                          margin: const EdgeInsets.symmetric(
                              vertical: 4.0, horizontal: 8.0),
                          padding: const EdgeInsets.all(0),
                          child: ListTile(
                            title: Text(removedItem),
                          ),
                        ),
                      );
                    });
                    setState(() {
                      //Si hiciese falta
                    });
                  },
                ),
              ),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          places.shuffle();
          items.insert(items.length, places[0]);
          _listKey.currentState!.insertItem(items.length - 1);
          setState(() {

          });
        },
        child: const Icon(Icons.add),
      ),

    );
  }
}
