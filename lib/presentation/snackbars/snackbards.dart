import 'package:flutter/material.dart';

class Snackbars extends StatelessWidget {
  const Snackbars({super.key});

  void showCustomSnackbar(BuildContext context){

    //Esto evita que se acumulen snackbars si hay muchas que tiene
    //que dibujarse
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
        content: const Text('Hola mundo'),
        action: SnackBarAction(label: 'Ok!', onPressed: () {  },),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context){
    showDialog(
        context: context,
        barrierDismissible: false, //Evitamos que se cierre el dialog por click fuera de el
        builder: (context){
          return AlertDialog(
            title: const Text('¿Estás seguro?'),
            content: const Text("Est es otro lorem ipsum bastante largo"),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancelar')
              ),

              FilledButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Aceptar')
              ),
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Snackbars y Dialogos"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            FilledButton.tonal(
                onPressed: () => openDialog(context),
                child: const Text('Mostrar Dialogo')
            ),

            FilledButton.tonal(
                onPressed: (){
                  showAboutDialog(
                      context: context,
                    children: [
                      const Text('Lorem ipsum muy largo')
                    ]
                  );
                },
                child: const Text('Licencias usadas')
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => showCustomSnackbar(context),
          icon: Icon(Icons.remove_red_eye_outlined),
          label: Text("Mostar Snackbar")
      ),
    );
  }
}
