import 'package:flutter/material.dart';

class UIControlls extends StatelessWidget {
  const UIControlls({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UI Controls"),
      ),

      body: UIControlsView(),
    );
  }
}

class UIControlsView extends StatefulWidget {
  const UIControlsView({
    super.key,
  });

  @override
  State<UIControlsView> createState() => _UIControlsViewState();
}

enum Transportation {car, plane, boat, submarine}

class _UIControlsViewState extends State<UIControlsView> {


  bool isDeveloper = false;
  Transportation selectedTransportation = Transportation.car;
  bool dinner = false;
  bool breakfast = false;
  bool lunch = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text("Developer Mode"),
            subtitle: const Text("Controles adicionales"),
            value: isDeveloper,
            onChanged:(value) => setState(() {
              isDeveloper = !isDeveloper;
            })
        ),

        ExpansionTile(
            title: const Text("Vehiculos de transporte"),
          subtitle: Text("$selectedTransportation"),
          children: [
            RadioListTile(
              title: const Text("By car"),
                subtitle: const Text("Viajar por carro"),
                value: Transportation.car,
                groupValue: selectedTransportation,
                onChanged: (value) {
                  setState(() {
                    selectedTransportation = Transportation.car;
                  });
                }
            ),

            RadioListTile(
                title: const Text("By plane"),
                subtitle: const Text("Viajar por avion"),
                value: Transportation.plane,
                groupValue: selectedTransportation,
                onChanged: (value) {
                  setState(() {
                    selectedTransportation = Transportation.plane;
                  });
                }
            ),

            RadioListTile(
                title: const Text("By boat"),
                subtitle: const Text("Viajar por barco"),
                value: Transportation.boat,
                groupValue: selectedTransportation,
                onChanged: (value) {
                  setState(() {
                    selectedTransportation = Transportation.boat;
                  });
                }
            ),

            RadioListTile(
                title: const Text("By submarine"),
                subtitle: const Text("Viajar por submarino"),
                value: Transportation.submarine,
                groupValue: selectedTransportation,
                onChanged: (value) {
                  setState(() {
                    selectedTransportation = Transportation.submarine;
                  });
                }
            ),

          ],
        ),

        CheckboxListTile(
          title: const Text("Incluir cena"),
            value: dinner,
            onChanged: (value) => setState(() {
              dinner = !dinner;
            })
        ),


        CheckboxListTile(
            title: const Text("Incluir desayuno"),
            value: breakfast,
            onChanged: (value) => setState(() {
              breakfast = !breakfast;
            })
        ),


        CheckboxListTile(
            title: const Text("Incluir comida"),
            value: lunch,
            onChanged: (value) => setState(() {
              lunch = !lunch;
            })
        )



      ],
    );
  }
}
