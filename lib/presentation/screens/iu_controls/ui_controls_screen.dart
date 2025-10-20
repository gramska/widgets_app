import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI controls + Tiles')),
      body: const _ControlsLsView(),
    );
  }
}

class _ControlsLsView extends StatefulWidget {
  const _ControlsLsView();

  @override
  State<_ControlsLsView> createState() => _ControlsLsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _ControlsLsViewState extends State<_ControlsLsView> {

  bool isDeveloper = true;
  Transportation transportation = Transportation.car;
  bool wantsBreakFast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(), //* Evitar el efecto de rebote
      children: [
        SwitchListTile(
          title: const Text('Developer mode'),
          subtitle: const Text('Opciones adicionales'),
          value: isDeveloper,
          onChanged: (value) => setState(() {
            isDeveloper = value;
          }),
        ),

        ExpansionTile(
          title: const Text('Vehiculo de transporte'),
          subtitle: Text('$transportation'),
          children: [
            RadioGroup<Transportation>(
              groupValue: transportation,
              onChanged: (Transportation? value) {
                setState(() {
                  transportation = value!;
                });
              },
              child: const Column(
                children: [
                  RadioListTile<Transportation>(
                    value: Transportation.car,
                    title: Text('By Car'),
                    subtitle: Text('Viajar por auto'),
                  ),
                  RadioListTile(
                    value: Transportation.boat,
                    title: Text('By boat'),
                    subtitle: Text('Viajar por bote'),
                  ),
                  RadioListTile(
                    value: Transportation.plane,
                    title: Text('By Plane'),
                    subtitle: Text('Viajar por avión'),
                  ),
                  RadioListTile(
                    value: Transportation.submarine,
                    title: Text('By submarine'),
                    subtitle: Text('Viajar por submarino'),
                  ),
                ],
              ),
            ),
          ],
        ),
     
        CheckboxListTile(
          title: const Text('Wants lunch?'),
          subtitle: const Text('Almuerzo?'),
          value: wantsBreakFast, 
          onChanged: (value) => setState(() {
            wantsBreakFast = !wantsBreakFast;
          })
        ),
        CheckboxListTile(
          title: const Text('Wants Dinner?'),
          subtitle: const Text('Comida?'),
          value: wantsDinner, 
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          })
        ),
        CheckboxListTile(
          title: const Text('Wants Lunch'),
          subtitle: const Text('Cena?'),
          value: wantsLunch, 
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          })
        )
      ],
    );
  }
}
